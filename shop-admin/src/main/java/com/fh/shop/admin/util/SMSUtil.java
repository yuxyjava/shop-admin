package com.fh.shop.admin.util;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class SMSUtil {

    private static final String APPKEY = "50cc3cad59230d672edae1047b04d448";
    private static final String APPSECRET = "01773b6e33e2";
    private static final String URL = "https://api.netease.im/sms/sendcode.action";


    public static String sendMsg(String phone) {
        Map<String, String> headers = new HashMap<>();
        headers.put("AppKey", APPKEY);
        String nonce = UUID.randomUUID().toString();
        headers.put("Nonce", nonce);
        String currTime = System.currentTimeMillis() + "";
        headers.put("CurTime", currTime);
        headers.put("CheckSum", CheckSumBuilder.getCheckSum(APPSECRET, nonce, currTime));
        Map<String, String> params = new HashMap<>();
        params.put("mobile", phone);
        String result = HttpClientUtil.sendPost(URL, headers, params);
        return result;
    }
}
