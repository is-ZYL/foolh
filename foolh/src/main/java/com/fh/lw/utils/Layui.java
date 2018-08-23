package com.fh.lw.utils;

import java.util.HashMap;
import java.util.List;

/**
 * 封装list数据并返回layerUI数据
 * @author yuanyuana
 *
 * 2018年8月14日 下午3:38:12
 */
public class Layui  extends HashMap<String, Object> {

    public static Layui data(Long count,List<?> data){
        Layui r = new Layui();
        r.put("code", 0);
        r.put("msg", "");
        r.put("count", count);
        r.put("data", data);
        return r;
    }
}
