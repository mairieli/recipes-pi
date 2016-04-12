package br.edu.utfpr.recipes.entidade;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author noemi
 */
@Entity
@Table(name = "Tag")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tag_1.findAll", query = "SELECT t FROM Tag_1 t"),
    @NamedQuery(name = "Tag_1.findByIdTag", query = "SELECT t FROM Tag_1 t WHERE t.idTag = :idTag"),
    @NamedQuery(name = "Tag_1.findByNome", query = "SELECT t FROM Tag_1 t WHERE t.nome = :nome")})
public class Tag implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idTag")
    private List<TagReceita> tagReceitaList;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idTag")
    private Integer idTag;
    @Size(max = 45)
    @Column(name = "nome")
    private String nome;

    public Tag() {
    }

    public Tag(Integer idTag) {
        this.idTag = idTag;
    }

    public Integer getIdTag() {
        return idTag;
    }

    public void setIdTag(Integer idTag) {
        this.idTag = idTag;
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
        hash += (idTag != null ? idTag.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tag)) {
            return false;
        }
        Tag other = (Tag) object;
        return !((this.idTag == null && other.idTag != null) || (this.idTag != null && !this.idTag.equals(other.idTag)));
    }

    @Override
    public String toString() {
        return "br.edu.utfpr.recipes.entidade.Tag_1[ idTag=" + idTag + " ]";
    }

    @XmlTransient
    public List<TagReceita> getTagReceitaList() {
        return tagReceitaList;
    }

    public void setTagReceitaList(List<TagReceita> tagReceitaList) {
        this.tagReceitaList = tagReceitaList;
    }

}
