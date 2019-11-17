package com.fh.shop.admin;

import com.fh.shop.admin.po.brand.Brand;
import com.fh.shop.admin.po.category.Category;
import com.fh.shop.admin.po.user.User;
import org.junit.Test;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class TestReflect {


    @Test
    public void test2() {
        Brand brand = new Brand();
        brand.setBrandName("小米");
        brand.setSort(10);
        brand.setHot(1);
        // 动态获取所有属性的值[反射]
        show3(brand, Brand.class);
    }

    private void show3(Brand brand, Class clazz) {
        // 获取这个类所有的属性字段
        Field[] declaredFields = clazz.getDeclaredFields();
        for (Field declaredField : declaredFields) {
            // 可访问
            declaredField.setAccessible(true);
            // 调用brand对象对应的属性的get方法
            // brandName.get(brand);
            try {
                Object o = declaredField.get(brand);
                System.out.println(declaredField.getName()+":"+o);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
    }


    @Test
    public void test1() {
        show(Brand.class);

        showMethods(Brand.class);
    }

    public void show(Class clazz) {
        Field[] declaredFields = clazz.getDeclaredFields();
        for (Field f : declaredFields) {
            System.out.println(f.getName()+":"+f.getType());
        }
    }

    public void showMethods(Class clazz) {
        Method[] declaredMethods = clazz.getDeclaredMethods();
        for (Method declaredMethod : declaredMethods) {
            System.out.println(declaredMethod.getName());
        }
    }



}
