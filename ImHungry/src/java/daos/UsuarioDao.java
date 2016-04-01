/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import beans.Usuario;
import org.hibernate.Query;
import org.hibernate.Session;


/**
 *
 * @author josi
 */
public class UsuarioDao extends DaoGenerics<Usuario> {

    public UsuarioDao() {
       clazz = Usuario.class;
    }
   public Usuario getByEmail(String email){
        Session s = getsession();
        Query query = s.createQuery("SELECT U FROM Usuario U WHERE U.email =:email")
                .setParameter("email", email);
        Usuario u = (Usuario) query.uniqueResult();
        s.flush();
        return u;
   }
        
    
}
