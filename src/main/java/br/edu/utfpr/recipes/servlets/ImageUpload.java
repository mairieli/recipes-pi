package br.edu.utfpr.recipes.servlets;

import br.edu.utfpr.recipes.dao.DaoReceita;
import br.edu.utfpr.recipes.entidade.Receita;
import br.edu.utfpr.recipes.util.ImageResizerService;
import br.edu.utfpr.recipes.util.ImgUtil;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author josimar
 */
public class ImageUpload extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        String UPLOAD_DIRECTORY = this.getServletContext().getRealPath("") + "/upload/";
        // process only if its multipart content
        if (isMultipart) {
            // Create a factory for disk-based file items
            FileItemFactory factory = new DiskFileItemFactory();
            File dirUpload = new File(UPLOAD_DIRECTORY);
            if (!dirUpload.isDirectory()) {
                dirUpload.mkdir();
            }
            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
            File imagem = null;
            int receita_id = 0;
            try {
                // Parse the request
                List<FileItem> multiparts = upload.parseRequest(request);

                for (FileItem item : multiparts) {

                    if ("receita_id".equals(item.getFieldName())) {
                        receita_id = Integer.parseInt(item.getString());
                    }
                    if (!item.isFormField()) {
                        String name = new File(item.getName()).getName();
                        imagem = new File(UPLOAD_DIRECTORY + File.separator + name);
                        item.write(imagem);
                    }
                }
            } catch (Exception e) {
                request.getSession().setAttribute("message_error", "Não foi possivel salvar a imagem pelo seguinte motivo: " + e);
                request.getSession().setAttribute("addimg", "ok");
                response.sendRedirect("CadastroReceitas.jsp?receita_id=" + receita_id);
            }
            try {
                if (imagem != null) {
                    DaoReceita dr = new DaoReceita();
                    if (receita_id != 0) {
                        Receita r = dr.findById(receita_id);
                        ImageResizerService irs = new ImageResizerService(imagem);
                        r.setImagem(irs.getNormal(900));
                        r.setImagemMini(irs.getMiniatura());
                        dr.save(r);
                        request.getSession().setAttribute("message", "Imagem Salva com Sucesso!");
                        response.sendRedirect("index.jsp");
                        //ImgUtil imgUtil = new ImgUtil();
                       // imgUtil.exibeImagemByte(response.getOutputStream(), r.getImagem());
                    } else {
                        Receita r = new Receita();
                        ImageResizerService irs = new ImageResizerService(imagem);
                        //se a largura da imagem for maior que 900 pixels, redimenciona pra 900...
                        r.setImagem(irs.getNormal(900));
                        // dr.save(r);
                        request.getSession().setAttribute("message", "Imagen Salva com Sucesso!");
                        response.sendRedirect("upload_image_recipe.jsp");
                        //ImgUtil imgUtil = new ImgUtil();
                        // imgUtil.exibeImagemByte(response.getOutputStream(), r.getImagem());
                    }
                }
            } catch (Exception e) {
                request.getSession().setAttribute("message_error", "Não foi possivel salvar a imagem pelo seguinte motivo: " + e);
                request.getSession().setAttribute("addimg", "ok");
                response.sendRedirect("CadastroReceitas.jsp?receita_id=" + receita_id);
            }
        }
    }
}
