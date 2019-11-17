package com.fh.shop.admin;

import com.fh.shop.admin.po.brand.Brand;
import com.fh.shop.admin.po.product.Product;
import org.junit.Test;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class TestDemo {

    @Test
    public void test1() {
//        showInfo(Product.class);
//        showinfo2(Brand.class);

        Brand brand = new Brand();
        brand.setBrandName("aa");
        brand.setHot(1);
        showinfo3(Brand.class, brand);
    }

    private void showInfo(Class clazz) {
        Field[] declaredFields = clazz.getDeclaredFields();
        for (Field declaredField : declaredFields) {
            System.out.println(declaredField.getName()+":"+declaredField.getType());
        }
    }

    private void showinfo2(Class clazz) {
        Method[] declaredMethods = clazz.getDeclaredMethods();
        for (Method declaredMethod : declaredMethods) {
            System.out.println(declaredMethod.getName());
        }
    }

    private void showinfo3(Class clazz, Object object) {
        Field[] declaredFields = clazz.getDeclaredFields();
        for (Field declaredField : declaredFields) {
            try {
                declaredField.setAccessible(true);
                Object o = declaredField.get(object);
                System.out.println(declaredField.getName()+":"+o);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }

    }
}
