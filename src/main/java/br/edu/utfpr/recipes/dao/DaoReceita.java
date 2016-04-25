package br.edu.utfpr.recipes.dao;

import br.edu.utfpr.recipes.entidade.Ingrediente;
import br.edu.utfpr.recipes.entidade.Receita;
import java.util.ArrayList;

import org.hibernate.Query;

/**
 *
 * @author mairieliw
 */
public class DaoReceita extends DaoGenerics<Receita> {

    public DaoReceita() {
        super.clazz = Receita.class;
    }

    public ArrayList<Receita> BuscaIngredienteEspecificado(ArrayList<Ingrediente> nomeIngrediente) {
        ArrayList<Receita> receita = null;
        session = getsession();
        Query query = session.createQuery("From " + clazz.getSimpleName() + " where lower(nome) =:nome ");
        receita = (ArrayList<Receita>) query.setParameter("nome", nomeIngrediente).uniqueResult();
        return null;
    }

}
