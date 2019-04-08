/*************************************************************************/
/*                          Copyright Notice                             */
/* This code is only for use by Hangzhou Aoteng Electronics Co., Ltd.The */
/* code can not be copied or provided to other people without the        */
/* permission of Zhang Hao,otherwise intellectual property infringement  */
/* will be prosecuted.If you have any questions,please send me an email. */
/* My email is kingderzhang@foxmail.com. Note: the release of this code  */
/* version is also controlled by Hangzhou Aoteng Electronics Co., Ltd.   */
/* The final interpretation rights are interpreted by Hangzhou Aoteng    */
/* Electronics Co.                                                       */
/* Copyright(C) Hangzhou Aoteng Electronics Co., Ltd.All rights reserved */
/*************************************************************************/
import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

/**
 * @Title: 子菜单按钮
 * @FileName: UserButton.qml
 * @Description: 子菜单按钮布局
 * @Autor: zhanghao kinderzhang@foxmail.com
 * @date: 2019-01-07 10:48:52
 * @update_author
 * @update_time
 * @version V1.0
*/

Pane {
    contentWidth: width
    contentHeight: height
    padding: 0
    Material.elevation: 2

    id: root
    property string text    // 图标
    property string textColor: "#616161"    // 按钮颜色
    property string family  // 字体协议族名字
    property string toolTipStr    // 文本指示字符串
    property string backColor: "grey" //按钮背景颜色
    property double backOpacity: 0.2 //按钮背景透明度
    property bool flat: false //是否显示外边框
    property bool isToolTip: false // 是否显示提示信息
    signal clicked()  // 点击事件

    property double tempopacity: 0.2
    onFlatChanged: {
        if(flat){
            Material.elevation = 0
            tempopacity = 0
        }else{
            Material.elevation = 1
            tempopacity = 0.2
        }
    }

    Rectangle{
        id: back
        anchors.fill: parent
        color: backColor//Material.background
        opacity: tempopacity
        radius: 5

        NumberAnimation{
            id: enterAnimation
            target: back
            property: "opacity"
            easing.type: Easing.OutQuad
            from: tempopacity
            to: backOpacity + tempopacity
        }

        NumberAnimation{
            id: exitAnimation
            target: back
            property: "opacity"
            duration: 500
            easing.type: Easing.OutQuad
            from: backOpacity + tempopacity
            to: tempopacity
        }

    }

    // 图标
    Text {
        anchors.fill: parent
        font.family: family
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        color: textColor
        text: root.text
        Component.onCompleted: font.pointSize = parent.height / 2
    }
    ToolTip {
        id: tooltip
        text: toolTipStr
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        Component.onCompleted: {
            this.clicked.connect(root.clicked)
        }
        // 水波纹
        Ripple {
            anchors.fill: parent
            color: Material.rippleColor
            control: parent
            focused: false
        }
        onEntered: {
            if(isToolTip)
                tooltip.visible = true
            back.color = backColor
            enterAnimation.start()
        }
        onExited: {
            if(isToolTip)
                tooltip.visible = false
            exitAnimation.start()
        }
    }
}
