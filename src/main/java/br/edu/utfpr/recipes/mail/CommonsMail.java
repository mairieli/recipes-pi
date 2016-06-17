package br.edu.utfpr.recipes.mail;
// *
// * @author josimar
// */
import br.edu.utfpr.recipes.entidade.Receita;
import br.edu.utfpr.recipes.entidade.Usuario;
import java.net.MalformedURLException;
import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.MultiPartEmail;
import org.apache.commons.mail.SimpleEmail;

public class CommonsMail {

    public CommonsMail() throws EmailException, MalformedURLException {
    }

    /**
     * envia email simples(somente texto)
     *
     * @param assunto
     * @param usuario
     * @param receita
     */
    public void enviaEmai(Usuario usuario, Receita receita) {

        String conteudo = "Olá " + usuario.getNome() + ", sua receita " + receita.getNome() + " foi aprovada.\n"
                + "Obrigado, por sua colaboração.\n"
                + "Atenciosamente,\n"
                + "Equipe recipes-pi.";
        SimpleEmail email = new SimpleEmail();
        email.setHostName("smtp.gmail.com"); // o servidor SMTP para envio do e-mail  
        try {
            email.addTo(usuario.getEmail()); //destinatário  

            email.setFrom("contato.recipes@gmail.com", "Recipes"); // remetente  
            email.setSubject("Sua receita " + receita.getNome() + " foi aprovada."); // assunto do e-mail  
            email.setMsg(conteudo); //conteudo do e-mail  
            email.setAuthentication("contato.recipes@gmail.com", "recipespi2016");
            email.setSmtpPort(587);
            email.setSSLOnConnect(true);
            email.setStartTLSEnabled(true);
            email.send();
        } catch (EmailException ex) {
            System.out.println("Erro ao enviar email " + ex);
        }
    }

    /**
     * envia email com arquivo anexo
     *
     * @throws EmailException
     */
    public void enviaEmailComAnexo() throws EmailException {
        // cria o anexo 1.  
        EmailAttachment anexo1 = new EmailAttachment();
        anexo1.setPath("teste/teste.txt"); //caminho do arquivo (RAIZ_PROJETO/teste/teste.txt)  
        anexo1.setDisposition(EmailAttachment.ATTACHMENT);
        anexo1.setDescription("Exemplo de arquivo anexo");
        anexo1.setName("teste.txt");
        // cria o anexo 2.  
        EmailAttachment anexo2 = new EmailAttachment();
        anexo2.setPath("teste/teste2.jsp"); //caminho do arquivo (RAIZ_PROJETO/teste/teste2.jsp)  
        anexo2.setDisposition(EmailAttachment.ATTACHMENT);
        anexo2.setDescription("Exemplo de arquivo anexo");
        anexo2.setName("teste2.jsp");

        // configura o email  
        MultiPartEmail email = new MultiPartEmail();
        email.setHostName("smtp.gmail.com"); // o servidor SMTP para envio do e-mail  
        email.addTo("teste@gmail.com", "Guilherme"); //destinatário  
        email.setFrom("teste@gmail.com", "Eu"); // remetente  
        email.setSubject("Teste -> Email com anexos"); // assunto do e-mail  
        email.setMsg("Teste de Email utilizando commons-email"); //conteudo do e-mail  
        email.setAuthentication("teste", "xxxxx");
        email.setSmtpPort(587);
        email.setSSL(true);
        email.setTLS(true);

        // adiciona arquivo(s) anexo(s)  
        email.attach(anexo1);
        email.attach(anexo2);
        // envia o email  
        email.send();
    }

    /**
     * Envia email no formato HTML
     *
     * @param assunto
     * @param destinatario
     * @param conteudo
     * @throws EmailException
     * @throws MalformedURLException
     */
    public void enviaEmailFormatoHtml(String assunto, String destinatario, String conteudo) throws EmailException, MalformedURLException {

        HtmlEmail email = new HtmlEmail();

        // adiciona uma imagem ao corpo da mensagem e retorna seu id  
        // URL url = new URL("http://www.apache.org/images/asf_logo_wide.gif");  
        // String cid = email.embed(url, "Apache logo");     
        // configura a mensagem para o formato HTML  
        email.setHtmlMsg(conteudo);

        // configure uma mensagem alternativa caso o servidor não suporte HTML  
        email.setTextMsg("Seu servidor de e-mail não suporta mensagem HTML");
        /*
         *  email.setHostName("smtp.gmail.com"); // o servidor SMTP para envio do e-mail  
         email.addTo(mails); //destinatário  
         email.setSubject(assunto); // assunto do e-mail  
         email.setMsg(conteudo + "\n\n(Este Email foi enviado a partir da intranet do Grupo Aion)--."); //conteudo do e-mail  
         */
        email.setHostName("smtp.gmail.com"); // o servidor SMTP para envio  do e-mail  
        email.addTo(destinatario); //destinatário  
        email.setFrom("contato.recipes@gmail.com", "Recipes"); // remetente  
        // email.setFrom("teste@gmail.com", "Eu"); // remetente  
        email.setSubject(assunto); // assunto do e-mail  
        // email.setMsg("Teste de Email HTML utilizando commons-email"); //conteudo do e-mail  
        //email.setAuthentication("teste", "xxxxx");  
        email.setAuthentication("contato.recipes@gmail.com", "recipespi2016");
        email.setSmtpPort(587);
        email.setSSLOnConnect(true);
        email.setStartTLSEnabled(true);
        // envia email  
        email.send();
    }


}
