package com.haojiankang.install.hid.utils;

import com.haojiankang.install.hid.model.DbModel;
import com.haojiankang.install.hid.model.UserInfoModel;
import org.xidea.el.Expression;
import org.xidea.el.impl.ExpressionFactoryImpl;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class ApplicationContext {
    private static Map<Object,Object> context=new ConcurrentHashMap<>();
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
