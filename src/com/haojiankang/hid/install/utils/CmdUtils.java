package com.haojiankang.hid.install.utils;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class CmdUtils {
    private static Map<String,CmdExecute> CMD_EXECUTE=new ConcurrentHashMap<>();
    public static boolean registerExecute(String cmd,CmdExecute execute){
        if(CMD_EXECUTE.containsKey(cmd)){
            return false;
        }
        CMD_EXECUTE.put(cmd,execute);
        return true;
    }
    public static boolean executeCmd(Cmd cmd,StringBuilder out){
        CmdExecute execute=CMD_EXECUTE.get(cmd.getCmd());
        if(execute==null){
            out.append("不支持的命令："+cmd.getCmd());
            return false;
        }
        return execute.execute(cmd,out);
    }
    @FunctionalInterface
    public static interface  CmdExecute{
        boolean execute(Cmd cmd,StringBuilder out);
    }
    public static interface  Cmd{
        String getCmd();
        List<String> getArgs();
    }
}
