package com.fh.util;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.Iterator;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.fh.lw.utils.RandomString;

public class ReadExcel {
	public static void main(String[] args) {
		readXml("D:/4444.xls");
		

	}

	public static void readXml(String fileName) {
		boolean isE2007 = false; // 判断是否是excel2007格式

	

		if (fileName.endsWith("xls"))
			isE2007 = true;
		try {
			InputStream input = new FileInputStream(fileName); // 建立输入流
			Workbook wb = null;
			// 根据文件格式(2003或者2007)来初始化
			if (isE2007)
				wb = new XSSFWorkbook(input);
			else
				wb = new HSSFWorkbook(input);
			Sheet sheet = wb.getSheetAt(0); // 获得第一个表单
			Iterator<Row> rows = sheet.rowIterator(); // 获得第一个表单的迭代器
			while (rows.hasNext()) {
				Row row = rows.next(); // 获得行数据
				// System.out.println("Row #" + row.getRowNum()); //获得行号从0开始
				Iterator<Cell> cells = row.cellIterator(); // 获得第一行的迭代器
				while (cells.hasNext()) {
					Cell cell = cells.next();
					// System.out.println("Cell #" + cell.getColumnIndex());
					switch (cell.getCellType()) { // 根据cell中的类型来输出数据
					case HSSFCell.CELL_TYPE_NUMERIC:
						DecimalFormat formatter = new DecimalFormat("########");
						String str = formatter.format(cell.getNumericCellValue());
						
						String password = RandomString.md5JM("888888", "nihaofffff");
						
						break;
					case HSSFCell.CELL_TYPE_STRING:
					

						break;
					default:
						System.out.println("unsuported sell type");
						break;
					}
				}
		
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
}