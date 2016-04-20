package br.edu.utfpr.recipes.util;

import java.io.BufferedOutputStream;
import java.io.IOException;
import javax.servlet.ServletOutputStream;

/**
 *
 * @author josimar
 */
public class ImgUtil {

    public void exibeImagemByte(ServletOutputStream ouputStream, byte[] b) throws IOException {
        //  ServletOutputStream ouputStream = response.getOutputStream();
        BufferedOutputStream bf = new BufferedOutputStream(ouputStream);
        // ouputStream.write(b, 0, b.length);
        bf.write(b, 0, b.length);
        bf.flush();
        ouputStream.flush();
        ouputStream.close();
    }
}
