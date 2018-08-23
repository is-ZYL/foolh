package com.fh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller  
@RequestMapping("app/file")  
public class FileController {  
  
    @RequestMapping("/toFile")  
    public String toFileUpload() {  
        return "fileUpload";  
    }      
   
   
}  
