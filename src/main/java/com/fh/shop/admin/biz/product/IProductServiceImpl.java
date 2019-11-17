package com.fh.shop.admin.biz.product;

import com.alibaba.fastjson.JSONObject;
import com.fh.shop.admin.common.DataTableResult;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.mapper.category.ICategoryMapper;
import com.fh.shop.admin.mapper.product.IProductMapper;
import com.fh.shop.admin.param.product.ProductSearchParam;
import com.fh.shop.admin.po.category.Category;
import com.fh.shop.admin.po.product.Product;
import com.fh.shop.admin.util.DateUtil;
import com.fh.shop.admin.util.FileUtil;
import com.fh.shop.admin.util.OSSUtil;
import com.fh.shop.admin.util.RedisUtil;
import com.fh.shop.admin.vo.product.ProductVo;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("productService")
public class IProductServiceImpl implements IProductService {

    @Autowired
    private IProductMapper productMapper;
    @Autowired
    private ICategoryMapper categoryMapper;

    @Override
    public ServerResponse addProduct(Product product) {
        productMapper.insert(product);
        return ServerResponse.success();
    }

    @Override
    public ServerResponse findList(ProductSearchParam productSearchParam) {
        long totalCount = productMapper.findProductListCount(productSearchParam);
        List<Product> productList = productMapper.findProductPageList(productSearchParam);
        List<ProductVo> productVoList = buildProductVoList(productList);
        DataTableResult result = new DataTableResult(productSearchParam.getDraw(), totalCount, totalCount, productVoList);
        return ServerResponse.success(result);
    }

    @Override
    public ServerResponse deleteProduct(Long id) {
        productMapper.deleteById(id);
        return ServerResponse.success();
    }

    @Override
    public ServerResponse findProduct(Long id) {
        Product product = productMapper.selectById(id);
//        String c1 = categoryMapper.selectById(product.getCate1()).getCategoryName();
//        String c2 = categoryMapper.selectById(product.getCate2()).getCategoryName();
//        String c3 = categoryMapper.selectById(product.getCate3()).getCategoryName();
//        product.setCateName(c1+"-->"+c2+"-->"+c3);
//        String cateName = productMapper.findProductCate(id);
        String categoryListJson = RedisUtil.get("categoryList");
        if (StringUtils.isNotEmpty(categoryListJson)) {
            List<Category> categories = JSONObject.parseArray(categoryListJson, Category.class);
            String c1 = findCategoryName(product.getCate1(), categories);
            String c2 = findCategoryName(product.getCate2(), categories);
            String c3 = findCategoryName(product.getCate3(), categories);
            product.setCateName(c1+"-->"+c2+"-->"+c3);
        } else {
            List<Category> categories = categoryMapper.selectList(null);
            categoryListJson = JSONObject.toJSONString(categories);
            RedisUtil.set("categoryList", categoryListJson);
            String c1 = findCategoryName(product.getCate1(), categories);
            String c2 = findCategoryName(product.getCate2(), categories);
            String c3 = findCategoryName(product.getCate3(), categories);
            product.setCateName(c1+"-->"+c2+"-->"+c3);
        }
        ProductVo productVo = buildProductVo(product);
        return ServerResponse.success(productVo);
    }

    private String findCategoryName(Long id, List<Category> categories) {
        for (Category category : categories) {
            if (category.getId() == id) {
                return category.getCategoryName();
            }
        }
        return "";
    }

    @Override
    public ServerResponse updateProduct(Product product) {
        String mainImage = product.getMainImage();
        String oldPath = product.getOldImagePath();
        if (StringUtils.isEmpty(mainImage)) {
            // 用户没有修改
            product.setMainImage(oldPath);
        } else {
            // 用户上传了新图片,删除老图片
//            FileUtil.deleteFile(oldImageRealPath);
            OSSUtil.deleteFile(oldPath);
        }
        productMapper.updateById(product);
        return ServerResponse.success();
    }

    @Override
    public ServerResponse updateProductStatus(Long id, int status) {
        Product product = new Product();
        product.setId(id);
        product.setStatus(status);
        productMapper.updateById(product);
        return ServerResponse.success();
    }

    @Override
    public List<Product> findProductList(ProductSearchParam productSearchParam) {
        List<Product> productList = productMapper.findProductList(productSearchParam);
        return productList;
    }





    private List<ProductVo> buildProductVoList(List<Product> productList) {
        List<ProductVo> productVoList = new ArrayList<>();
        for (Product product : productList) {
            ProductVo productVo = buildProductVo(product);
            productVoList.add(productVo);
        }
        return productVoList;
    }

    private ProductVo buildProductVo(Product product) {
        ProductVo productVo = new ProductVo();
        productVo.setId(product.getId());
        productVo.setProductName(product.getProductName());
        productVo.setPrice(product.getProductPrice().toString());
        productVo.setCreateDate(DateUtil.date2str(product.getCreateDate(), DateUtil.Y_M_D));
        productVo.setStatus(product.getStatus());
        productVo.setBrandName(product.getBrand().getBrandName());
        productVo.setMainImage(product.getMainImage());
        productVo.setBrandId(product.getBrandId());
        productVo.setCateName(product.getCateName());
        return productVo;
    }


}
