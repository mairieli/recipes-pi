package br.edu.utfpr.recipes.dao;

import static br.edu.utfpr.recipes.dao.DaoGenerics.session;
import br.edu.utfpr.recipes.entidade.ComentarioReceita;
import br.edu.utfpr.recipes.entidade.Usuario;
import java.util.List;
import org.hibernate.Query;

public class DaoComentario extends DaoGenerics<ComentarioReceita> {

    public DaoComentario() {
        super.clazz = ComentarioReceita.class;
    }

    public List<ComentarioReceita> buscaComentarioDaReceita(int idReceita) {
        session = getsession();
        Query query = session.createQuery("SELECT c FROM ComentarioReceita c WHERE c.receita.id =" + idReceita + " ORDER BY c.dataComentario DESC");
        return query.list();
    }

    public List<ComentarioReceita> buscaComentarioPorUsuario(Usuario usuario) {
        session = getsession();
        Query query = session.createQuery("SELECT c FROM ComentarioReceita c WHERE c.usuario.id =:usuario_id  ORDER BY c.dataComentario DESC");
        query.setParameter("usuario_id", usuario.getId());
        return query.list();
    }

}
