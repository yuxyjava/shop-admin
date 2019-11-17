package com.fh.shop.admin.po.product;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fh.shop.admin.po.brand.Brand;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Product implements Serializable {

    private Long id;

    private String productName;

    @TableField(value = "price")
    private BigDecimal productPrice;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createDate;

    private int status;

    private Long brandId;

    private String mainImage;

    @TableField(exist = false)
    private String oldImagePath;

    private Long cate1;

    private Long cate2;

    private Long cate3;

    @TableField(exist = false)
    private String cateName;

    @TableField(exist = false)
    private Brand brand = new Brand();

    @TableField(exist = false)
    private String brandName;

    public String getOldImagePath() {
        return oldImagePath;
    }

    public void setOldImagePath(String oldImagePath) {
        this.oldImagePath = oldImagePath;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    public Long getCate1() {
        return cate1;
    }

    public void setCate1(Long cate1) {
        this.cate1 = cate1;
    }

    public Long getCate2() {
        return cate2;
    }

    public void setCate2(Long cate2) {
        this.cate2 = cate2;
    }

    public Long getCate3() {
        return cate3;
    }

    public void setCate3(Long cate3) {
        this.cate3 = cate3;
    }

    public String getMainImage() {
        return mainImage;
    }

    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }

    public Long getBrandId() {
        return brandId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public BigDecimal getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(BigDecimal productPrice) {
        this.productPrice = productPrice;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
