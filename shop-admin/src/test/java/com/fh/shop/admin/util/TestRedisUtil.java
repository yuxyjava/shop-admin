package com.fh.shop.admin.util;

import org.junit.Test;

public class TestRedisUtil {

    @Test
    public void testRedis() {
//        RedisUtil.set("userName", "zhangsan");
//        String userName = RedisUtil.get("userName");
//        System.out.println(userName);
        RedisUtil.del("userName");
    }
}
