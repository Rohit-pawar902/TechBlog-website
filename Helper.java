/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tech.helper;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class Helper {
    
public static boolean imagedelete(String path){
    boolean m=false;
    File f= new File(path);
    m=f.delete();
    return(m);
}

public static boolean saveImage(InputStream in,String path1){
    boolean m=false;
    try {
        byte[] b=new byte[in.available()];
      in.read(b);
        
      FileOutputStream f = new FileOutputStream(path1);
      f.write(b);
      f.flush();
      f.close();
      m=true;
    } catch (Exception e) {
        System.out.println(e);
    }
 return m;
}
}
