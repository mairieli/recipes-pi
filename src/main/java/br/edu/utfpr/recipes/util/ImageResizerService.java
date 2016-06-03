package br.edu.utfpr.recipes.util;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import javax.imageio.ImageIO;

public class ImageResizerService {

    private File arquivo;

    public ImageResizerService(File arquivo) {
        this.arquivo = arquivo;
    }

    public File getArquivo() {
        return arquivo;
    }

    public void setArquivo(File arquivo) {
        this.arquivo = arquivo;
    }

    public byte[] read(File file) throws FileNotFoundException, IOException {
        byte[] buffer = new byte[1024];

        InputStream is = new FileInputStream(file);
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        while (is.read(buffer) != -1) {
            out.write(buffer);
        }
        try {
            return out.toByteArray();
        } finally {
            is.close();
            out.close();
        }

    }

    public File converteBmpToJPG() throws IOException {

        File out = new File(arquivo.getCanonicalPath() + ".bmp");

        BufferedImage buffer;

        buffer = ImageIO.read(arquivo);
        ImageIO.write(buffer, "JPG", out);
        return out;
    }

    public byte[] getMiniatura() throws IOException {
        return processa(120);
    }

    public byte[] getNormal() throws IOException {
        return processa(800);
    }
    public byte[] getNormal(int largura) throws IOException {
        return processa(largura);
    }
    public int getLargura() throws IOException{
          BufferedImage imagem = ImageIO.read(this.arquivo);
        return imagem.getWidth();
    }
    public int getAltura() throws IOException{
          BufferedImage imagem = ImageIO.read(this.arquivo);

        return imagem.getHeight();
        
       
    }
    private byte[] processa(int largura) throws IOException {
        int larguraAlvo = largura;
        String file = this.arquivo.getCanonicalPath();
        boolean isPng = file.toUpperCase().endsWith("PNG");
        boolean isJpg = file.toUpperCase().endsWith("JPG");
        boolean isBmp = file.toUpperCase().endsWith("BMP");
        if (!isPng && !isJpg && !isBmp) {
            throw  new IOException("Arquivo Invalido ou nao suportado!");
        }
        BufferedImage imagem = ImageIO.read(arquivo);

        int originalWidth = imagem.getWidth();
        int originalHeight = imagem.getHeight();
        if (larguraAlvo > originalWidth) {
            larguraAlvo = originalWidth;
        }
        int altura_nova = (int) (originalHeight * larguraAlvo) / originalWidth;
        int type = BufferedImage.TYPE_INT_RGB;

        if (isPng) {
            type = BufferedImage.BITMASK;
        }
        BufferedImage new_img = new BufferedImage((int) larguraAlvo, (int) altura_nova, type);
        Graphics2D g = new_img.createGraphics();
        g.setComposite(AlphaComposite.Src);
        g.drawImage(imagem, 0, 0, (int) larguraAlvo, (int) altura_nova, null);
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        if (isPng) {
            ImageIO.write(new_img, "PNG", out);
        } else {
            ImageIO.write(new_img, "JPG", out);
        }
        try {
            return out.toByteArray();
        } finally {
            out.close();
        }
    }
    
}
