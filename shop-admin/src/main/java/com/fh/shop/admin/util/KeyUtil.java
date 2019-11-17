package com.fh.shop.admin.util;

public class KeyUtil {

    public static String buildCodeKey(String data) {
        return "code:"+data;
    }

    public static String buildUserKey(String data) {
        return "user:"+data;
    }

    public static String buildMenuListKey(String data) {
        return "MenuList:"+data;
    }

    public static String buildAllResourceListKey(String data) {
        return "AllResourceList:"+data;
    }

    public static String buildUserResourceListKey(String data) {
        return "UserResourceList:"+data;
    }
}
