package com.fh.shop.admin.biz.brand;

import com.alibaba.fastjson.JSONObject;
import com.fh.shop.admin.common.DataTableResult;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.mapper.brand.IBrandMapper;
import com.fh.shop.admin.param.brand.BrandSearchParam;
import com.fh.shop.admin.po.brand.Brand;
import com.fh.shop.admin.util.RedisUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("brandService")
public class IBrandServiceImpl implements IBrandService {

    @Autowired
    private IBrandMapper brandMapper;

    @Override
    public ServerResponse findAll() {
        // 先判断缓存中是否存在
        String brandListJson = RedisUtil.get("brandList");
        if (StringUtils.isEmpty(brandListJson)) {
            // 从数据库取数据
            List<Brand> brandListDB = brandMapper.selectList(null);
            // 将java对象转为json格式的字符串
            brandListJson = JSONObject.toJSONString(brandListDB);
            // 放入缓存中
            RedisUtil.set("brandList", brandListJson);
            // 返回
            return ServerResponse.success(brandListDB);
        } else {
            // 将json格式的字符串转为java对象
            List<Brand> brandList = JSONObject.parseArray(brandListJson, Brand.class);
            return ServerResponse.success(brandList);
        }
    }

    @Override
    public ServerResponse findList(BrandSearchParam brandSearchParam) {
        // 获取总条数
        Long totalCount = brandMapper.findListCount(brandSearchParam);
        // 获取分页列表
        List<Brand> brandList = brandMapper.findPageList(brandSearchParam);
        // 构建datatable
        DataTableResult result = new DataTableResult(brandSearchParam.getDraw(), totalCount, totalCount, brandList);
        return ServerResponse.success(result);
    }

    @Override
    public ServerResponse updateBrandHot(Long id, Integer hot) {
        RedisUtil.del("hotBrandList");
        Brand brand = new Brand();
        brand.setHot(hot);
        brand.setId(id);
        brandMapper.updateById(brand);
        return ServerResponse.success();
    }

    @Override
    public ServerResponse updateBrandSort(Long id, Integer sort) {
        RedisUtil.del("hotBrandList");
        Brand brand = new Brand();
        brand.setSort(sort);
        brand.setId(id);
        brandMapper.updateById(brand);
        return ServerResponse.success();
    }

    @Override
    public ServerResponse addBrand(Brand brand) {
        // 清缓存
        RedisUtil.del("brandList");
        RedisUtil.del("hotBrandList");
        brandMapper.insert(brand);
        return ServerResponse.success();
    }

    @Override
    public List<Brand> findBrandList(BrandSearchParam brandSearchParam) {
        List<Brand> brandList = brandMapper.findBrandList(brandSearchParam);
        return brandList;
    }





}
