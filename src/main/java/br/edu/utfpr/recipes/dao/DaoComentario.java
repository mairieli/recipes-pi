package br.edu.utfpr.recipes.dao;

import static br.edu.utfpr.recipes.dao.DaoGenerics.session;
import br.edu.utfpr.recipes.entidade.ComentarioReceita;
import br.edu.utfpr.recipes.entidade.Receita;
import java.util.List;
import org.hibernate.Query;

/**
 *
 * @author Leonardo
 */
public class DaoComentario extends DaoGenerics<ComentarioReceita> {

    public DaoComentario() {
        super.clazz = ComentarioReceita.class;
    }
    
    public List<ComentarioReceita> buscaReceitaPorIngredientes(String idReceita) {
        session = getsession();
        String sql = "SELECT * "
                + "FROM ComentarioReceita c "
                + "WHERE c.id IN ( "
                + "     select id from Receita where id = '" + idReceita + "') "
                + ") ";
        Query query = session.createSQLQuery(sql).addEntity(ComentarioReceita.class);
        return query.list();
    }

}
