package gltknbtn.gltknbtnBlog.util;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Base64;

import javax.imageio.ImageIO;

public class Util {

	public static BufferedImage createResizedCopy(BufferedImage originalImage, int scaledWidth, int scaledHeight,
			boolean preserveAlpha) {
		System.out.println("resizing...");
		int imageType = preserveAlpha ? BufferedImage.TYPE_INT_RGB : BufferedImage.TYPE_INT_ARGB;
		BufferedImage scaledBI = new BufferedImage(scaledWidth, scaledHeight, imageType);
		Graphics2D g = scaledBI.createGraphics();
		if (preserveAlpha) {
			g.setComposite(AlphaComposite.Src);
		}
		g.drawImage(originalImage, 0, 0, scaledWidth, scaledHeight, null);
		g.dispose();
		return scaledBI;
	}

	public static String bufferedImageToBase64Str(BufferedImage img, String ext) {

		String base64 = "";
		try {
			byte[] imageBytes = getBufferedImageBytes(img, ext);
			base64 = Base64.getEncoder().encodeToString(imageBytes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return base64;
	}
	
	public static BufferedImage base64StrToImage(String base64str, String ext) {
		
		BufferedImage img = null;
		try {
			
			byte[] byteArr = Base64.getDecoder().decode(base64str.getBytes());
			img = ImageIO.read(new ByteArrayInputStream(byteArr));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return img;
	}

	public static byte[] getBufferedImageBytes(BufferedImage img, String ext) {
		byte[] imageInByte = null;
		try {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(img, ext, baos);
			baos.flush();
			imageInByte = baos.toByteArray();
			baos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return imageInByte;

	}
	
	public static String getResizedBase64Str(String imgBase64Str, int width, int height) {

		String[] strArr1 = imgBase64Str.split(",");
		String imgBase64str = strArr1[1];

		String[] strArr2 = strArr1[0].split("/");
		String ext = strArr2[1].split(";")[0];

		BufferedImage img = Util.base64StrToImage(imgBase64str, ext);
		BufferedImage resizedImg = Util.createResizedCopy(img, width, height, true);
		String resizedImgBase64str = Util.bufferedImageToBase64Str(resizedImg, ext);

		return strArr1[0] + "," + resizedImgBase64str;

	}
	
}
