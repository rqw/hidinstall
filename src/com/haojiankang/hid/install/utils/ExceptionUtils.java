package com.haojiankang.hid.install.utils;

public class ExceptionUtils {
    public static String[] toString(Throwable e){
        String[] message=new String[]{"",""};
        while(e!=null){
            message[0]+=e.getMessage()+"\n";
            for(StackTraceElement stack:e.getStackTrace()){
                message[1]+=stack.toString()+"\n";
            }
            e=e.getCause();
        }
        return message;
    }
}
