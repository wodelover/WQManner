/**
   * @className: DataChart
   * @descption: 此文件为数据显示页面的入口文件
   * @author: zhangh
   * @date: 2019-04-08
*/
import QtQuick 2.0
import QtCharts 2.3

Item {


    ChartView{
        id: chartView
        anchors.fill: parent
        // 不显示图标
        legend.visible: false
        antialiasing: true
        // 显示外边框
        dropShadowEnabled:true

        animationOptions: ChartView.AllAnimations

        LineSeries {
            id: lineSeries
            useOpenGL: true
            XYPoint { x: 0  ; y: 0.0 }
            XYPoint { x: 1.1; y: 3.8 }
            XYPoint { x: 1.9; y: 2.4 }
            XYPoint { x: 2.1; y: 2.1 }
            XYPoint { x: 2.9; y: 2.6 }
            XYPoint { x: 3.4; y: 2.3 }
            XYPoint { x: 4.1; y: 3.1 }
            Component.onCompleted: {
                lineSeries.append(3.1,2.8)
                lineSeries.append(2.1,2.6)
                lineSeries.append(1.1,2.2)
                chartView.update()
            }
        }
        DateTimeAxis{
            id: xAxis
        }

//        Timer{
//            interval: 1000
//            running: true
//            repeat: true
//            property double a : 5.1
//            onTriggered: {
//                lineSeries.append(a++,3)
//                console.log(a)
//            }
//        }

    }

}
