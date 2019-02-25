import QtQuick 2.0
import QtCharts 2.0
import QtQuick.Controls 2.2

Item {
    width: 600
    height: 800

    property int globalForJs: 0;



    ChartView{
        title: "Spline"
        width: 600
        height: 420
        antialiasing: true

        ValueAxis {
            id: axisX
            min: 0
            max: 1000
            tickCount: 1
        }

        ValueAxis {
            id: axisy
            min: 0
            max: 1000
            tickCount: 1
        }

        SplineSeries {
            id:cornerLine
            axisX: axisX
            axisY: axisy
            name: "Corner"
        }
        SplineSeries {
            id:xLine
            axisX: axisX
            axisY: axisy
            name: "X"

        }
        SplineSeries {
            id:yLine
            axisX: axisX
            axisY: axisy
            name: "Y"

        }
        SplineSeries {
            id:zLine
            axisX: axisX
            axisY: axisy
            name: "Z"

        }
        SplineSeries {
            id:user1Line
            axisX: axisX
            axisY: axisy
            name: "User1"

        }
        SplineSeries {
            id:user2Line
            axisX: axisX
            axisY: axisy
            name: "User2"

        }
        SplineSeries {
            id:user3Line
            axisX: axisX
            axisY: axisy
            name: "User3"

        }
        SplineSeries {
            id:user4Line
            axisX: axisX
            axisY: axisy
            name: "User4"

        }
        SplineSeries {
            id:user5Line
            axisX: axisX
            axisY: axisy
            name: "User5"

        }
        SplineSeries {
            id:user6Line
            axisX: axisX
            axisY: axisy
            name: "User6"

        }

        Timer {
            //Timer for demo rotation of compass

            interval: 200
            running: true
            repeat: true

            onTriggered: {
                cornerLine.append(globalForJs,myclassExposeByRegType.getMagCorner());
                xLine.append(globalForJs,myclassExposeByRegType.getMagX());
                yLine.append(globalForJs,myclassExposeByRegType.getMagY());
                zLine.append(globalForJs,myclassExposeByRegType.getMagZ());
                user1Line.append(globalForJs,myclassExposeByRegType.getMagUser1());
                user2Line.append(globalForJs,myclassExposeByRegType.getMagUser2());
                user3Line.append(globalForJs,myclassExposeByRegType.getMagUser3());
                user4Line.append(globalForJs,myclassExposeByRegType.getMagUser4());
                user5Line.append(globalForJs,myclassExposeByRegType.getMagUser5());
                user6Line.append(globalForJs,myclassExposeByRegType.getMagUser6());

                if(globalForJs > axisX.max){
                    axisX.min+=200;
                    axisX.max+=200;
                }else{
                    globalForJs +=200;; //This else is just to stop incrementing the variable unnecessarily
                }
            }
        }
    }

    CheckBox {
        id: checkBox
        x: 15
        y: 443
        text: qsTr("实时角度")
        checkState: Qt.Checked
    }

    CheckBox {
        id: checkBox1
        x: 171
        y: 443
        text: qsTr("X 轴")
        checkState: Qt.Checked
    }

    CheckBox {
        id: checkBox2
        x: 326
        y: 443
        text: qsTr("Y 轴")
        checkState: Qt.Checked
    }

    CheckBox {
        id: checkBox3
        x: 481
        y: 443
        text: qsTr("Z 轴")
        checkState: Qt.Checked
    }

    CheckBox {
        id: checkBox4
        x: 88
        y: 509
        text: qsTr("用户1")
        checkState: Qt.Checked
    }

    CheckBox {
        id: checkBox5
        x: 250
        y: 509
        text: qsTr("用户2")
        checkState: Qt.Checked
    }

    CheckBox {
        id: checkBox6
        x: 411
        y: 509
        text: qsTr("用户3")
        checkState: Qt.Checked
    }

    CheckBox {
        id: checkBox7
        x: 88
        y: 571
        text: qsTr("用户4")
        checkState: Qt.Checked
    }

    CheckBox {
        id: checkBox8
        x: 250
        y: 571
        text: qsTr("用户5")
        checkState: Qt.Checked
    }

    CheckBox {
        id: checkBox9
        x: 411
        y: 571
        text: qsTr("用户6")
        checkState: Qt.Checked
    }
}
