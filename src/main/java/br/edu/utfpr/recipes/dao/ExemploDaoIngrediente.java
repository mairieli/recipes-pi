/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.utfpr.recipes.dao;

import br.edu.utfpr.recipes.entidade.Ingrediente;

/**
 *
 * @author josimar
 */
public class ExemploDaoIngrediente extends DaoGenerics<Ingrediente> {

    //Obrigatório metodo contrutor vazio setando a variavel clazz
    //da classe mãe conforme exemplo.

    public ExemploDaoIngrediente() {
        super.clazz = Ingrediente.class;
    }

    public static void main(String[] args) {
        Ingrediente i = new Ingrediente();
        i.setNome("teste");
        
      ExemploDaoIngrediente ei = new ExemploDaoIngrediente();
              ei.save(i);
              System.out.println(ei.findById(2));
    }

}
