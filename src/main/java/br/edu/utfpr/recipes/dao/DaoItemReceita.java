package br.edu.utfpr.recipes.dao;

import br.edu.utfpr.recipes.entidade.ItemReceita;
import br.edu.utfpr.recipes.entidade.Receita;
import java.util.List;

/**
 *
 * @author Leonardo
 */
public class DaoItemReceita extends DaoGenerics<ItemReceita> {

    public DaoItemReceita() {
        super.clazz = ItemReceita.class;
    }

    public  List<ItemReceita> buscaPorReceita(Receita receita){
      return getsession()
              .createQuery(
              "SELECT t FROM ItemReceita t WHERE t.receita.id = "+receita.getId())
              .list();
    }
}
