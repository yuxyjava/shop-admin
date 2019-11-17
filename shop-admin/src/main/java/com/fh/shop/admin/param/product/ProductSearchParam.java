package com.fh.shop.admin.param.product;

import com.fh.shop.admin.common.Page;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

public class ProductSearchParam extends Page {

    private String productName;

    private BigDecimal minPrice;

    private BigDecimal maxPrice;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date minCreateDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date maxCreateDate;

    private Long brandId;

    private Long cate1;

    private Long cate2;

    private Long cate3;

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

    public Long getBrandId() {
        return brandId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public BigDecimal getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(BigDecimal minPrice) {
        this.minPrice = minPrice;
    }

    public BigDecimal getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(BigDecimal maxPrice) {
        this.maxPrice = maxPrice;
    }

    public Date getMinCreateDate() {
        return minCreateDate;
    }

    public void setMinCreateDate(Date minCreateDate) {
        this.minCreateDate = minCreateDate;
    }

    public Date getMaxCreateDate() {
        return maxCreateDate;
    }

    public void setMaxCreateDate(Date maxCreateDate) {
        this.maxCreateDate = maxCreateDate;
    }
}
