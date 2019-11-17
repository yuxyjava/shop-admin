package com.fh.shop.admin.util;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class HttpClientUtil {

    public static String sendPost(String url, Map<String, String> headers, Map<String, String> params) {
        String result = "";
        CloseableHttpClient client = null;
        HttpPost httpPost = null;
        CloseableHttpResponse res = null;
        try {
            client = HttpClientBuilder.create().build();
            httpPost = new HttpPost(url);
            // 设置头信息
            if (null != headers && headers.size() > 0) {
                Iterator<Map.Entry<String, String>> iterator = headers.entrySet().iterator();
                while (iterator.hasNext()) {
                    Map.Entry<String, String> next = iterator.next();
                    String key = next.getKey();
                    String value = next.getValue();
                    httpPost.addHeader(key, value);
                }
            }
            // 设置参数
            if (null != params && params.size() > 0) {
                List<BasicNameValuePair> pairList = new ArrayList<>();
                Iterator<Map.Entry<String, String>> paramIterator = params.entrySet().iterator();
                while (paramIterator.hasNext()) {
                    Map.Entry<String, String> next = paramIterator.next();
                    String key = next.getKey();
                    String value = next.getValue();
                    BasicNameValuePair basicNameValuePair = new BasicNameValuePair(key, value);
                    pairList.add(basicNameValuePair);
                }
                UrlEncodedFormEntity urlEncodedFormEntity = new UrlEncodedFormEntity(pairList, "utf-8");
                httpPost.setEntity(urlEncodedFormEntity);
            }
            res = client.execute(httpPost);
            HttpEntity entity = res.getEntity();
            result = EntityUtils.toString(entity, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        } catch (ClientProtocolException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            if (null != res) {
                try {
                    res.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (null != httpPost) {
                httpPost.releaseConnection();
            }
            if (null != client) {
                try {
                    client.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }
}
