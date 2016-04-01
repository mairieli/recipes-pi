/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.io.Serializable;
import java.util.Calendar;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;

/**
 *
 * @author josimar
 */
@Entity
public class LogAcesso implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String ip;
    private String descricao;
    @Column(columnDefinition = "TEXT")
    private String cabecalho;
    private String navegador;
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Calendar dataAcesso;
    @ManyToOne
    private Usuario usuario;

    public String getIp() {
        return ip;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getCabecalho() {
        return cabecalho;
    }

    public void setCabecalho(String cabecalho) {
        this.cabecalho = cabecalho;
    }

    public Calendar getDate() {
        return dataAcesso;
    }

    public void setDate(Calendar date) {
        this.dataAcesso = date;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    

    public LogAcesso() {
        this.dataAcesso= Calendar.getInstance();
    }

    public LogAcesso(String ip, String cabecalho, Usuario usuario) {
        this.ip = ip;
        this.cabecalho = cabecalho;
        this.usuario = usuario;
        this.dataAcesso= Calendar.getInstance();
    }
    public LogAcesso(String ip, String cabecalho, Usuario usuario, String descricao,String navegador) {
        this.ip = ip;
        this.cabecalho = cabecalho;
        this.usuario = usuario;
        this.dataAcesso= Calendar.getInstance();
        this.descricao=descricao;   
        this.navegador = navegador;   
    }

    public String getNavegador() {
        return navegador;
    }

    public void setNavegador(String navegador) {
        this.navegador = navegador;
    }
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
        if (!(object instanceof LogAcesso)) {
            return false;
        }
        LogAcesso other = (LogAcesso) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "br.net.loch.scp.beans.LogAcesso[ id=" + id + " ]";
    }
    
}
