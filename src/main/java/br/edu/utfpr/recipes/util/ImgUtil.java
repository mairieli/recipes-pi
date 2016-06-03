package br.edu.utfpr.recipes.util;

import java.io.BufferedOutputStream;
import java.io.IOException;
import javax.servlet.ServletOutputStream;

public class ImgUtil {

    public void exibeImagemByte(ServletOutputStream ouputStream, byte[] b) throws IOException {
        BufferedOutputStream bf = new BufferedOutputStream(ouputStream);
        bf.write(b, 0, b.length);
        bf.flush();
        ouputStream.flush();
        ouputStream.close();
    }
    
}
