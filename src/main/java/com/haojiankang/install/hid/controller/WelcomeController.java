package com.haojiankang.install.hid.controller;

import com.haojiankang.install.hid.utils.FxUtils;
import com.haojiankang.install.hid.utils.MessageBox;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonBar;
import javafx.stage.Stage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import sun.plugin2.message.Message;

import java.io.IOException;

public class WelcomeController {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @FXML
    public void handlerUpgrade(ActionEvent event) {
        MessageBox.confirm("将要执行<升级3.0>操作，确认当前环境是否已经安装2.5版本的一体机管理系统?",btn->{
            if(btn.getButtonData().equals(ButtonBar.ButtonData.YES)){
                //执行升级
                Stage stage = new Stage();
                try {
                    FxUtils.standardByFxml(stage,"com/haojiankang/install/hid/fxml/updateConf.fxml",e->{
                        MessageBox.confirm("确认退出安装程序？",b->{
                            e.consume();
                            if(b.getButtonData().equals(ButtonBar.ButtonData.YES)){
                                Platform.exit();
                            }else{
                                System.out.println("text");
                            }
                        });
                    });
                    stage.show();
                    FxUtils.getWindowsByButtonEvent(event).hide();
                } catch (Exception e) {
                    MessageBox.alert(e.getMessage(),e);
                    logger.error(e.getMessage(),e);
                }

            }else{
                //不执行任何操作
            }
        });
    }
    @FXML
    public void handlerInstall(ActionEvent event){

    }
}
