package com.haojiankang.hid.install.utils;

public class ConfigUtils {
    private static final ConfigUtils utils=new ConfigUtils();
    public static ConfigUtils single(){
        return utils;
    }
    private ConfigUtils(){

    }
    public String get(String key,String defaultValue){
        return defaultValue;
    }
    public String get(String key ){
        return null;
    }


}
