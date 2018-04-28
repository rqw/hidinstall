package com.haojiankang.hid.install.utils;

public class ViewUtils {
    private static final ViewUtils utils=new ViewUtils();
    public static ViewUtils single(){
        return utils;
    }
    private ViewUtils(){

    }
    public String get(String key,String defaultValue){
        return defaultValue;
    }
    public String get(String key ){
        return null;
    }


}
