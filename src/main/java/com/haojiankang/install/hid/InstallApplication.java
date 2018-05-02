package com.haojiankang.install.hid;

import com.haojiankang.install.hid.utils.ApplicationContext;
import com.haojiankang.install.hid.utils.ViewUtils;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.stage.Stage;

public class InstallApplication extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception{
        Parent root = FXMLLoader.load(getClass().getResource("fxml/db.fxml"));
        Scene dbinstall= new Scene(root, 440, 300);
        primaryStage.setTitle(ViewUtils.single().get("title","一体机系统3.0版本安装程序"));
        primaryStage.setScene(dbinstall);
        primaryStage.getIcons().add(new Image("/logo.jpg"));
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
