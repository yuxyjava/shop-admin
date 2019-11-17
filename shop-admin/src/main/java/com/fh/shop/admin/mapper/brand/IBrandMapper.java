package com.fh.shop.admin.mapper.brand;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fh.shop.admin.param.brand.BrandSearchParam;
import com.fh.shop.admin.po.brand.Brand;

import java.util.List;

public interface IBrandMapper extends BaseMapper<Brand> {

    Long findListCount(BrandSearchParam brandSearchParam);

    List<Brand> findPageList(BrandSearchParam brandSearchParam);

    List<Brand> findBrandList(BrandSearchParam brandSearchParam);
}
