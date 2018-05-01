package com.haojiankang.hid.install.utils;

import com.haojiankang.hid.install.exception.DbException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JdbcUtils {
    private Connection connection;
    public void setConnection(Connection connection){
        this.connection=connection;
    }
    public String getString(String sql){
        try(
                PreparedStatement pst=connection.prepareStatement(sql);
                ResultSet rst=pst.executeQuery();
        ){
            if(rst.next())
                return rst.getString(1);
            return null;
        }catch(Exception e){
            throw new DbException(e);
        }
    }
    public Integer getInt(String sql){
        try(
                PreparedStatement pst=connection.prepareStatement(sql);
                ResultSet rst=pst.executeQuery();
        ){
            if(rst.next())
                return rst.getInt(1);
            return null;
        }catch(Exception e){
            throw new DbException(e);
        }
    }
}
