/**
   * @className: SerialConf
   * @descption: 串口配置页面
   * @author: zhangh
   * @date: 2019-04-08
*/
import QtQuick 2.0
import QtQuick.Controls 2.4

Item {

    /*
      * 注意: 此页面被分为3个列部分，每一部分等大
    */

    // 计算每部分的大小
    property int sliceWidth: parent.width / 3

    //  设置标签字体的大小
    property int defaultFontSize: 20

    //  设置配置项字体的大小
    property int confFontSize: 15

    Text {
        id: portlabeltittle
        font.pointSize: defaultFontSize
        text: qsTr("Port Setting")
    }

    Item {// 第一列部分
        id: firstItem
        width: sliceWidth
        height: parent.height - portlabeltittle.height - 10
        y: portlabeltittle.height + 10
        Item{ // 端口号
            id: portItem
            width: sliceWidth
            height: portComBox.height
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: confFontSize
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("Port")
            }
            ComboBox {
                id: portComBox
                width: 100
                anchors.right: parent.right
                model: ["COM1", "COM2", "COM3"]
            }
        }

        Item{ // 波特率
            id: baudrateItem
            anchors.top: portItem.bottom
            anchors.topMargin: 5
            width: sliceWidth
            height: baudCombox.height
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: confFontSize
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("BaudRate")
            }
            ComboBox {
                id: baudCombox
                width: 100
                anchors.right: parent.right
                model: ["115200","38400","19200","9600","4800"]
            }
        }

        Item{ // 数据位
            id: databitItem
            anchors.top: baudrateItem.bottom
            anchors.topMargin: 5
            width: sliceWidth
            height: databitCombox.height
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: confFontSize
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("DataBit")
            }
            ComboBox {
                id: databitCombox
                width: 100
                anchors.right: parent.right
                model: ["8", "7", "6"]
            }
        }

        Item{ // 停止位
            id: stopbitItem
            anchors.top: databitItem.bottom
            anchors.topMargin: 5
            width: sliceWidth
            height: stopbitCombox.height
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: confFontSize
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("StopBit")
            }
            ComboBox {
                id: stopbitCombox
                width: 100
                anchors.right: parent.right
                model: ["1", "2", "0"]
            }
        }

        Item{ // 校验位
            id: paritybitItem
            anchors.top: stopbitItem.bottom
            anchors.topMargin: 5
            width: sliceWidth
            height: parityCombox.height
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: confFontSize
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("ParityBit")
            }
            ComboBox {
                id: parityCombox
                width: 100
                anchors.right: parent.right
                model: [qsTr("无"),qsTr( "奇校验"),qsTr( "偶检验")]
            }
        }

        Item {// 操作按钮
            id: opItem
            anchors.top: paritybitItem.bottom
            anchors.topMargin: 5
            // 定义按钮图标的大小
            property int btnSize: 20
            width: sliceWidth
            height: openComBtn.height
            Button{
                id: searchComBtn
                anchors.right: openComBtn.left
                anchors.rightMargin: 10
                font.family: iconFamilyName
                font.pointSize: 20
                text: "\ue986"
                highlighted: hovered
                flat: true
                hoverEnabled : true
                ToolTip{
                    visible:  parent.hovered
                    text: qsTr("搜索串口")
                }
            }
            Button{
                id: openComBtn
                width: 60
                anchors.right: parent.right
                font.family: iconFamilyName
                font.pointSize: 20
                text: "\uf127"  // f127  unlink    f0c1  link
                highlighted: hovered
                flat: true
                hoverEnabled : true
                ToolTip{
                    visible:  parent.hovered
                    text: qsTr("打开串口")
                }
            }
        }
    }
}


/*
   *  以下代码是第一列部分代码备份
   *  备份原因：使用Coulm布局导致程序崩溃，暂时使用锚布局
*/
/*
Item {// 第一列部分
    id: firstItem
    width: sliceWidth
    height: parent.height - portlabeltittle.height - 10
    y: portlabeltittle.height + 10
    Column{ // 列布局
        spacing: 5
        Item{ // 端口号
            id: portItem
            width: sliceWidth
            height: portComBox.height
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: confFontSize
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("Port")
            }
            ComboBox {
                id: portComBox
                width: 100
                anchors.right: parent.right
                model: ["COM1", "COM2", "COM3"]
            }
        }

        Item{ // 波特率
            id: baudrateItem
            width: sliceWidth
            height: baudCombox.height
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: confFontSize
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("BaudRate")
            }
            ComboBox {
                id: baudCombox
                width: 100
                anchors.right: parent.right
                model: ["115200","38400","19200","9600","4800"]
            }
        }

        Item{ // 数据位
            id: databitItem
            width: sliceWidth
            height: databitCombox.height
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: confFontSize
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("DataBit")
            }
            ComboBox {
                id: databitCombox
                width: 100
                anchors.right: parent.right
                model: ["8", "7", "6"]
            }
        }

        Item{ // 停止位
            id: stopbitItem
            width: sliceWidth
            height: stopbitCombox.height
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: confFontSize
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("StopBit")
            }
            ComboBox {
                id: stopbitCombox
                width: 100
                anchors.right: parent.right
                model: ["1", "2", "0"]
            }
        }

        Item{ // 校验位
            id: paritybitItem
            width: sliceWidth
            height: parityCombox.height
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: confFontSize
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("ParityBit")
            }
            ComboBox {
                id: parityCombox
                width: 100
                anchors.right: parent.right
                model: [qsTr("无"),qsTr( "奇校验"),qsTr( "偶检验")]
            }
        }

        Item {// 操作按钮
            id: opItem
            // 定义按钮图标的大小
            property int btnSize: 20
            width: sliceWidth
            height: openComBtn.height
            Button{
                id: searchComBtn
                anchors.right: openComBtn.left
                anchors.rightMargin: 10
                font.family: iconFamilyName
                font.pointSize: 20
                text: "\ue986"
                highlighted: hovered
                flat: true
                hoverEnabled : true
                ToolTip{
                    visible:  parent.hovered
                    text: qsTr("搜索串口")
                }
            }
            Button{
                id: openComBtn
                width: 60
                anchors.right: parent.right
                font.family: iconFamilyName
                font.pointSize: 20
                text: "\uf127"  // f127  unlink    f0c1  link
                highlighted: hovered
                flat: true
                hoverEnabled : true
                ToolTip{
                    visible:  parent.hovered
                    text: qsTr("打开串口")
                }
            }
        }
    }
}
*/
