package br.edu.utfpr.recipes.dao;

import br.edu.utfpr.recipes.entidade.Ingrediente;
import br.edu.utfpr.recipes.entidade.Receita;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;

/**
 *
 * @author mairieliw
 */
public class DaoReceita extends DaoGenerics<Receita> {

    public DaoReceita() {
        super.clazz = Receita.class;
    }

    public List<Receita> BuscaIngredienteEspecificado(ArrayList<Ingrediente> ingreditentes) {
        session = getsession();
        String hql = "i.ingrediente.nome = ";
        if (ingreditentes.isEmpty()) {
            System.out.println("Lista de ingredientes vazia.");
        } else {
            for (int i = 0; i < ingreditentes.size(); i++) {
                Ingrediente ingrediente = ingreditentes.get(i);
                if (ingreditentes.size() > 1 && i < ingreditentes.size() - 1) {
                    hql += "'" + ingrediente.getNome() + "' AND i.ingrediente.nome = ";
                } else if (i == ingreditentes.size() - 1) {
                    hql += "'" + ingrediente.getNome() + "'";
                } else {
                    hql += "'" + ingrediente.getNome() + "'";
                }
            }

        }
        Query query = session.createQuery("select i.receita FROM ItemReceita i WHERE " + hql);
        return query.list();

    }

}
