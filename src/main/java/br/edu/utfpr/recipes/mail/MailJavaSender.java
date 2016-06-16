/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.utfpr.recipes.mail;

/**
 *
 * @author josimar
 */
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Multipart;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.util.Properties;
public class MailJavaSender {
    //cria as propriedades necessárias para o envio de email
    public void senderMail(final MailJava mail) throws
         UnsupportedEncodingException, MessagingException {
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.host", mail.getSmtpHostMail());
        props.setProperty("mail.smtp.auth", mail.getSmtpAuth());
        props.setProperty("mail.smtp.starttls.enable", mail.getSmtpStarttls());
        props.setProperty("mail.smtp.port", mail.getSmtpPortMail());
        props.setProperty("mail.mime.charset", mail.getCharsetMail());
 
        //classe anonima que realiza a autenticação
        //do usuario no servidor de email.
        Authenticator auth = new Authenticator() {
            @Override
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(
                                   mail.getUserMail(), mail.getPassMail()
                 );
            }
        };
 
        // Cria a sessao passando as propriedades e a autenticação
        Session session = Session.getDefaultInstance(props, auth);
        // Gera um log no console referente ao processo de envio
       // session.setDebug(true);
 
        //cria a mensagem setando o remetente e seus destinatários
        Message msg = new MimeMessage(session);
        //aqui seta o remetente
        msg.setFrom(new InternetAddress(
                          mail.getUserMail(), mail.getFromNameMail())
         );
        boolean first = true;
        for (Map.Entry<String, String> map : mail.getToMailsUsers().entrySet()) {
            if (first) {
                //setamos o 1° destinatario
                msg.addRecipient(Message.RecipientType.TO,
                          new InternetAddress(map.getKey(), map.getValue())
                 );
                first = false;
            } else {
                //setamos os demais destinatarios
                msg.addRecipient(Message.RecipientType.CC,
                          new InternetAddress(map.getKey(), map.getValue())
                 );
            }
        }
 
        // Adiciona um Assunto a Mensagem
        msg.setSubject(mail.getSubjectMail());
 
        // Cria o objeto que recebe o texto do corpo do email
        MimeBodyPart textPart = new MimeBodyPart();
        textPart.setContent(mail.getBodyMail(), mail.getTypeTextMail());
 
        // Monta a mensagem SMTP  inserindo o conteudo, texto e anexos
        Multipart mps = new MimeMultipart();
        
        for (int index = 0; index < mail.getFileMails().size(); index++) {
 
            // Cria um novo objeto para cada arquivo, e anexa o arquivo
            MimeBodyPart attachFilePart = new MimeBodyPart();
            FileDataSource fds =   new FileDataSource(
                 mail.getFileMails().get(index)
             );
            attachFilePart.setDataHandler(new DataHandler(fds));
            attachFilePart.setFileName(fds.getName());
 
            //adiciona os anexos da mensagem
            mps.addBodyPart(attachFilePart, index);
 
        }
 
        //adiciona o corpo texto da mensagem
        mps.addBodyPart(textPart);
 
        //adiciona a mensagem o conteúdo texto e anexo
        msg.setContent(mps);
 
        // Envia a Mensagem
        System.out.println("Enviando...");
        Transport.send(msg);
        System.out.println("Enviado!");
    }
 
}

