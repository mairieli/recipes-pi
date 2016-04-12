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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author mairieliw
 */
@Entity
@Table(name = "itemReceita")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ItemReceita.findAll", query = "SELECT i FROM ItemReceita i"),
    @NamedQuery(name = "ItemReceita.findByIdItem", query = "SELECT i FROM ItemReceita i WHERE i.idItem = :idItem"),
    @NamedQuery(name = "ItemReceita.findByQuantidade", query = "SELECT i FROM ItemReceita i WHERE i.quantidade = :quantidade"),
    @NamedQuery(name = "ItemReceita.findByUnidadeMedida", query = "SELECT i FROM ItemReceita i WHERE i.unidadeMedida = :unidadeMedida")})
public class ItemReceita implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idItem")
    private Integer idItem;
    @Column(name = "quantidade")
    private Integer quantidade;
    @Size(max = 45)
    @Column(name = "unidadeMedida")
    private String unidadeMedida;
    @JoinColumn(name = "idIngrediente", referencedColumnName = "idIngrediente")
    @ManyToOne(optional = false)
    private Ingrediente idIngrediente;
    @JoinColumn(name = "idReceita", referencedColumnName = "idReceita")
    @ManyToOne(optional = false)
    private Receita idReceita;

    public ItemReceita() {
    }

    public ItemReceita(Integer idItem) {
        this.idItem = idItem;
    }

    public Integer getIdItem() {
        return idItem;
    }

    public void setIdItem(Integer idItem) {
        this.idItem = idItem;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public String getUnidadeMedida() {
        return unidadeMedida;
    }

    public void setUnidadeMedida(String unidadeMedida) {
        this.unidadeMedida = unidadeMedida;
    }

    public Ingrediente getIdIngrediente() {
        return idIngrediente;
    }

    public void setIdIngrediente(Ingrediente idIngrediente) {
        this.idIngrediente = idIngrediente;
    }

    public Receita getIdReceita() {
        return idReceita;
    }

    public void setIdReceita(Receita idReceita) {
        this.idReceita = idReceita;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idItem != null ? idItem.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ItemReceita)) {
            return false;
        }
        ItemReceita other = (ItemReceita) object;
        if ((this.idItem == null && other.idItem != null) || (this.idItem != null && !this.idItem.equals(other.idItem))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.edu.utfpr.recipes.entidade.ItemReceita[ idItem=" + idItem + " ]";
    }
    
}
