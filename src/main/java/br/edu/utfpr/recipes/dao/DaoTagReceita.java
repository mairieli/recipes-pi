package br.edu.utfpr.recipes.dao;

import br.edu.utfpr.recipes.entidade.Receita;
import br.edu.utfpr.recipes.entidade.TagReceita;
import java.util.List;

public class DaoTagReceita extends DaoGenerics<TagReceita> {

    public DaoTagReceita() {
        super.clazz = TagReceita.class;
    }
    
    public  List<TagReceita> buscaPorReceita(Receita receita){
      return getsession()
              .createQuery(
              "SELECT t FROM TagReceita t WHERE t.receita.id = "+receita.getId())
              .list();
    }

}