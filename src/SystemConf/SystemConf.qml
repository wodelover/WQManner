/**
   * @className: SystemConf
   * @descption: 系统配置页面入口文件
   * @author: zhangh
   * @date: 2019-04-08
*/
import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {
    // 定义子列表功能框的宽度
    property int subMenuWidth: 50
    // 定义左侧子菜单列表的宽度
    property int subDurationHeight: 15

    SwipeView{
        id: subMenuSwapView

        x: submenuPane.width + 5
        width: parent.width - submenuPane.width - 10
        height:  parent.height
        clip: true
        // 设置垂直方向上滚动
        orientation: Qt.Vertical
        // 串口配置工具页面
        SerialConf{
        }
        // 硬件系统设置页面
        DevRepair{
        }
    }

    Pane{
       id: submenuPane
       y: subDurationHeight
       width: subMenuWidth
       height: parent.height - subDurationHeight * 2
       contentWidth: subMenuWidth
       contentHeight: parent.height - subDurationHeight * 2
       padding: 0
       Material.elevation: 3
       // 实例化左侧子菜单按钮所有控件
        SubMenuBtn{
            anchors.fill: parent
            onCurrentIndexChanged: {
                subMenuSwapView.currentIndex = currentIndex
            }
        }
   }
}
