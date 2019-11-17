package com.fh.shop.admin.po.gaoyuanhang;

import java.io.Serializable;

public class Student implements Serializable {
    private Long id;

    private String stuName;

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
