package com.zfl.controller.upload;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;


@Controller
@RequestMapping("upload_files")
public class UploadfileController {

	@ResponseBody
	@RequestMapping(value="/upload" ,produces = "text/plain;charset=utf-8")
	public String uploadfile1(@RequestParam("file") MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		if (request instanceof MultipartHttpServletRequest) {
			file = ((MultipartHttpServletRequest)request).getFile("file");
        }

		if(file!=null && file.getOriginalFilename()!=null && file.getOriginalFilename().length()>0){
			/**
             * 项目服务器地址路径
             */
            String projectServerPath = request.getScheme() + "://"+request.getServerName()+":" +
                            request.getServerPort() + request.getContextPath() + "/upload/";
            /**
             * 上传文件绝对路径
             */
            String path = request.getSession().getServletContext().getRealPath("/upload/");
			//原始名称  
            String oldFileName = file.getOriginalFilename();
          
          //新的图片名称  
            String newFileName = System.currentTimeMillis()+"" + oldFileName.substring(oldFileName.lastIndexOf("."));  
            //新图片  
            File newFile = new File(path + "\\" + newFileName);  
            /**
             * 判断路径是否存在，如果不存在就创建一个
             */
            if (!newFile.getParentFile().exists()) { 
                
            	newFile.getParentFile().mkdirs();
            }
            /**
             * 创建文件
             */
            file.transferTo(new File(path + File.separator + newFileName));
            String serverFilePatn = projectServerPath + newFileName;
            return serverFilePatn+"";
           
		}
		 return null;
    }

}
