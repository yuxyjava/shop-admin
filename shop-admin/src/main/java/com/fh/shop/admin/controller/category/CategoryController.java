package com.fh.shop.admin.controller.category;

import com.fh.shop.admin.biz.category.ICategoryService;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.po.category.Category;
import com.fh.shop.admin.vo.resource.ResourceVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@RequestMapping("/category")
@Controller
public class CategoryController {

    @Resource(name="categoryService")
    private ICategoryService categoryService;

    @RequestMapping("/findList")
    @ResponseBody
    public ServerResponse findList(Long id) {
        // 以当前id作为父亲，找孩子
        return categoryService.findList(id);
    }

    @RequestMapping("/index")
    public String toIndex() {
        return "category/index";
    }

    @RequestMapping("/list")
    @ResponseBody
    public ServerResponse list() {
        ServerResponse allList = categoryService.findAllList();
        return allList;
    }

    @ResponseBody
    @RequestMapping("/update")
    public ServerResponse update(Category category) {
        return categoryService.updateCategory(category);
    }

    @RequestMapping("/deleteBatch")
    @ResponseBody
    public ServerResponse deleteBatch(@RequestParam("ids[]") List<Integer> ids) {
        return categoryService.deleteBatch(ids);
    }

    @RequestMapping("/add")
    @ResponseBody
    public ServerResponse add(Category category) {
        return categoryService.addCategory(category);
    }





}
