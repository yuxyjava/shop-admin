package com.fh.shop.admin;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.fh.shop.admin.util.DateUtil;
import org.junit.Test;

import java.io.File;
import java.util.Date;
import java.util.UUID;

public class TestOss {

    @Test
    public void test1() {
        // Endpoint以杭州为例，其它Region请按实际情况填写。
        String endpoint = "http://oss-cn-beijing.aliyuncs.com";
        // 阿里云主账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM账号进行API访问或日常运维，
        // 请登录 https://ram.console.aliyun.com 创建RAM账号。
        String accessKeyId = "LTAI4FiWbR63jNpn5rFTf8YK";
        String accessKeySecret = "ECuMxgCUmMApv5Ysnv1jSGorIg17e3";

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        String dateStr = DateUtil.date2str(new Date(), DateUtil.Y_M_D);
        String fileName = UUID.randomUUID().toString()+".jpg";
        // 上传文件。<yourLocalFile>由本地文件路径加文件名包括后缀组成，例如/users/local/myfile.txt。
        String path = dateStr + "/" + fileName;
        ossClient.putObject("fh1902-111", path, new File("D:\\fh1902\\shop-admin\\target\\shop-admin\\images\\b9a4b2f6-31de-4b04-8030-2adaf9254cd3.jpg"));

        // 获取上传后文件的路径
        System.out.println("http://fh1902-111.oss-cn-beijing.aliyuncs.com/"+path);

        // 关闭OSSClient。
        ossClient.shutdown();
    }
}
