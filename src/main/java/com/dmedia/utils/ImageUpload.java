package com.dmedia.utils;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.imageio.ImageIO;
import org.apache.commons.io.IOUtils;
import org.springframework.web.multipart.MultipartFile;

public class ImageUpload {
	
	public static String uploadImage(MultipartFile mfile , String folder){
		 final String rootPath = System.getProperty("catalina.home");
			
		 String destDir=rootPath + File.separator + "webapps\\Files\\"+folder;
		 File destDirectory=null;
		 InputStream is=null;
		 String fileName=null;
		 OutputStream os=null;		 
		 //create or locate E/Uploads folder
		 destDirectory=new File(destDir);
		 if(!destDirectory.exists())
			 destDirectory.mkdir();

		 try {
			//create InputStreams representing uploaded files
			 is=mfile.getInputStream();	 
			 //get orginal uploaded file names
			 fileName=mfile.getOriginalFilename().replaceAll("\\s",""); 
			 //create OutputStreams pointing to Dest files (names must match with uploaded file names) 
			  os=new FileOutputStream(destDirectory.getAbsolutePath()+"/"+fileName); 
			  //write th content of uploaded files to Dest files
			  IOUtils.copy(is, os);   
			  //close streams
			  is.close();    
			  os.close();
		} catch (FileNotFoundException e) {
		} catch (IOException e) {
		}
	      String path = "Files/"+folder.replace("\\", "/")+"/"+fileName;
	      try {
			resize(destDirectory.getAbsolutePath()+"/"+fileName,destDirectory.getAbsolutePath()+"/"+fileName,250,150);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return path;		 
	 }
	
	public static void resize(String inputImagePath,
            String outputImagePath, int scaledWidth, int scaledHeight)
            throws IOException {
		System.out.println(inputImagePath);
        // reads input image
        File inputFile = new File(inputImagePath);
        BufferedImage inputImage = ImageIO.read(inputFile);
 
        // creates output image
        BufferedImage outputImage = new BufferedImage(scaledWidth,
                scaledHeight, inputImage.getType());
 
        // scales the input image to the output image
        Graphics2D g2d = outputImage.createGraphics();
        g2d.drawImage(inputImage, 0, 0, scaledWidth, scaledHeight, null);
        g2d.dispose();
 
        // extracts extension of output file
        String formatName = outputImagePath.substring(outputImagePath
                .lastIndexOf(".") + 1);
 
        // writes to output file
        ImageIO.write(outputImage, formatName, new File(outputImagePath));
    }

}
