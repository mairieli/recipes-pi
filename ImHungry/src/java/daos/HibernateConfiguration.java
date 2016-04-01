/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package daos;

/**
 *
 * @author Josimar
 */


import beans.Categoria;
import beans.Comentario;
import beans.FotoReceita;
import beans.Ingrediente;
import beans.ItemReceita;
import beans.LogAcesso;
import beans.Receita;
import beans.UnidadeMedida;
import beans.Usuario;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.tool.hbm2ddl.SchemaExport;


/**
 *
 * @author josimar
 */
public class HibernateConfiguration {
    public static final String userName = "root";
    public static final String password = "senha";
    public static final String dataBase = "imhungry";
    
    // configuracões somente uma vez 
    // build  valida somente uma vez
    // build  valida somente uma vez
    // Session uma sessão para cada transação ou um conjunto de transações

    private static AnnotationConfiguration cfg = null;
    private static SessionFactory factory = null;

    public static SessionFactory getSessionFactory() {
        if (cfg == null) {
            cfg = new AnnotationConfiguration();
            cfg.setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
            cfg.setProperty("hibernate.connection.username", userName);
            cfg.setProperty("hibernate.connection.password", password);
            //cfg.setProperty("hibernate.connection.url", "jdbc:mysql://ec2-23-21-211-172.compute-1.amazonaws.com:3306/"+dataBase);
            cfg.setProperty("hibernate.connection.url", "jdbc:mysql://127.0.0.1:3306/"+dataBase);
            cfg.setProperty("hibernate.show_sql", "true");
            cfg.setProperty("hibernate.format_sql", "true");
            cfg.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5InnoDBDialect");
            cfg.setProperty("hibernate.connection.autocommit", "true");
            cfg.setProperty("hibernate.current_session_context_class", "thread");
             cfg.setProperty("hibernate.hbm2ddl.auto", "update");
           cfg.addAnnotatedClass(Categoria.class); // classes para serem mapeadas
           cfg.addAnnotatedClass(Comentario.class); // classes para serem mapeadas
           cfg.addAnnotatedClass(FotoReceita.class); // classes para serem mapeadas
           cfg.addAnnotatedClass(Ingrediente.class); // classes para serem mapeadas
           cfg.addAnnotatedClass(ItemReceita.class); // classes para serem mapeadas
           cfg.addAnnotatedClass(Receita.class); // classes para serem mapeadas
           cfg.addAnnotatedClass(UnidadeMedida.class); // classes para serem mapeadas
           cfg.addAnnotatedClass(Usuario.class); // classes para serem mapeadas
           cfg.addAnnotatedClass(LogAcesso.class); // classes para serem mapeadas
         

            factory = cfg.buildSessionFactory();// construindo uma fabrica de sessão
        }
        return factory;
    }
    //podemos setar o autocomit como true e nao precisa usar begi tansaction

    public static void createSchema() {
        getSessionFactory().close();
        org.hibernate.tool.hbm2ddl.SchemaExport schemaEx = new SchemaExport(cfg);
        schemaEx.create(true, true);
    }
    
   
    
    public static void main(String[] args) {
        HibernateConfiguration.createSchema();
    }
}
