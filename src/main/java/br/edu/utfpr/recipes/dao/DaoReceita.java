package br.edu.utfpr.recipes.dao;

import br.edu.utfpr.recipes.entidade.Receita;
import java.util.List;
import org.hibernate.Query;

/**
 *
 * @author mairieliw
 */
public class DaoReceita extends DaoGenerics<Receita> {

    public DaoReceita() {
        super.clazz = Receita.class;
    }

    /**
     * Método que recupera as receitas que contenham os ingredientes passados 
     * por parâmetro.
     *
     * @author Noemi e Mairieli
     * @param nomesIngrediente lista de nomes dos ingredientes informados pelo usuário
     * @return lista de receitas
     */
    public List<Receita> buscaReceitaPorIngredientes(List<String> nomesIngrediente) {
        session = getsession();
        String sql = "SELECT * "
                + "FROM Receita r "
                + "WHERE r.status = true "
                + "AND r.id IN ("
                + "    select distinct i.receita_id from itemReceita i where i.ingrediente_id in ("
                + "		select id from Ingrediente where nome = '" + nomesIngrediente.get(0) + "') "
                + ") ";
        nomesIngrediente.remove(0);
        for (String nomeIngrediente : nomesIngrediente) {
            sql += " AND r.id IN ("
                    + "	select distinct i.receita_id from itemReceita i where i.ingrediente_id in ("
                    + "		select id from Ingrediente where nome = '" + nomeIngrediente + "') "
                    + ") ";
        }
        Query query = session.createSQLQuery(sql).addEntity(Receita.class);
        return query.list();
    }

}
