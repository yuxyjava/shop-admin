package com.fh.shop.admin.po.wanghao;

import java.io.Serializable;

public class Book implements Serializable {

    private String book;
    private String wanghao;

    public String getWanghao() {
        return wanghao;
    }

    public void setWanghao(String wanghao) {
        this.wanghao = wanghao;
    }

    public String getBook() {
        return book;
    }

    public void setBook(String book) {
        this.book = book;
    }
}
