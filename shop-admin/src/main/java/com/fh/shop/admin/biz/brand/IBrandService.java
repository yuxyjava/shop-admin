package com.fh.shop.admin.biz.brand;

import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.param.brand.BrandSearchParam;
import com.fh.shop.admin.po.brand.Brand;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.util.List;

public interface IBrandService {

    public ServerResponse findAll();

    ServerResponse findList(BrandSearchParam brandSearchParam);

    ServerResponse updateBrandHot(Long id, Integer hot);

    ServerResponse updateBrandSort(Long id, Integer sort);

    ServerResponse addBrand(Brand brand);

    List<Brand> findBrandList(BrandSearchParam brandSearchParam);


}
