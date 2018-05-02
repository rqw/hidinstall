package com.haojiankang.install.hid.utils;

import java.util.HashMap;
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
    public static boolean executeCmd(Cmd cmd,Writer wr){
        CmdExecute execute=CMD_EXECUTE.get(cmd.getCmd());
        if(execute==null){
            wr.writer(new HashMap<String,Object>(){{put("process","不支持的命令："+cmd.getCmd());}});
            return false;
        }
        return execute.execute(cmd,wr);
    }
    @FunctionalInterface
    public static interface  CmdExecute{
        boolean execute(Cmd cmd, Writer wr);
    }
    public static interface  Cmd{
        String getCmd();
        List<String> getArgs();
    }
}
