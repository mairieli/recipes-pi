package br.edu.utfpr.recipes.dao;

import br.edu.utfpr.recipes.entidade.ComentarioReceita;

/**
 *
 * @author Leonardo
 */
public class DaoComentario extends DaoGenerics<ComentarioReceita> {

    public DaoComentario() {
        super.clazz = ComentarioReceita.class;
    }
}
