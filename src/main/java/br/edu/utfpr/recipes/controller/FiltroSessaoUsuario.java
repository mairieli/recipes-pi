/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.utfpr.recipes.controller;

import br.edu.utfpr.recipes.entidade.Usuario;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author josimar
 */
public class FiltroSessaoUsuario implements Filter {
    
    private static final boolean DEBUG = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    
        


    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res =  (HttpServletResponse) response;
        Usuario usuarioLogado = (Usuario) req.getSession().getAttribute("usuarioLogado");
        String uri = req.getRequestURI();
        
        if(usuarioLogado == null && !uri.endsWith("login.jsp")&& !uri.endsWith("CadastroDeUsuariosServlet")&& !uri.endsWith("login")&& !uri.endsWith("CadastroUsuario.jsp")&& !uri.endsWith(".css")&& !uri.endsWith(".js")&& !uri.endsWith(".ico")&& !uri.endsWith(".png")&& !uri.endsWith(".ttf")&& !uri.endsWith(".woff")&& !uri.endsWith(".woff2")){
            res.sendRedirect("login.jsp");
            return;
        }
        
        if (DEBUG) {
            log("FiltroSessaoUsuario:doFilter()");
        }
        
        
        Throwable problem = null;
        try {
            chain.doFilter(request, response);
        } catch (IOException | ServletException exception) {
            problem = exception;
        }
        

        // If there was a problem, we want to rethrow it if it is
        // a known type, otherwise log it.
        if (problem != null) {
            if (problem instanceof ServletException) {
                throw (ServletException) problem;
            }
            if (problem instanceof IOException) {
                throw (IOException) problem;
            }
            sendProcessingError(problem, response);
        }
    }

    /**
     * Return the filter configuration object for this filter.
     * @return 
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {        
    }

    /**
     * Init method for this filter
     * @param filterConfig
     */
    @Override
    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (DEBUG) {                
                log("FiltroSessaoUsuario:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     * @return 
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("FiltroSessaoUsuario()");
        }
        StringBuilder stringBuilder = new StringBuilder("FiltroSessaoUsuario(");
        stringBuilder.append(filterConfig);
        stringBuilder.append(")");
        return (stringBuilder.toString());
    }
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);        
        
        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                try (PrintStream printStream = new PrintStream(response.getOutputStream()); 
                        PrintWriter printWriter = new PrintWriter(printStream)) {
                    printWriter.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N
                    printWriter.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                    printWriter.print(stackTrace);
                    printWriter.print("</pre></body>\n</html>"); //NOI18N
                }
                response.getOutputStream().close();
            } catch (Exception exception) {
            }
        } else {
            try {
                try (PrintStream printStream = new PrintStream(response.getOutputStream())) {
                    t.printStackTrace(printStream);
                }
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }
    
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter stringWriter = new StringWriter();
            PrintWriter printWriter = new PrintWriter(stringWriter);
            t.printStackTrace(printWriter);
            printWriter.close();
            stringWriter.close();
            stackTrace = stringWriter.getBuffer().toString();
        } catch (Exception exception) {
        }
        return stackTrace;
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);        
    }
    
}
