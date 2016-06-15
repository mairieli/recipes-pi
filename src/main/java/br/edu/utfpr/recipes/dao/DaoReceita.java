package br.edu.utfpr.recipes.dao;

import br.edu.utfpr.recipes.entidade.Receita;
import br.edu.utfpr.recipes.entidade.Usuario;
import java.util.List;
import org.hibernate.Query;

public class DaoReceita extends DaoGenerics<Receita> {

    public DaoReceita() {
        super.clazz = Receita.class;
    }

    /**
     * Método que recupera as receitas que contenham os ingredientes passados
     * por parâmetro.
     *
     * @author Noemi e Mairieli
     * @param nomesIngrediente lista de nomes dos ingredientes informados pelo
     * usuário
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

    /**
     * Método que recupera as receitas que contenham os ingredientes somente
     * passados por parâmetro.
     *
     * @author Mairieli
     * @param nomesIngrediente lista de nomes dos ingredientes informados pelo
     * usuário
     * @return lista de receitas
     */
    public List<Receita> buscaReceitaPorIngredientesEspecificos(List<String> nomesIngrediente) {
        session = getsession();
        String ingredientesSelecionados = " (select id from Ingrediente where nome = '" + nomesIngrediente.get(0) + "'";
        nomesIngrediente.remove(0);
        for (String nomeIngrediente : nomesIngrediente) {
            ingredientesSelecionados += " or nome = '" + nomeIngrediente + "' ";
        }
        ingredientesSelecionados += ") ";
        String sql = "SELECT * FROM Receita r "
                + "WHERE r.status = true AND r.id IN "
                + "	(SELECT DISTINCT IR.receita_id FROM itemReceita IR "
                + "	 WHERE NOT EXISTS "
                + "		(SELECT * FROM "
                + "			(SELECT Ingrediente.id FROM Ingrediente "
                + "			WHERE Ingrediente.id IN "
                + "				" + ingredientesSelecionados + ") AS I "
                + "		WHERE NOT EXISTS "
                + "            (SELECT * FROM itemReceita IR2 "
                + "             WHERE IR.receita_id = IR2.receita_id AND IR2.ingrediente_Id = I.id) "
                + ") AND r.id IN "
                + "   (SELECT DISTINCT temp.id FROM "
                + "		(SELECT r.id FROM Receita AS r, itemReceita AS ir "
                + "		 WHERE r.id = ir.receita_id "
                + "         AND ir.ingrediente_id IN " + ingredientesSelecionados + ") AS temp "
                + "	WHERE NOT EXISTS "
                + "		(SELECT * FROM itemReceita AS it "
                + "         WHERE it.ingrediente_id NOT IN " + ingredientesSelecionados
                + "		 AND temp.id=it.receita_id)"
                + "    )"
                + ")";

        Query query = session.createSQLQuery(sql).addEntity(Receita.class);
        return query.list();
    }

    public List<Receita> buscaReceitaPendentePorIngrediente(String nomeIngrediente) {
        session = getsession();
        String sql = "SELECT * "
                + "FROM Receita r "
                + "WHERE r.status = false "
                + "AND r.id IN ("
                + "    select distinct i.receita_id from itemReceita i where i.ingrediente_id in ("
                + "		select id from Ingrediente where nome = '" + nomeIngrediente + "') "
                + ") ";
        Query query = session.createSQLQuery(sql).addEntity(Receita.class);
        return query.list();
    }

    public List<Receita> buscaReceitasMelhorQualificadas() {
        session = getsession();
        String sql = "SELECT * FROM Receita r "
                + "where r.status = true "
                + "order by (r.somaQualificacao / r.quantidadeTotalDeClassificacao) desc limit 20";
        Query query = session.createSQLQuery(sql).addEntity(Receita.class);
        return query.list();
    }

    public List<Receita> buscaReceitaPorUsuario(Usuario usuario) {
        session = getsession();
        Query query = session.createQuery("SELECT r FROM Receita r WHERE r.usuario.id =:usuario_id ORDER BY r.dataCadastro DESC");
        query.setParameter("usuario_id", usuario.getId());
        return query.list();
    }
}
