package com.fh.shop.admin.biz.category;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.mapper.category.ICategoryMapper;
import com.fh.shop.admin.po.category.Category;
import com.fh.shop.admin.util.RedisUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("categoryService")
public class ICategoryServiceImpl implements ICategoryService {
    @Autowired
    private ICategoryMapper categoryMapper;

    @Override
    public ServerResponse findList(Long id) {
        String categoryListJson = RedisUtil.get("categoryList");
        if (StringUtils.isNotEmpty(categoryListJson)) {
            List<Category> categories = JSONObject.parseArray(categoryListJson, Category.class);
            List<Category> childList = findChildList(id, categories);
            return ServerResponse.success(childList);
        }
        List<Category> categories = categoryMapper.selectList(null);
        categoryListJson = JSONObject.toJSONString(categories);
        RedisUtil.set("categoryList", categoryListJson);
        List<Category> childList = findChildList(id, categories);
        return ServerResponse.success(childList);
    }

    private List<Category> findChildList(Long id, List<Category> allCategories) {
        List<Category> categories = new ArrayList<>();
        for (Category category : allCategories) {
            if (category.getFatherId() == id) {
                categories.add(category);
            }
        }
        return categories;
    }

    @Override
    public ServerResponse addCategory(Category category) {
        RedisUtil.del("categoryList");
        categoryMapper.insert(category);
        System.out.println(category);
        return ServerResponse.success(category.getId());
    }

    @Override
    public ServerResponse updateCategory(Category category) {
        categoryMapper.updateById(category);
        return ServerResponse.success();
    }

    @Override
    public ServerResponse deleteBatch(List<Integer> ids) {
        categoryMapper.deleteBatchIds(ids);
        return ServerResponse.success();
    }

    @Override
    public ServerResponse findAllList() {
        String categoryListJson = RedisUtil.get("categoryList");
        if (StringUtils.isNotEmpty(categoryListJson)) {
            List<Category> categories = JSONObject.parseArray(categoryListJson, Category.class);
            return ServerResponse.success(categories);
        }
        List<Category> categories = categoryMapper.selectList(null);
        categoryListJson = JSONObject.toJSONString(categories);
        RedisUtil.set("categoryList", categoryListJson);
        return ServerResponse.success(categories);
    }
}
