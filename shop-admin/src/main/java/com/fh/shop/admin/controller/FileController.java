package com.fh.shop.admin.controller;

import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.util.FileUtil;
import com.fh.shop.admin.util.OSSUtil;
import com.fh.shop.admin.util.SystemConst;
import com.itextpdf.text.log.SysoCounter;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;

@RestController
@RequestMapping("/file")
public class FileController {

    @RequestMapping("/uploadImage")
    public ServerResponse uploadImage(@RequestParam MultipartFile imageInfo, HttpServletRequest request) {
        // 将 文件 从客户端 上传到 服务器硬盘的事情已经 由springmvc帮你完成了
        // 工具类只是将上传后的文件进行重命名并复制到指定的文件夹下
        try {
            InputStream  is = imageInfo.getInputStream();
            String originalFilename = imageInfo.getOriginalFilename();
            String path = OSSUtil.uploadFile(is, originalFilename);
            return ServerResponse.success(path);
        } catch (IOException e) {
                e.printStackTrace();
                return ServerResponse.error();
        }
    }
}
