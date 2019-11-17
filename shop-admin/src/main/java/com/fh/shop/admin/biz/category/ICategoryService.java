package com.fh.shop.admin.biz.category;

import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.po.category.Category;
import com.fh.shop.admin.po.resource.Resource;
import com.fh.shop.admin.vo.resource.ResourceVo;

import java.util.List;

public interface ICategoryService {

    public ServerResponse findList(Long id);

    ServerResponse addCategory(Category category);

    ServerResponse updateCategory(Category category);

    ServerResponse deleteBatch(List<Integer> ids);

    ServerResponse findAllList();
}
