﻿import QtQuick 2.9
import QtQuick.Controls 2.2

import RegisterSystemOpen 1.0

ApplicationWindow {
    id: magInfoPage
    x: 0
    y: 0
    width: 600
    height: 100
    maximumHeight:100
    minimumHeight:100
    maximumWidth:600
    minimumWidth:600

    title: "磁力计-教学资料"

    background: Image {
        source: "../../../images/background.png"
    }

    Button {
        id: button_openppt
        x: 56
        y: 30
        text: qsTr("教学PPT")
        font.bold: true
        font.pointSize: 20

        onPressed:
        {
            mySystemOpenReg.openFile("/Content_resource/磁力计模组/教学资料/教学PPT/磁力计模组PPT.ppt");
        }

    }


    MySystemOpen
    {
        id:mySystemOpenReg
    }

    Button {
        id: button_openvideo
        x: 225
        y: 30
        text: qsTr("教学视频")
        font.bold: true
        font.pointSize: 20

            onPressed: {
                mySystemOpenReg.openFile("/Content_resource/磁力计模组/教学资料/教学视频");
            }
    }

        Button {
            id: button_openotherfile
            x: 405
            y: 30
            text: qsTr("其他资料")
            font.bold: true
            font.pointSize: 20

                onPressed: {
                    mySystemOpenReg.openFile("/Content_resource/磁力计模组/教学资料/其他资料");
                }
        }

}
