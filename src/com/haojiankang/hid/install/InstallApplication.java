package com.haojiankang.hid.install;

import com.haojiankang.hid.install.utils.ApplicationContext;
import com.haojiankang.hid.install.utils.ConfigUtils;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class InstallApplication extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception{
        Parent root = FXMLLoader.load(getClass().getResource("fxml/DbInstall.fxml"));
        Scene dbinstall= new Scene(root, 440, 300);
        primaryStage.setTitle(ConfigUtils.single().get("title","一体机系统3.0版本安装程序"));
        primaryStage.setScene(dbinstall);
        primaryStage.setMaximized(false);
        primaryStage.setResizable(false);
        primaryStage.show();
        primaryStage.setOnCloseRequest(e->{
            System.exit(0);
        });
        ApplicationContext.put("stage.primary",primaryStage);
        ApplicationContext.put("scene.dbinstall",dbinstall);
    }


    public static void main(String[] args) {
        launch(args);
    }
}
