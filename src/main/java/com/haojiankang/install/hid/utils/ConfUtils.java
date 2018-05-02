package com.haojiankang.install.hid.utils;

import com.haojiankang.install.hid.model.ConfHandlerModel;
import org.apache.commons.lang3.StringUtils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ConfUtils {
    private Map<String, ConfHandlerModel> confs = new HashMap<>();

    private ConfUtils() {
        readConfFile();
    }

    private void readConfFile() {
        File file = new File(getClass().getResource("/conf/handler.conf").getFile());
        try(
                FileReader reader = new FileReader(file);
                BufferedReader br = new BufferedReader(reader);
        ){
            String line;
            List list=new ArrayList();
            ConfHandlerModel currentConf=null;
            StringBuilder content=new StringBuilder();
            while((line=br.readLine())!=null){
                if(line.trim().length()==0||line.trim().startsWith("#"))
                    continue;
                if(currentConf==null&&line.trim().matches(".*\\{$")){
                    currentConf=new ConfHandlerModel();
                    confs.put(StringUtils.substringBefore(line,"{"),currentConf);
                }else if(currentConf!=null&&line.trim().equals("}")){
                    currentConf.analyzeConf(content.toString());
                    currentConf=null;
                }else{
                    content.append(line);
                }
            }
        }catch(IOException e) {
            MessageBox.alert("解析handler.conf文件遇到问题.",e);
        }
    }

    private static ConfUtils confUtils = new ConfUtils();

    public static ConfHandlerModel getConf(String key) {
        return confUtils.confs.get(key);
    }
}
