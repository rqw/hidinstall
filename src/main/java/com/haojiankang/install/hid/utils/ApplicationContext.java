package com.haojiankang.install.hid.utils;

import org.xidea.el.Expression;
import org.xidea.el.impl.ExpressionFactoryImpl;

import java.util.HashMap;
import java.util.Map;

public class ApplicationContext {
    private static Map<Object,Object> context=new HashMap<>();
    private static  ExpressionFactoryImpl factory= new ExpressionFactoryImpl();

    public static <T> T get(Object key){
        return (T)context.get(key);
    }
    public static void put(Object key,Object value){
        context.put(key,value);
    }
    public static String eval(String elo){
        Expression expression= factory.create(elo);
        return expression.evaluate(context).toString();
    }
}
