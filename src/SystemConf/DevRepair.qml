/**
   * @className: DevRepair
   * @descption: 设备维护主页面
   * @author: zhangh
   * @date: 2019-04-08
*/
import QtQuick 2.0
import QtQuick.Controls 2.4

Item {
    //  设置标签字体的大小
    property int defaultFontSize: 20

    //  设置配置项字体的大小
    property int confFontSize: 15

    Text {
        id: portlabeltittle
        font.pointSize: defaultFontSize
        text: qsTr("Port Setting")
    }

    Item { // 序列号
        id: serialItem
        y: portlabeltittle.height + 20
        height: getSeralNumBtn.height
        width: parent.width

        Text {
            text: qsTr("Serial Number:")
            font.pointSize: confFontSize
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        TextField{
            id: getSeralNumTextField
            width: 400
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: getSeralNumBtn.left
            anchors.rightMargin: 10
            selectByMouse: true
            placeholderText: qsTr("请点击右侧按钮获取序列号")
        }

        Button{
            id: getSeralNumBtn
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            flat: true
            hoverEnabled: true
            highlighted: hovered
            font.family: iconFamilyName
            font.pointSize: confFontSize
            text: "\ue9c7"
            ToolTip{
                x: -getSeralNumBtn.width - 45
                y: getSeralNumBtn.height / 2 - 16
                visible:  parent.hovered
                text: qsTr("获取序列号")
            }
        }
    }

    Item { // modbus 地址
        id: modbusItem
        anchors.top: serialItem.bottom
        anchors.topMargin: 20
        height: modbusNumBtn.height
        width: parent.width

        Text {
            text: qsTr("ModBus Address:")
            font.pointSize: confFontSize
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        TextField{
            id: modbusTextField
            width: 400
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: modbusNumBtn.left
            anchors.rightMargin: 10
            selectByMouse: true
            placeholderText: qsTr("请输入Modbus地址")
        }

        Button{
            id: modbusNumBtn
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            flat: true
            hoverEnabled: true
            highlighted: hovered
            font.family: iconFamilyName
            font.pointSize: confFontSize
            text: "\ue9c8"
            ToolTip{
                x: -modbusNumBtn.width - 30
                y: modbusNumBtn.height / 2 - 16
                visible:  parent.hovered
                text: qsTr("上传地址")
            }
        }
    }


    Item {// 底部控制按钮
        id: opItem
        height: manual.height
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        Button{//Manual
            id: manual
            anchors.right: parent.right
            flat: true
            hoverEnabled: true
            highlighted: hovered
            font.pointSize: confFontSize
            text: qsTr("Manual")
        }
        Button {// Auto set
            anchors.right: manual.left
            anchors.rightMargin: 15
            flat: true
            hoverEnabled: true
            highlighted: hovered
            font.pointSize: confFontSize
            text: qsTr("AutoSet")
        }
    }

}
