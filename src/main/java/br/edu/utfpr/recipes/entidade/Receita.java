package br.edu.utfpr.recipes.entidade;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "Receita")
public class Receita implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Size(max = 45)
    @Column(name = "nome")
    private String nome;
    @Column(name = "modoPreparo", columnDefinition = "LONGTEXT")
    private String modoPreparo;
    @Column(name = "rendimento")
    private Integer rendimento;
    @Column(name = "tempoPreparo")
    private Integer tempoPreparo;
    @Size(max = 45)
    @Column(name = "dificuldade")
    private String dificuldade;
    @Size(max = 45)
    @Column(name = "categoria")
    private String categoria;
    @Column(name = "status")
    private Boolean status;
    @ManyToOne(optional = true)
    private Usuario usuario;
    @Column(name = "imagem", columnDefinition = "LONGBLOB")
    private byte[] imagem;
    @Column(name = "imagemMini", columnDefinition = "LONGBLOB")
    private byte[] imagemMini;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "receita")
    private List<ItemReceita> itemReceitaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "receita")
    private List<TagReceita> tagReceitaList;
    @Size(max = 45)
    @Column(name = "quantidadeTotalDeClassificacao", nullable = false, columnDefinition = "int default 0")
    private int quantidadeTotalDeClassificacao;
    @Column(nullable = false)
    private double somaQualificacao;

    public Receita(Integer idReceita) {
        this.id = idReceita;
    }

    public void qualifica(double nota) {
       this.quantidadeTotalDeClassificacao++;
       this.somaQualificacao+=nota;
    }

    public Receita() {
    }

    public Integer getId() {
        return id;
    }

    public void setIdReceita(Integer idReceita) {
        this.id = idReceita;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getModoPreparo() {
        return modoPreparo;
    }

    public void setModoPreparo(String modoPreparo) {
        this.modoPreparo = modoPreparo;
    }

    public Integer getRendimento() {
        return rendimento;
    }

    public void setRendimento(Integer rendimento) {
        this.rendimento = rendimento;
    }

    public Integer getTempoPreparo() {
        return tempoPreparo;
    }

    public void setTempoPreparo(Integer tempoPreparo) {
        this.tempoPreparo = tempoPreparo;
    }

    public String getDificuldade() {
        return dificuldade;
    }

    public void setDificuldade(String dificuldade) {
        this.dificuldade = dificuldade;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public int getQuantidadeTotalDeClassificacao() {
        return quantidadeTotalDeClassificacao;
    }

    public void setQuantidadeTotalDeClassificacao(int quantidadeTotalDeClassificacao) {
        this.quantidadeTotalDeClassificacao = quantidadeTotalDeClassificacao;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Receita)) {
            return false;
        }
        Receita other = (Receita) object;
        return !((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id)));
    }

    @Override
    public String toString() {
        return "br.edu.utfpr.recipes.entidade.Receita[ idReceita=" + id + " ]";
    }

    public byte[] getImagem() {
        return imagem;
    }

    public void setImagem(byte[] imagem) {
        this.imagem = imagem;
    }

    @XmlTransient
    public List<ItemReceita> getItemReceitaList() {
        return itemReceitaList;
    }

    public void setItemReceitaList(List<ItemReceita> itemReceitaList) {
        this.itemReceitaList = itemReceitaList;
    }

    @XmlTransient
    public List<TagReceita> getTagReceitaList() {
        return tagReceitaList;
    }

    public void setTagReceitaList(List<TagReceita> tagReceitaList) {
        this.tagReceitaList = tagReceitaList;
    }

    public byte[] getImagemMini() {
        return imagemMini;
    }

    public void setImagemMini(byte[] imagemMini) {
        this.imagemMini = imagemMini;
    }

    public double getSomaQualificacao() {
        return somaQualificacao;
    }

    public void setSomaQualificacao(double somaQualificacao) {
        this.somaQualificacao = somaQualificacao;
    }
    
    public double mediaQualificacao(){
        if(quantidadeTotalDeClassificacao == 0) {
            return 0;
        }else{
            return somaQualificacao/quantidadeTotalDeClassificacao;
        }
    }

}