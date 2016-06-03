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

public class FiltroSessaoUsuario implements Filter {

    private static final boolean DEBUG = true;
    private FilterConfig filterConfig = null;

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        Usuario usuarioLogado = (Usuario) req.getSession().getAttribute("usuarioLogado");
        String uri = req.getRequestURI();

        if (usuarioLogado == null
                && !uri.endsWith("VisualizacaoReceitas")
                && !uri.endsWith("login.jsp")
                && !uri.endsWith("CadastroDeUsuariosServlet")
                && !uri.endsWith("login")
                && !uri.endsWith("CadastroUsuario.jsp")
                && !uri.endsWith(".css")
                && !uri.endsWith(".js")
                && !uri.endsWith(".ico")
                && !uri.endsWith(".png")
                && !uri.endsWith(".ttf")
                && !uri.endsWith(".woff")
                && !uri.endsWith(".woff2")) {
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

    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (DEBUG) {
                log("FiltroSessaoUsuario:Initializing filter");
            }
        }
    }

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
            } catch (Exception exception) {
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

    public void log(String message) {
        filterConfig.getServletContext().log(message);
    }

}
