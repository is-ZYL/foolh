package com.fh.lw.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class NumberTest {
	/**
	 * 将一个整数拆分成l份
	 * @param n份数
	 * @param L总数
	 * @return
	 */
	public static Integer random(int n, int L){
		List<Integer> list=new ArrayList<Integer>();//定义一个集合接收生成的随机数
		Random rand = new Random();
		int temp = L;
		for(int i = 1, j; i < n; i++){
			j = rand.nextInt(temp-1) + 1;
			if(j > temp-(n-i)){//保证每个随机数最小为1，那么j就不能大于temp-(n-i)            	
				j = temp-(n-i);
				}else if(j<= 0){
					j = 1;
					} 
			temp -= j;
			list.add(j);
			}  
		list.add(temp);
		
		if(n>3) {
			double d=L*0.5;
			for (Integer integer : list) {
				if(integer<=d) {
					return integer;
				}
			}
		}
		return list.get(0);
		}
		
}
