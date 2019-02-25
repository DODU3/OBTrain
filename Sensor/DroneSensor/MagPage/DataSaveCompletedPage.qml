import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    id: datasavecompletedpage

    title: "保存成功"

    width: 800
    height: 200

    background: Image {
        source: "../../../images/background.png"
    }

    Label {
        id:label
        x: 345
        y: -4
        width: 110
        height: 62
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

        font.pixelSize: 20
        text: qsTr("文件保存为：");

    }

    Button {
        id: button
        x: 355
        y: 132
        text: qsTr("确定")
        onPressed: {
            datasavecompletedpage.visible = false;
        }
    }

    Label {
        id: label1
        x: 12
        y: 44
        width: 776
        height: 82
        text: mydataFresh.saveFileName
        wrapMode: "WordWrap"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 20
    }
}
