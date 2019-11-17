package com.fh.shop.admin.po.HoubowenTwo;

import java.io.Serializable;
import java.math.BigDecimal;

public class Car implements Serializable {

    private String CarName;

    private BigDecimal price;


    public String getCarName() {
        return CarName;
    }

    public void setCarName(String carName) {
        CarName = carName;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
