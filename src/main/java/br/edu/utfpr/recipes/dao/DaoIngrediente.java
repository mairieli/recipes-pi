package br.edu.utfpr.recipes.dao;

import static br.edu.utfpr.recipes.dao.DaoGenerics.session;
import br.edu.utfpr.recipes.entidade.Ingrediente;
import org.hibernate.Query;

/**
 *
 * @author noemi
 */
public class DaoIngrediente extends DaoGenerics<Ingrediente> {

    public DaoIngrediente() {
        super.clazz = Ingrediente.class;
    }

    public Ingrediente buscarPorNome(String nome) {
        Ingrediente ingrediente = null;
        if (!nome.isEmpty()) {
            session = getsession();
            Query query = session.createQuery(
                    "From " + clazz.getSimpleName() + " where lower(nome) =:nome ");
            ingrediente = (Ingrediente) query.setParameter("nome", nome.toLowerCase()).uniqueResult();
            session.flush();
        }
        return ingrediente;
    }

}
