/**
   * @className: DataChart
   * @descption: 此文件为数据显示页面的入口文件
   * @author: zhangh
   * @date: 2019-04-08
*/
import QtQuick 2.0
import QtCharts 2.3
import QtQuick.Controls 2.4

Item {
    property int index : 0
    id: mainchart
    ChartView{
        id: chartView
        anchors.fill: parent
        // 不显示图标
        legend.visible: false
        antialiasing: true
        // 显示外边框
        dropShadowEnabled:true
        animationOptions: ChartView.SeriesAnimations
        smooth: true

        LineSeries {
            id: lineSeries
            //                axisX: DateTimeAxis {
            //                    format: "yyyy MMM"
            //                    tickCount: 5
            //                }
            axisY: ValueAxis {
                min: 0
                tickCount: 6
                minorTickCount: 0
                max: 1
            }
            axisX:ValueAxis {
                min: 0
                max: index + 10
            }

            Timer{
                interval: 1000
                running: mainchart.visible
                repeat: true
                onTriggered: {
                    lineSeries.append(index,Math.random(1))
                    index=index+1
                    if(index>40){
                        chartView.scrollRight(10)
                    }
                }
            }
        }
    }
}
