package br.edu.utfpr.recipes.mail;

import br.edu.utfpr.recipes.entidade.Receita;
import br.edu.utfpr.recipes.entidade.Usuario;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class CommonsMail {

    /**
     * envia email simples(somente texto)
     *
     * @param usuario
     * @param receita
     */
    public void enviaEmail(Usuario usuario, Receita receita) {

        String conteudo = "Olá " + usuario.getNome() + ", sua receita " + receita.getNome() + " foi aprovada.\n"
                + "Obrigado, por sua colaboração.\n"
                + "Atenciosamente,\n"
                + "Equipe recipes-pi.";
        SimpleEmail email = new SimpleEmail();
        email.setHostName("smtp.gmail.com");
        try {
            email.addTo(usuario.getEmail());

            email.setFrom("contato.recipes@gmail.com", "Recipes");
            email.setSubject("Sua receita " + receita.getNome() + " foi aprovada.");
            email.setMsg(conteudo);
            email.setAuthentication("contato.recipes@gmail.com", "recipespi2016");
            email.setSmtpPort(587);
            email.setSSLOnConnect(true);
            email.setStartTLSEnabled(true);
            email.send();
        } catch (EmailException ex) {
            System.out.println("Erro ao enviar email " + ex);
        }
    }

    public void enviaEmailReceita(final Usuario usuario, final Receita receita) {
        new Thread() {
            @Override
            public void run() {
                enviaEmail(usuario, receita);
            }
        }.start();
    }
}
