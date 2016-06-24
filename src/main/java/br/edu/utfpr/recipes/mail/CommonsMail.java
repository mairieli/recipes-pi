package br.edu.utfpr.recipes.mail;

import br.edu.utfpr.recipes.entidade.Receita;
import br.edu.utfpr.recipes.entidade.Usuario;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;

public class CommonsMail {

    public void enviaEmailReceita(final Usuario usuario, final Receita receita) {
        new Thread() {
            @Override
            public void run() {
                try {
                    enviarEmail(usuario, receita);
                } catch (UnsupportedEncodingException | MessagingException ex) {
                    System.out.println("!!!!!!!!Erro ao Enviar email!!!!!!");
                    Logger.getLogger(CommonsMail.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }.start();
    }

    public void enviarEmail(Usuario usuario, Receita receita) throws UnsupportedEncodingException, MessagingException {
        String conteudo = "Olá <b>" + usuario.getNome().toUpperCase() + "</b>,<br/> sua receita <b>" + receita.getNome() + "</b> foi aprovada.<br/>"
                + "Obrigado, por sua colaboração.<br/>"
                + "Atenciosamente,<br/>"
                + "Equipe recipes-pi.";
        MailJava mj = new MailJava();
        Map<String, String> map = new HashMap<>();
        map.put(usuario.getEmail(), usuario.getEmail());
        //configuracoes de envio
        mj.setSmtpHostMail("mail.loch.net.br");
        mj.setSmtpPortMail("25");
        mj.setSmtpAuth("false");
        mj.setSmtpStarttls("false");
        mj.setUserMail("recipes-pi@loch.net.br");
        mj.setFromNameMail("Recipes Pi");
        mj.setPassMail("recipespi2016");
        mj.setCharsetMail("ISO-8859-1");
        mj.setSubjectMail("Sua receita " + receita.getNome() + " foi aprovada.");
        mj.setBodyMail(conteudo);
        mj.setTypeTextMail(MailJava.TYPE_TEXT_HTML);
        mj.setToMailsUsers(map);
        mj.setFileMails(new ArrayList<String>());

        new MailJavaSender().senderMail(mj);
    }
}
