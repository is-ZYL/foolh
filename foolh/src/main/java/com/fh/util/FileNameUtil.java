package com.fh.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class FileNameUtil {
	/**
	 * 文件重命名
	 * @param name
	 * @return
	 */
	public static String rename(String name) {  
	      String body="";  
	      String ext="";  
	      SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss"); 
	  	  String date = simpleDateFormat.format(new Date());
	  	  Random random = new Random();
	  	  String randomCode = "";
	  	  for ( int i = 0; i < 4; i++ )
	  	  {
	  		randomCode += Integer.toString(random.nextInt(36), 36);
	  	  }
	      int pot=name.lastIndexOf(".");  
	      if(pot!=-1){  
	          body= date+randomCode +"";  
	          ext=name.substring(pot);  
	      }else{  
	          body=date+randomCode+"";  
	          ext="";  
	      }  
	      String newName=body+ext;  
	      return newName;  
	    }
	
}
