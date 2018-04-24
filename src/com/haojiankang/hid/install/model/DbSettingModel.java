package com.haojiankang.hid.install.model;

public class DbSettingModel {
    private DbModel databaseInfo=new DbModel();
    private DbUserModel dbaUserinfo=new DbUserModel();
    private DbUserModel ytgUserinfo=new DbUserModel();
    private DbUserModel yshareUserinfo=new DbUserModel();
    private DbUserModel hidUserinfo=new DbUserModel();
    private DbUserModel interchgUserinfo=new DbUserModel();

    public DbModel getDatabaseInfo() {
        return databaseInfo;
    }

    public void setDatabaseInfo(DbModel databaseInfo) {
        this.databaseInfo = databaseInfo;
    }

    public DbUserModel getDbaUserinfo() {
        return dbaUserinfo;
    }

    public void setDbaUserinfo(DbUserModel dbaUserinfo) {
        this.dbaUserinfo = dbaUserinfo;
    }

    public DbUserModel getYtgUserinfo() {
        return ytgUserinfo;
    }

    public void setYtgUserinfo(DbUserModel ytgUserinfo) {
        this.ytgUserinfo = ytgUserinfo;
    }

    public DbUserModel getYshareUserinfo() {
        return yshareUserinfo;
    }

    public void setYshareUserinfo(DbUserModel yshareUserinfo) {
        this.yshareUserinfo = yshareUserinfo;
    }

    public DbUserModel getHidUserinfo() {
        return hidUserinfo;
    }

    public void setHidUserinfo(DbUserModel hidUserinfo) {
        this.hidUserinfo = hidUserinfo;
    }

    public DbUserModel getInterchgUserinfo() {
        return interchgUserinfo;
    }

    public void setInterchgUserinfo(DbUserModel interchgUserinfo) {
        this.interchgUserinfo = interchgUserinfo;
    }
}
