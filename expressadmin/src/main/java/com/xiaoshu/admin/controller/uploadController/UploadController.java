package com.xiaoshu.admin.controller.uploadController;


import com.xiaoshu.admin.service.UploadService;
import com.xiaoshu.common.util.ResponseEntity;
import org.apache.velocity.shaded.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * @author sunzhenpeng
 * @data 2019/9/16
 * @description 图片上传 控制器
 */
@Controller
@RequestMapping("/admin/img")
public class UploadController {

    @Autowired
    UploadService uploadService;
    private final ResourceLoader resourceLoader;

    @Autowired
    public UploadController(ResourceLoader resourceLoader) {
        this.resourceLoader = resourceLoader;
    }

    @PostMapping("upload")
    @ResponseBody
    public ResponseEntity uploadFile(@RequestParam("file") MultipartFile file, HttpServletRequest httpServletRequest) {
        if(file == null){
            return ResponseEntity.failure("上传文件为空 ");
        }
        String url = null;
        Map map = new HashMap();
        try {
            String path = new File("").getCanonicalPath().replace("\\","/")+"/src/main/resources/static/imagefiles";
            String fileName = saveImg(file,path);
            //url = uploadService.upload(file);
            url = "/static/imagefiles/"+fileName;
            map.put("url", url);
            map.put("name", file.getOriginalFilename());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.failure(e.getMessage());
        }
        return ResponseEntity.success("操作成功").setAny("data",map);
    }


    /**
     * 保存文件，直接以multipartFile形式
     * @param multipartFile
     * @param path 文件保存绝对路径
     * @return 返回文件名
     * @throws IOException
     */
    public static String saveImg(MultipartFile multipartFile,String path) throws IOException {
        File file = new File(path);
        if (!file.exists()) {
            file.mkdirs();
        }
        FileInputStream fileInputStream = (FileInputStream) multipartFile.getInputStream();
        //获取文件的扩展名
        String ext = FilenameUtils.getExtension(multipartFile.getOriginalFilename());
        String fileName = UUID.randomUUID() + "."+ext;
        BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(path + File.separator + fileName));
        byte[] bs = new byte[1024];
        int len;
        while ((len = fileInputStream.read(bs)) != -1) {
            bos.write(bs, 0, len);
        }
        bos.flush();
        bos.close();
        return fileName;
    }

    @ResponseBody
    @RequestMapping(value="/uploadfile2" ,produces = "text/plain;charset=utf-8")
    public ResponseEntity uploadfile2(@RequestParam("file") MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
        if (request instanceof MultipartHttpServletRequest) {
            file = ((MultipartHttpServletRequest)request).getFile("file");
        }
        Map map = new HashMap();
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
            map.put("url", serverFilePatn);
            map.put("name", file.getOriginalFilename());
            return ResponseEntity.success("操作成功").setAny("data",map);

        }
        return ResponseEntity.failure("操作是失败");
    }

    @ResponseBody
    @RequestMapping(value="/uploadfile1" ,produces = "text/plain;charset=utf-8")
    public ResponseEntity uploadfile1(@RequestParam("file_data") MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
        if (request instanceof MultipartHttpServletRequest) {
            file = ((MultipartHttpServletRequest)request).getFile("file_data");
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

            return ResponseEntity.success("操作成功").setAny("data",serverFilePatn);

        }
        return null;
    }



}
