package br.edu.utfpr.recipes.dao;

import br.edu.utfpr.recipes.entidade.Usuario;

/**
 *
 * @author mairieliw
 */
public class DaoUsuario extends DaoGenerics<Usuario> {

    public DaoUsuario() {
        super.clazz = Usuario.class;
    }

}
