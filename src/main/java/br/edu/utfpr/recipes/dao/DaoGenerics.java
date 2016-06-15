package br.edu.utfpr.recipes.dao;

import br.edu.utfpr.recipes.entidade.Usuario;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class DaoGenerics<T> {

    protected static Session session;
    protected Class clazz;

    public DaoGenerics() {

    }

    protected Session getsession() {
        if (session == null) {
            session = HibernateConfiguration.getSessionFactory().openSession();
            return session;
        } else if (!session.isConnected()) {
            session = HibernateConfiguration.getSessionFactory().openSession();
            return session;
        } else {
            return session;

        }
    }

    public void save(T o) {
        getsession().saveOrUpdate(o);
        getsession().flush();

    }

    public void update(T o) {
        getsession().update(o);
        getsession().flush();
    }

    public void delete(T o) {
        session = HibernateConfiguration.getSessionFactory().openSession();
        session.delete(o);
        session.flush();
    }

    public T findById(int id) {
        T objeto = null;
        if (id > 0) {
            session = getsession();
            Query query = session.createQuery(
                    "From " + clazz.getSimpleName() + " where id =:id ");
            objeto = (T) query.setParameter("id", id).uniqueResult();
        }
        return objeto;
    }

    public T obterParaExcluir(int id) {
        T objeto = null;
        if (id > 0) {
            session = getsession();
            Query query = session.createQuery(
                    "From " + clazz.getSimpleName() + " where id =:id ");
            objeto = (T) query.setParameter("id", id).uniqueResult();
            session.close();
        }
        return objeto;
    }

    public T obterPorId(String id) {
        T objeto = null;
        if (id != null) {
            session = getsession();
            Query query = session.createQuery(
                    "From " + clazz.getSimpleName() + " where id =:id ");
            objeto = (T) query.setParameter("id", id).uniqueResult();
        }
        return objeto;
    }

    public List<T> list(String filtro) {
        List<T> lista = null;
        if (filtro != null) {
            session = HibernateConfiguration.getSessionFactory().openSession();
            Query query = session.createQuery(filtro);
            lista = query.list();
        }
        return lista;
    }

    public List<T> listAll() {
        session = HibernateConfiguration.getSessionFactory().openSession();
        Query query = session.createQuery("From " + clazz.getSimpleName());
        List<T> lista = query.list();
        return lista;
    }

    public List<T> obterPorIdUsuario(Usuario usuario) {
        session = HibernateConfiguration.getSessionFactory().openSession();
        Query query = session.createQuery(
                "From " + clazz.getSimpleName() + " o where o.usuario.id = " + usuario.getId());
        return query.list();
    }

}
