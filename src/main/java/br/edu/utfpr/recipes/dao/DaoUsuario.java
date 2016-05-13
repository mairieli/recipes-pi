package br.edu.utfpr.recipes.dao;

import br.edu.utfpr.recipes.entidade.Usuario;
import org.hibernate.Query;

/**
 *
 * @author mairieliw
 */
public class DaoUsuario extends DaoGenerics<Usuario> {

    public DaoUsuario() {
        super.clazz = Usuario.class;
    }

    public Usuario buscaUsuarioPorEmail(String email) {
        session = HibernateConfiguration.getSessionFactory().openSession();
        Query query = session.createQuery(
                    "From " + clazz.getSimpleName() + " where email =:email ");
        Usuario usuario = (Usuario) query.setParameter("email", email).uniqueResult();
        return usuario;
    }
}
