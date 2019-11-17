package com.fh.shop.admin.po.nik;

import java.io.Serializable;

public class Car  implements Serializable {

    private String carName;

    private Integer age;

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}
