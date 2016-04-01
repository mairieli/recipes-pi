/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app;

import beans.LogAcesso;
import beans.Usuario;
import daos.LogAcessoDao;
import daos.UsuarioDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.Criptografia;

/**
 *
 * @author Josi
 */
public class UsuarioManager extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UsuarioManager</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UsuarioManager at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //  processRequest(request, response);
        request.getSession().removeAttribute("UsuarioLogado");
        response.sendRedirect("index.jsp");
    }

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
        UsuarioDao ud = new UsuarioDao();
        String action = request.getParameter("action");
        if (null != action) {
            switch (action) {
                case "login": {
                    String email = request.getParameter("email");
                    String senha = request.getParameter("senha");
                    Usuario u = ud.getByEmail(email);
                    if (u != null) {

                        Criptografia cripto = new Criptografia();
                        if (u.getSenha().equals(cripto.criptografar(senha))) {
                            gereLogLogin(request, u, "USUÃRIO LOGOU");
                            request.getSession(true).setAttribute("UsuarioLogado", u);
                            response.sendRedirect("app/");
                        } else {
                            gereLogLogin(request, u, "USUARIO ERROU A SENHA");
                            request.setAttribute("message_error", "Erro - Usuário ou Senha Inváilda!");
                            request.getRequestDispatcher("/").forward(request, response);
                        }
                    } else {
                        gereLogLogin(request, u, "USUARIO NAO ENCONTRADO");
                        request.setAttribute("message_error", "Erro - Usuário Não encontrado");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                    break;
                }
                // processRequest(request, response);
                case "cadastro": {
                    String nome = request.getParameter("nome").trim();
                    String email = request.getParameter("email").trim();
                    String senha = request.getParameter("senha");
                    String senha2 = request.getParameter("senha2");
                    Usuario u = ud.getByEmail(email);
                    if (u != null || email.equals("")) {
                        request.setAttribute("message_error", "ERRO - Este Login ja se encontra em uso ou Email nao preenchido.");
                        request.getRequestDispatcher("cadastrar_usuario.jsp").forward(request, response);
                    } else {
                        if (!senha.equals(senha2) || senha.equals("")) {
                            request.setAttribute("message_error", "ERRO - Senhas não conferem ou senha invalida.");
                            request.getRequestDispatcher("cadastrar_usuario.jsp").forward(request, response);
                        } else {
                            Criptografia cripto = new Criptografia();
                            u = new Usuario(nome, email, cripto.criptografar(senha));
                            ud.persistir(u);
                            gereLogLogin(request, u, "USUARIO DE CADASTROU");
                            request.getSession().setAttribute("message", "Usuario cadastrado com sucesso!");
                            request.getSession().setAttribute("uc", u);
                            // request.getRequestDispatcher("cadastrar_perfil.jsp").forward(request, response);
                            response.sendRedirect("index.jsp");
                        }

                    }
                    break;
                }
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void gereLogLogin(HttpServletRequest request, Usuario usuario, String message) {
        String cabecalhoHTTP;
        Enumeration<String> headerNames = request.getHeaderNames();
        String header = headerNames.nextElement();
        cabecalhoHTTP = header;
        cabecalhoHTTP += "=" + request.getHeader(header) + ",";
        while (headerNames.hasMoreElements()) {
            header = headerNames.nextElement();
            cabecalhoHTTP += header;
            cabecalhoHTTP += "=" + request.getHeader(header) + ",";

        }
        LogAcessoDao la = new LogAcessoDao();
        la.persistir(new LogAcesso(request.getRemoteAddr(), cabecalhoHTTP, usuario, message, request.getHeader("user-agent")));

    }
}
