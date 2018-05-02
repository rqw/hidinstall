package com.haojiankang.install.hid.model;

public class DbModel {
    private ConnectionModel cModel;

    public DbModel(ConnectionModel cModel) {
        this.cModel = cModel;
    }

    private UserInfoModel uModel;
    {
        uModel=new UserInfoModel();
    }

    public ConnectionModel getcModel() {
        return cModel;
    }

    public void setcModel(ConnectionModel cModel) {
        this.cModel = cModel;
    }

    public UserInfoModel getuModel() {
        return uModel;
    }

    public void setuModel(UserInfoModel uModel) {
        this.uModel = uModel;
    }
    public void setUsername(String username){
        uModel.setUsername(username);
    }
    public void setPassword(String password){
        uModel.setPassword(password);
    }
}
