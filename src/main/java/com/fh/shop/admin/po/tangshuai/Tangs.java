package com.fh.shop.admin.po.tangshuai;

import java.io.Serializable;

public class Tangs implements Serializable {
  private String name;
  private int sex;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getSex() {
    return sex;
  }

  public void setSex(int sex) {
    this.sex = sex;
  }
}
