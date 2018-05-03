package com.haojiankang.install.hid;

import com.haojiankang.install.hid.utils.ApplicationContext;
import com.haojiankang.install.hid.utils.FxUtils;
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
        FxUtils.standardByFxml(primaryStage,"com/haojiankang/install/hid/fxml/welcome.fxml",null);
        primaryStage.show();
    }


    public static void main(String[] args) {
        launch(args);
    }
}
