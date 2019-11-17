package com.fh.shop.admin.biz.product;

import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.param.product.ProductSearchParam;
import com.fh.shop.admin.po.product.Product;
import com.fh.shop.admin.vo.product.ProductVo;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.util.List;

public interface IProductService {

    public ServerResponse addProduct(Product product);

    ServerResponse findList(ProductSearchParam productSearchParam);


    ServerResponse deleteProduct(Long id);

    ServerResponse findProduct(Long id);

    ServerResponse updateProduct(Product product);

    ServerResponse updateProductStatus(Long id, int status);

    List<Product> findProductList(ProductSearchParam productSearchParam);

}
