package com.fh.shop.admin.po.houbowe3;

import java.io.Serializable;

public class Photos implements Serializable {


    private Integer Id;

    private String pName;

    private Integer count;


    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
