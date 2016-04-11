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
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author bruno
 */
@Entity
@Table(name = "Receita")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Receita.findAll", query = "SELECT r FROM Receita r"),
    @NamedQuery(name = "Receita.findByIdReceita", query = "SELECT r FROM Receita r WHERE r.idReceita = :idReceita"),
    @NamedQuery(name = "Receita.findByNome", query = "SELECT r FROM Receita r WHERE r.nome = :nome"),
    @NamedQuery(name = "Receita.findByModoPreparo", query = "SELECT r FROM Receita r WHERE r.modoPreparo = :modoPreparo"),
    @NamedQuery(name = "Receita.findByRendimento", query = "SELECT r FROM Receita r WHERE r.rendimento = :rendimento"),
    @NamedQuery(name = "Receita.findByTempoPreparo", query = "SELECT r FROM Receita r WHERE r.tempoPreparo = :tempoPreparo"),
    @NamedQuery(name = "Receita.findByDificuldade", query = "SELECT r FROM Receita r WHERE r.dificuldade = :dificuldade"),
    @NamedQuery(name = "Receita.findByCategoria", query = "SELECT r FROM Receita r WHERE r.categoria = :categoria"),
    @NamedQuery(name = "Receita.findByStatus", query = "SELECT r FROM Receita r WHERE r.status = :status")})
public class Receita implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idReceita")
    private Integer idReceita;
    @Size(max = 45)
    @Column(name = "nome")
    private String nome;
    @Size(max = 45)
    @Column(name = "modoPreparo")
    private String modoPreparo;
    @Size(max = 45)
    @Column(name = "rendimento")
    private String rendimento;
    @Size(max = 45)
    @Column(name = "tempoPreparo")
    private String tempoPreparo;
    @Size(max = 45)
    @Column(name = "dificuldade")
    private String dificuldade;
    @Size(max = 45)
    @Column(name = "categoria")
    private String categoria;
    @Column(name = "status")
    private Boolean status;
    @Lob
    @Column(name = "imagem")
    private byte[] imagem;
    @JoinColumn(name = "idUsuario", referencedColumnName = "idUsuario")
    @ManyToOne(optional = false)
    private Usuario idUsuario;

    public Receita() {
    }

    public Receita(Integer idReceita) {
        this.idReceita = idReceita;
    }

    public Integer getIdReceita() {
        return idReceita;
    }

    public void setIdReceita(Integer idReceita) {
        this.idReceita = idReceita;
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

    public String getRendimento() {
        return rendimento;
    }

    public void setRendimento(String rendimento) {
        this.rendimento = rendimento;
    }

    public String getTempoPreparo() {
        return tempoPreparo;
    }

    public void setTempoPreparo(String tempoPreparo) {
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

    public byte[] getImagem() {
        return imagem;
    }

    public void setImagem(byte[] imagem) {
        this.imagem = imagem;
    }

    public Usuario getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Usuario idUsuario) {
        this.idUsuario = idUsuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idReceita != null ? idReceita.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Receita)) {
            return false;
        }
        Receita other = (Receita) object;
        if ((this.idReceita == null && other.idReceita != null) || (this.idReceita != null && !this.idReceita.equals(other.idReceita))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.edu.utfpr.recipes.entidade.Receita[ idReceita=" + idReceita + " ]";
    }

}
