package br.edu.utfpr.recipes.controller;

import br.edu.utfpr.recipes.dao.DaoReceita;
import br.edu.utfpr.recipes.entidade.Receita;
import java.util.Collections;
import java.util.List;

public class MelhoresReceitasController {

    public List<Receita> escolheReceitasParaExibir() {
        DaoReceita daoReceita = new DaoReceita();
        List<Receita> receitas = daoReceita.buscaReceitasMelhorQualificadas();
        Collections.shuffle(receitas);
        int quantidadeReceitasSelecionadas = receitas.size() < 6 ? receitas.size() : 6;
        return receitas.subList(0, quantidadeReceitasSelecionadas);
    }

}
