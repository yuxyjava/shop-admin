package com.fh.shop.admin.util;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;

public class DistributedSession {

    public static String getSessionId(HttpServletRequest req, HttpServletResponse resp) {
        // 从请求中读取名字为fh_id的cookie
        String sessionId = CookieUtil.readCookie(SystemConst.COOKIE_NAME, req);
        if (StringUtils.isEmpty(sessionId)) {
            // 生成sessionId
            sessionId = UUID.randomUUID().toString();
            // 写到客户端浏览器中
            CookieUtil.writeCookie(SystemConst.COOKIE_NAME, sessionId, SystemConst.DOMAIN, resp);
        }
        return sessionId;
    }
}
