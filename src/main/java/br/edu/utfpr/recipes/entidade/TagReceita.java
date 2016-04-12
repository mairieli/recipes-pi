/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.utfpr.recipes.entidade;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author mairieliw
 */
@Entity
@Table(name = "TagReceita")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TagReceita.findAll", query = "SELECT t FROM TagReceita t"),
    @NamedQuery(name = "TagReceita.findByIdTags", query = "SELECT t FROM TagReceita t WHERE t.idTags = :idTags")})
public class TagReceita implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idTags")
    private Integer idTags;
    @JoinColumn(name = "idReceita", referencedColumnName = "idReceita")
    @ManyToOne(optional = false)
    private Receita idReceita;
    @JoinColumn(name = "idTag", referencedColumnName = "idTag")
    @ManyToOne(optional = false)
    private Tag idTag;

    public TagReceita() {
    }

    public TagReceita(Integer idTags) {
        this.idTags = idTags;
    }

    public Integer getIdTags() {
        return idTags;
    }

    public void setIdTags(Integer idTags) {
        this.idTags = idTags;
    }

    public Receita getIdReceita() {
        return idReceita;
    }

    public void setIdReceita(Receita idReceita) {
        this.idReceita = idReceita;
    }

    public Tag getIdTag() {
        return idTag;
    }

    public void setIdTag(Tag idTag) {
        this.idTag = idTag;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTags != null ? idTags.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TagReceita)) {
            return false;
        }
        TagReceita other = (TagReceita) object;
        if ((this.idTags == null && other.idTags != null) || (this.idTags != null && !this.idTags.equals(other.idTags))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.edu.utfpr.recipes.entidade.TagReceita[ idTags=" + idTags + " ]";
    }
    
}
