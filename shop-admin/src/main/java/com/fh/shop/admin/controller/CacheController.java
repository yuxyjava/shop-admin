package com.fh.shop.admin.controller;

import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.util.RedisUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/cache")
@RestController
public class CacheController {

    @RequestMapping("/clearShowProductCache")
    public ServerResponse clearShowProductCache() {
        RedisUtil.del("showProductList");
        return ServerResponse.success();
    }
}
