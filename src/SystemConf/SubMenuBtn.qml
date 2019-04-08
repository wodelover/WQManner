/**
   * @className: SubMenuBtn
   * @descption: 左侧子功能菜单页面
   * @author: zhangh
   * @date: 2019-04-08
*/
import QtQuick 2.10
import QtQuick.Controls 2.4

Item {
    id: subMenuBtn

    // 定义单个图标的宽度和图标字体的大小
    property int itemWidth: subMenuBtn.width
    property int iconSize: parent.width / 2

    //  定义记录当前选中的子菜单下标索引编号
    property int currentIndex: 0

    // 定义模型数据
    ListModel{
        id: viewModel
        ListElement{
            btIconCode: "\ue9b7"
            btText: qsTr("串口配置")
        }
        ListElement{
            btIconCode: "\ue956"
            btText: qsTr("终端维护")
        }
    }

    // 定义单个模型
    Component{
        id: viewDelegate
        Item {
            width: itemWidth
            height: itemWidth
            Button{
                width: itemWidth
                height: itemWidth
                hoverEnabled: true
                font.family: iconFamilyName
                font.pointSize: iconSize
                text: btIconCode
                flat: true //设置无边框显示
                highlighted: hovered //设置高亮显示
                onClicked: {
                    // 设置当前点击的下表序号
                    currentIndex = index
                    highlighted = true
                }

                ToolTip{
                    x:  parent.width + 5
                    y: 10
                    visible:  parent.hovered
                    text: qsTr(btText)
                }
            }
        }
    }

    ScrollView {
        anchors.fill: parent
        clip: true
        // 禁止显示滚动条
        ScrollBar{
            interactive: false
        }

        // 模型视图
        ListView {
            anchors.fill: parent
            model: viewModel
            delegate: viewDelegate
            highlightMoveDuration: 80 // 设置移动选中项的过渡时间
            highlightRangeMode: ListView.NoHighlightRange//设置内容自动滚动的方式
        }
    }
}
