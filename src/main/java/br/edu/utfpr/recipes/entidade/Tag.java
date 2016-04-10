package br.edu.utfpr.recipes.entidade;

/**
 *
 * @author noemi
 */
public class Tag  {
    
    private int idTag;
    private String nome;

    public Tag() {
    }

    public Tag(int idTag, String nome) {
        this.idTag = idTag;
        this.nome = nome;
    }
    

    public int getIdTag() {
        return idTag;
    }

    public void setIdTag(int idTag) {
        this.idTag = idTag;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    
}
