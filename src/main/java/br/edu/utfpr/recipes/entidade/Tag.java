package br.edu.utfpr.recipes.entidade;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author noemi
 */
@Entity
public class Tag implements Serializable {


    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Size(max = 45)
    @Column(name = "nome")
    private String nome;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tag")
    private List<TagReceita> tagReceitaList;

    public Tag() {
    }

    public Tag(Integer idTag) {
        this.id = idTag;
    }

    public Integer getIdTag() {
        return id;
    }

    public void setIdTag(Integer idTag) {
        this.id = idTag;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tag)) {
            return false;
        }
        Tag other = (Tag) object;
        return !((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id)));
    }

    @Override
    public String toString() {
        return "br.edu.utfpr.recipes.entidade.Tag_1[ idTag=" + id + " ]";
    }

    @XmlTransient
    public List<TagReceita> getTagReceitaList() {
        return tagReceitaList;
    }

    public void setTagReceitaList(List<TagReceita> tagReceitaList) {
        this.tagReceitaList = tagReceitaList;
    }

}
