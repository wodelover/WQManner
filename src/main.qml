import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3
import "./SystemConf"
import "./DataChart"

ApplicationWindow {
    id: mainwindow
    visible: true
    width: 800
    height: 480

    // 由于没有显卡，暂时固定程序大小，否则程序出错
    maximumWidth: 800
    maximumHeight: 480
    minimumWidth: 800
    minimumHeight: 480

    title: qsTr("WQMannger")

    // 定义图标的大小
    property int iconSize: 20

    // icon font library
    property string iconFamilyName: iconfont.name
    FontLoader{
        id: iconfont
        source: "font/icomoon.ttf"
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        interactive: true

        // 系统配置窗口
        SystemConf{
        }

        //  系统数据显示窗口
        DataChart{
        }
//        SpeedChartShow{
//        }
    }

    header: Pane{
        width: mainwindow.width
        height: tabBar.height
        contentWidth: mainwindow.width
        contentHeight: tabBar.height
        padding: 0
        Material.elevation: 3
        TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            font.family: iconFamilyName
            font.pointSize: iconSize
            text: "\ue995"
            hoverEnabled : true
            ToolTip{
                visible:  parent.hovered
                text: qsTr("系统配置")
            }
        }
        TabButton {
            font.family: iconFamilyName
            font.pointSize: iconSize
            text: "\ue99b"
            hoverEnabled : true
            ToolTip{
                visible:  parent.hovered
                text: qsTr("数据图表")
            }
        }
    }
  }
}
