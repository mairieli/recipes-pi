package br.edu.utfpr.recipes.dao;

import br.edu.utfpr.recipes.entidade.Ingrediente;
import br.edu.utfpr.recipes.entidade.Receita;
import java.sql.ResultSet;
import org.hibernate.Query;

/**
 *
 * @author mairieliw
 */
public class DaoReceita extends DaoGenerics<Receita> {

    public DaoReceita() {
        super.clazz = Receita.class;
    }

    public Receita BuscaIngredienteEspecificado(String nomeIngrediente) {
        Receita receita = null;
        session = getsession();
        Query query = session.createQuery("From " + clazz.getSimpleName() + " where lower(nome) =:nome ");
        receita = (Receita) query.setParameter("nome", nomeIngrediente.toLowerCase()).uniqueResult();

        return receita;
    }

}
