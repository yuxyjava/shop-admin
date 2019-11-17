package com.fh.shop.admin;

import com.fh.shop.admin.util.CheckSumBuilder;
import com.fh.shop.admin.util.HttpClientUtil;
import com.fh.shop.admin.util.SMSUtil;
import org.apache.http.HttpEntity;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.junit.Test;

import java.io.IOException;
import java.util.*;

public class TestSMS {

    @Test
    public void sendMsg() throws IOException {
        CloseableHttpClient client = HttpClientBuilder.create().build();
        HttpPost httpPost = new HttpPost("https://api.netease.im/sms/sendcode.action");
        // 传递的参数集合
        List<BasicNameValuePair> params = new ArrayList<>();
        // 传递header
        httpPost.addHeader("AppKey", "50cc3cad59230d672edae1047b04d448");
        String nonce = UUID.randomUUID().toString();
        httpPost.addHeader("Nonce", nonce);
        String currTime = System.currentTimeMillis() + "";
        httpPost.addHeader("CurTime", currTime);
        httpPost.addHeader("CheckSum", CheckSumBuilder.getCheckSum("01773b6e33e2", nonce, currTime));
        // 传递的参数
        BasicNameValuePair mobileParam = new BasicNameValuePair("mobile", "13137106097");
        BasicNameValuePair codeLenParam = new BasicNameValuePair("codeLen", "6");
        // 将所有需要传递的参数添加到参数集合
        params.add(mobileParam);
        params.add(codeLenParam);
        // 对参数集合进行url编码
        UrlEncodedFormEntity urlEncodedFormEntity = new UrlEncodedFormEntity(params, "utf-8");
        // 将参数添加到httppost的请求中
        httpPost.setEntity(urlEncodedFormEntity);
        // 发送请求
        CloseableHttpResponse response = client.execute(httpPost);
        HttpEntity entity = response.getEntity();
        String result = EntityUtils.toString(entity, "utf-8");
        System.out.println(result);
    }

    @Test
    public void sendMsg2() {
        Map<String, String> headers = new HashMap<>();
        headers.put("AppKey", "50cc3cad59230d672edae1047b04d448");
        String nonce = UUID.randomUUID().toString();
        headers.put("Nonce", nonce);
        String currTime = System.currentTimeMillis() + "";
        headers.put("CurTime", currTime);
        headers.put("CheckSum", CheckSumBuilder.getCheckSum("01773b6e33e2", nonce, currTime));
        Map<String, String> params = new HashMap<>();
        params.put("mobile", "13137106097");
        params.put("codeLen", "5");
        String result = HttpClientUtil.sendPost("https://api.netease.im/sms/sendcode.action", headers, params);
        System.out.println(result);
    }

    @Test
    public void sendMsg3() {
        String s = SMSUtil.sendMsg("18339597273");
        System.out.println(s);
    }
}
