package com.fh.shop.admin.util;

import com.fh.shop.admin.po.product.Product;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.*;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class ExcelUtil {

    public static XSSFWorkbook buildWorkBook(List dataList, String[] headers, String[] props, String sheetName) {
        XSSFWorkbook workbook = new XSSFWorkbook();
        // 创建样式
        XSSFCellStyle numStyle = workbook.createCellStyle();
        numStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("0.00"));
        XSSFSheet sheet = workbook.createSheet(sheetName);
        XSSFCellStyle dateStyle = workbook.createCellStyle();
        dateStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy"));
        // 构建头
        buildTitle(sheet, headers);
        // 构建主体
        buildBody(dataList, numStyle, sheet, dateStyle, props);
        return workbook;
    }


    private static void buildBody(List dataList, XSSFCellStyle numStyle, XSSFSheet sheet, XSSFCellStyle dateStyle, String[] props) {
        for (int i = 0; i < dataList.size(); i++) {
            Object data = dataList.get(i);
            XSSFRow row = sheet.createRow(i+1);
            Class<?> aClass = data.getClass();
            int j = 0;
            for (String prop : props) {
                try {
                    Field declaredField = aClass.getDeclaredField(prop);
                    declaredField.setAccessible(true);
                    Object o = declaredField.get(data);
                    Class<?> type = declaredField.getType();
                    if (type == java.lang.String.class) {
                        row.createCell(j++).setCellValue(o.toString());
                    }
                    if (type == java.math.BigDecimal.class) {
                        XSSFCell cell = row.createCell(j++);
                        cell.setCellValue(((BigDecimal)o).doubleValue());
                        cell.setCellStyle(numStyle);
                    }
                    if (type == java.util.Date.class) {
                        XSSFCell cell = row.createCell(j++);
                        cell.setCellValue((Date)o);
                        cell.setCellStyle(dateStyle);
                    }
                } catch (NoSuchFieldException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }

            }

        }
    }


    private static void buildTitle(XSSFSheet sheet, String[] headers) {
        XSSFRow headerRow = sheet.createRow(0);
        for (int i = 0; i < headers.length; i++) {
            headerRow.createCell(i).setCellValue(headers[i]);
        }
    }
}
