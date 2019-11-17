package com.fh.shop.admin.po.gaoyuanhang;

import java.io.Serializable;
import java.math.BigDecimal;

public class Student implements Serializable {
    private Long id;

    private String stuName;

    private BigDecimal price;

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }
}
