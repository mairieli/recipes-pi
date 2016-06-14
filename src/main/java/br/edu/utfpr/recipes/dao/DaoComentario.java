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
    
    public List<ComentarioReceita> buscaReceitaPorIngredientes(int idReceita) {
        session = getsession();
        String sql = "SELECT * "
                + "FROM ComentarioReceita c "
                + "WHERE c.receita_id = '" + idReceita + "'"
                + "ORDER BY dataComentario desc "
                + ") ";
        Query query = session.createSQLQuery(sql).addEntity(ComentarioReceita.class);
        return query.list();
    }
 
}
