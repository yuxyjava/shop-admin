package com.fh.shop.admin.controller.product;

import com.fh.shop.admin.biz.product.IProductService;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.param.product.ProductSearchParam;
import com.fh.shop.admin.po.product.Product;
import com.fh.shop.admin.util.ExcelUtil;
import com.fh.shop.admin.util.FileUtil;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RequestMapping("/product")
@Controller
public class ProductController {

    @Resource(name = "productService")
    private IProductService productService;
    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/index")
    public String index() {
        return "product/index";
    }

    @RequestMapping("/add")
    @ResponseBody
    public ServerResponse add(Product product) {
        return productService.addProduct(product);
    }

    @RequestMapping("/list")
    @ResponseBody
    public ServerResponse list(ProductSearchParam productSearchParam) {
        return productService.findList(productSearchParam);
    }



    @RequestMapping("/delete")
    @ResponseBody
    public ServerResponse delete(Long id) {
        return productService.deleteProduct(id);
    }

    @RequestMapping("/exportExcel")
    public void exportExcel(ProductSearchParam productSearchParam, HttpServletResponse response) {
        // 查询符合条件的数据
        List<Product> productList = productService.findProductList(productSearchParam);
        // 转换为指定的格式
        String[] headers = {"商品名","日期","商品价格"};
        String[] props = {"productName", "createDate", "productPrice"};
        XSSFWorkbook workbook = ExcelUtil.buildWorkBook(productList, headers, props, "商品列表");
        // 下载excel
        FileUtil.excelDownload(workbook, response);
    }



    @RequestMapping("/find")
    @ResponseBody
    public ServerResponse find(Long id) {
        return productService.findProduct(id);
    }



    @RequestMapping("/update")
    @ResponseBody
    public ServerResponse update(Product product) {
//        String oldImageRealPath = request.getServletContext().getRealPath(product.getOldImagePath());
        return productService.updateProduct(product);
    }

    @RequestMapping("/updateProductStatus")
    @ResponseBody
    public ServerResponse updateProductStatus(Long id, int status) {
        return productService.updateProductStatus(id, status);
    }
}
