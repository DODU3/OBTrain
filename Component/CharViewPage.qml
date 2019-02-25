import QtQuick 2.0
import QtCharts 2.0

Item {
    width: 320
    height: 320

    ChartView{
                title: "Spline"
                anchors.fill: parent
                antialiasing: true

                SplineSeries {
                    name: "SplineSeries"
                    XYPoint { x: 0; y: 0.0 }
                    XYPoint { x: 1.1; y: -3.2 }
                    XYPoint { x: 1.9; y: -2.4 }
                    XYPoint { x: 2.1; y: -2.1 }
                    XYPoint { x: 2.9; y: 2.6 }
                    XYPoint { x: 3.4; y: 2.3 }
                    XYPoint { x: 4.1; y: 3.1 }
                }
    }

//    ChartView {
//        id: spline
//        x: 26
//        y: 25
//        width: 269
//        height: 210
//        SplineSeries {
//            name: "SplineSeries"
//            XYPoint {
//                x: 0
//                y: 1
//            }

//            XYPoint {
//                x: 3
//                y: 4.3
//            }

//            XYPoint {
//                x: 5
//                y: 3.1
//            }

//            XYPoint {
//                x: 8
//                y: 5.8
//            }
//        }
//    }

//    ChartView {
//        title: "Spline"
//        anchors.fill: parent
//        antialiasing: true

//        SplineSeries {
//            name: "SplineSeries"
//            XYPoint { x: 0; y: 0.0 }
//            XYPoint { x: 1.1; y: 3.2 }
//            XYPoint { x: 1.9; y: 2.4 }
//            XYPoint { x: 2.1; y: 2.1 }
//            XYPoint { x: 2.9; y: 2.6 }
//            XYPoint { x: 3.4; y: 2.3 }
//            XYPoint { x: 4.1; y: 3.1 }
//        }
//    }
}
