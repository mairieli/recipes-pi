package br.edu.utfpr.recipes.controller;

import br.edu.utfpr.recipes.dao.DaoUsuario;
import br.edu.utfpr.recipes.entidade.Usuario;
import br.edu.utfpr.recipes.util.Criptografia;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author josimar
 */
public class CadastroDeUsuariosServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome").trim();
        String email = request.getParameter("email").trim();
        String senha = request.getParameter("senha").trim();
        String validaSenha = request.getParameter("validaSenha").trim();
        if (!"".equals(senha) && !"".equals(email) && senha.equals(validaSenha)) {
            DaoUsuario daoUsuario = new DaoUsuario();
            Usuario usuario = daoUsuario.buscaUsuarioPorEmail(email);
            if (usuario != null) {
                request.setAttribute("message_error", "Erro: Este email ja se encotra cadastrado, por favor utilize outro");
                request.getRequestDispatcher("CadastroUsuario.jsp").forward(request, response);
            } else {
                usuario = new Usuario();
                usuario.setEmail(email);
                usuario.setNome(nome);
                Criptografia criptografia = new Criptografia();
                usuario.setSenha(criptografia.criptografar(senha));
                daoUsuario.save(usuario);

                request.getSession().setAttribute("usuarioLogado", usuario);
                request.getSession().setAttribute("message", "Cadastro Realizado com Sucesso!");
                response.sendRedirect("index.jsp");
            }
        } else {
            request.setAttribute("nome", nome);
            request.setAttribute("email", email);
            request.setAttribute("message_error", "Erro: Dados inváidos ou senhas não conferem!");
            request.getRequestDispatcher("CadastroUsuario.jsp").forward(request, response);

        }

    }

}
