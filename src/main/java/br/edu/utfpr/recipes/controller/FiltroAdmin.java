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

public class FiltroAdmin implements Filter {

    private static final boolean DEBUG = true;

    private FilterConfig filterConfig = null;

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (DEBUG) {
            log("FiltroAdmin:DoBeforeProcessing");
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        Usuario usuarioLogado = (Usuario) req.getSession().getAttribute("usuarioLogado");
        if (usuarioLogado == null) {
            res.sendRedirect("../login.jsp");
            return;
        } else if (usuarioLogado.getAdmin() == null) {
            req.getSession(true).setAttribute("message_error", "Desculpe, mas a página que voce tentou acessar é de uso exclusivo de administradores.");
            res.sendRedirect("../index.jsp");
        } else if (!usuarioLogado.getAdmin()) {
            req.getSession(true).setAttribute("message_error", "Desculpe, mas a página que voce tentou acessar é de uso exclusivo de administradores.");
            res.sendRedirect("../index.jsp");
        }

        if (DEBUG) {
            log("FiltroAdmin:doFilter()");
        }

        doBeforeProcessing(request, response);

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

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (DEBUG) {
                log("FiltroAdmin:Initializing filter");
            }
        }
    }

    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("FiltroAdmin()");
        }
        StringBuilder stringBuilder = new StringBuilder("FiltroAdmin(");
        stringBuilder.append(filterConfig);
        stringBuilder.append(")");
        return (stringBuilder.toString());
    }

    private void sendProcessingError(Throwable throwable, ServletResponse response) {
        String stackTrace = getStackTrace(throwable);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                try (PrintStream ps = new PrintStream(response.getOutputStream());
                        PrintWriter pw = new PrintWriter(ps)) {
                    pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N
                    pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                    pw.print(stackTrace);
                    pw.print("</pre></body>\n</html>"); //NOI18N
                }
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                try (PrintStream printStream = new PrintStream(response.getOutputStream())) {
                    throwable.printStackTrace(printStream);
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
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
