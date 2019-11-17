package com.fh.shop.admin.controller.brand;


import com.fh.shop.admin.biz.brand.IBrandService;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.param.brand.BrandSearchParam;
import com.fh.shop.admin.po.brand.Brand;
import com.fh.shop.admin.util.ExcelUtil;
import com.fh.shop.admin.util.FileUtil;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RequestMapping("/brand")
@Controller
public class BrandController {

    @Resource(name = "brandService")
    private IBrandService brandService;

    @RequestMapping(value="/findAll", method = {RequestMethod.POST,RequestMethod.GET,RequestMethod.PUT})
    @ResponseBody
    public ServerResponse findAll() {
        ServerResponse all = brandService.findAll();
        return all;
    }


    @RequestMapping("/exportExcel")
    public void exportExcel(BrandSearchParam brandSearchParam, HttpServletResponse response) {
        // 查询符合条件的数据[不带分页]
        List<Brand> brandList = brandService.findBrandList(brandSearchParam);
        // 转换为指定的格式
        String[] headers = {"品牌名", "是否热销", "排序"};
        String[] props = {"brandName", "hot", "sort"};
        XSSFWorkbook workbook = ExcelUtil.buildWorkBook(brandList, headers, props, "品牌列表");
        // 下载
        FileUtil.excelDownload(workbook, response);


    }

    @RequestMapping("/index")
    public String index() {
        return "brand/index";
    }

    @RequestMapping("/add")
    @ResponseBody
    public ServerResponse add(Brand brand) {
        return brandService.addBrand(brand);
    }

    @RequestMapping("/list")
    @ResponseBody
    public ServerResponse list(BrandSearchParam brandSearchParam) {
       return brandService.findList(brandSearchParam);
    }

    @RequestMapping("/updateBrandHot")
    @ResponseBody
    public ServerResponse updateBrandHot(Long id, Integer hot) {
        return brandService.updateBrandHot(id, hot);
    }

    @RequestMapping("/updateBrandSort")
    @ResponseBody
    public ServerResponse updateBrandSort(Long id, Integer sort) {
        return brandService.updateBrandSort(id, sort);
    }
}
