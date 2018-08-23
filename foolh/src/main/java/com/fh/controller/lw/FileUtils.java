package com.fh.controller.lw;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import Decoder.BASE64Decoder;

public class FileUtils {
	
	 
	/**
	 * 生成图片
	 * @param imgStr
	 * @param imgFile
	 * @return
	 * @throws Exception
	 */
	public static boolean generateImage(String imgStr,String imgFile)throws Exception {// 对字节数组字符串进行Base64解码并生成图片  
		if (imgStr == null) // 图像数据为空  
		return false;  
		BASE64Decoder decoder = new BASE64Decoder();  
		try {  
		// Base64解码  
		byte[] b = decoder.decodeBuffer(imgStr);  
		for (int i = 0; i < b.length; ++i) {  
		if (b[i] < 0) {// 调整异常数据  
		b[i] += 256;  
		}  
		}  
		// 生成jpeg图片  
		String imgFilePath = imgFile;// 新生成的图片  
		OutputStream out = new FileOutputStream(imgFilePath);  
		out.write(b);  
		out.flush();  
		out.close();  
		return true;  
		} catch (Exception e) {  
		throw e;  
		}  
	}
	 public static int saveToImgByInputStream(InputStream instreams,String imgPath){
	        int stateInt = 1;
	        if(instreams != null){
	            try {
	                File file=new File(imgPath);//可以是任何图片格式.jpg,.png等
	                FileOutputStream fos=new FileOutputStream(file);
	                byte[] b = new byte[1024];
	                int nRead = 0;
	                while ((nRead = instreams.read(b)) != -1) {
	                    fos.write(b, 0, nRead);
	                }
	                fos.flush();
	                fos.close();                
	            } catch (Exception e) {
	                stateInt = 0;
	                e.printStackTrace();
	            } finally {
	            }
	        }
	        return stateInt;
	    }
	

}
