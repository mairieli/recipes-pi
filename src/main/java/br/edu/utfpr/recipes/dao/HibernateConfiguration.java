package br.edu.utfpr.recipes.dao;

import br.edu.utfpr.recipes.entidade.ComentarioReceita;
import br.edu.utfpr.recipes.entidade.Ingrediente;
import br.edu.utfpr.recipes.entidade.ItemReceita;
import br.edu.utfpr.recipes.entidade.Receita;
import br.edu.utfpr.recipes.entidade.Tag;
import br.edu.utfpr.recipes.entidade.TagReceita;
import br.edu.utfpr.recipes.entidade.Usuario;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

public class HibernateConfiguration {

    //usuario banco
    public static final String userName = "root";
    // senha usuario banco
    public static final String password = "root";
    //base de dados.
    public static final String dataBase = "mydb";

    // build  valida somente uma vez
    private static Configuration cfg = null;
    private static SessionFactory factory = null;

    public static SessionFactory getSessionFactory() {
        if (cfg == null) {
            cfg = new Configuration();
            cfg.setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
            cfg.setProperty("hibernate.connection.username", userName);
            cfg.setProperty("hibernate.connection.password", password);
            cfg.setProperty("hibernate.connection.url", "jdbc:mysql://127.0.0.1:3306/" + dataBase);
            cfg.setProperty("hibernate.show_sql", "true");
            cfg.setProperty("hibernate.format_sql", "true");
            cfg.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5InnoDBDialect");
            cfg.setProperty("hibernate.connection.autocommit", "true");
            cfg.setProperty("hibernate.current_session_context_class", "thread");
            //a linha a seguir atualiza o banco automaticamente caso haja diferença entro o banco e as entidade.
            cfg.setProperty("hibernate.hbm2ddl.auto", "update");

            mapear();

            factory = cfg.buildSessionFactory();// construindo uma fabrica de sessão
        }
        return factory;
    }
    //podemos setar o autocomit como true e nao precisa usar begi tansaction

    public static void createSchema() {
        getSessionFactory().close();
        SchemaExport schemaEx = new SchemaExport(cfg);
        schemaEx.create(true, true);
    }

    public static void main(String[] args) {
        HibernateConfiguration.createSchema();
    }

    // Entidades para serem mapeadas
    private static void mapear() {
        cfg.addAnnotatedClass(Ingrediente.class);
        cfg.addAnnotatedClass(ItemReceita.class);
        cfg.addAnnotatedClass(Receita.class);
        cfg.addAnnotatedClass(Tag.class);
        cfg.addAnnotatedClass(TagReceita.class);
        cfg.addAnnotatedClass(Usuario.class);
        cfg.addAnnotatedClass(ComentarioReceita.class);
    }
    
}
