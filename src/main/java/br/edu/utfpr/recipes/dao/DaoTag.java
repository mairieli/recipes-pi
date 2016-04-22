package br.edu.utfpr.recipes.dao;

import br.edu.utfpr.recipes.entidade.Tag;
import org.hibernate.Query;

/**
 *
 * @author mairieliw
 */
public class DaoTag extends DaoGenerics<Tag> {

    public DaoTag() {
        super.clazz = Tag.class;
    }
    
    public Tag buscarPorNome(String nome) {
        Tag tag = null;
        if (!nome.isEmpty()) {
            session = getsession();
            Query query = session.createQuery(
                    "From " + clazz.getSimpleName() + " where lower(nome) =:nome ");
            tag = (Tag) query.setParameter("nome", nome.toLowerCase()).uniqueResult();
            session.flush();
        }
        return tag;
    }

}
