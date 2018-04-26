package com.haojiankang.hid.install.utils;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class ApplicationContext {
    private static Map<Object,Object> context=new ConcurrentHashMap<>();
    public static <T> T get(Object key){
        return (T)context.get(key);
    }
    public static void put(Object key,Object value){
        context.put(key,value);
    }
}
