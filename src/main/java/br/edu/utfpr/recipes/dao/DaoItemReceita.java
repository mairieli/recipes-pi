/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.utfpr.recipes.dao;

import br.edu.utfpr.recipes.entidade.ItemReceita;

/**
 *
 * @author Leonardo
 */
public class DaoItemReceita extends DaoGenerics<ItemReceita>{

    /**
     *
     */
    public DaoItemReceita() {
        super.clazz = ItemReceita.class;
    }
}
