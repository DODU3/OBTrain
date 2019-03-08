import QtQuick 2.0
import QtCharts 2.0
import QtQuick.Controls 2.2

Item {
    width: 700
    height: 800

    property int globalForJs: 1;
    property int flag_chartupdata: 0;
    property int value_Max_axisy: 20;
    property int value_Min_axisy: -20;
    property int temp_data: 0;
    property int tem2p_data: 0;
    property int tem3p_data: 0;

    property int temp_data_max: 0;
    property int temp_data_min: 0;

    property int temp2_data_max: 0;
    property int temp2_data_min: 0;

    ChartView{
        id: chart
        x: 0
        y: 163
        title: "实时数据"
        width: 700
        height: 434
        antialiasing: true


        Label {
            id: label_altitude
            x: 8
            y: -139
            width: 156
            height: 36
            font.pixelSize: 28
            text: qsTr("高度：0 cm")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.family: "Times New Roman"
        }

        Label {
            id: label_pitch
            x: 3
            y: -85
            width: 167
            height: 40
            font.pixelSize: 28
            text: qsTr("俯仰角：0°")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.family: "Times New Roman"
        }

        Label {
            id: label_roll
            x: 212
            y: -85
            width: 173
            height: 45
            font.pixelSize: 28
            text: qsTr("翻滚角：0°")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.family: "Times New Roman"
        }

        Label {
            id: label_yaw
            x: 446
            y: -85
            width: 152
            height: 42
            font.pixelSize: 28
            text: qsTr("偏航角：0°")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.family: "Times New Roman"
        }

        ValueAxis {
            id: axisX
            min: 0
            max: 100
            tickCount: 1
        }

        ValueAxis {
            id: axisy
            min: value_Min_axisy
            max: value_Max_axisy
            tickCount: 1
        }

        LineSeries {
            id:altitude
            axisX: axisX
            axisY: axisy
            name: "altitude"
            color: "red"
            onClicked: {
                var p = chart.mapToPosition(point);
                var text = qsTr("x: %1, y: %2").arg(Math.round(point.x)).arg(Math.round(point.y));
                id_tooltip.x = p.x;
                id_tooltip.y = p.y - id_tooltip.height;
                id_tooltip.text = text;
                id_tooltip.visible = true;

            }
        }
        LineSeries {
            id:pitch
            axisX: axisX
            axisY: axisy
            name: "Pitch"
            color: "blue"
            onClicked: {
                var p = chart.mapToPosition(point);
                var text = qsTr("x: %1, y: %2").arg(Math.round(point.x)).arg(Math.round(point.y));
                id_tooltip.x = p.x;
                id_tooltip.y = p.y - id_tooltip.height;
                id_tooltip.text = text;
                id_tooltip.visible = true;

            }
        }
        LineSeries {
            id:roll
            axisX: axisX
            axisY: axisy
            name: "Roll"
            color: "brown"
            onClicked: {
                var p = chart.mapToPosition(point);
                var text = qsTr("x: %1, y: %2").arg(Math.round(point.x)).arg(Math.round(point.y));
                id_tooltip.x = p.x;
                id_tooltip.y = p.y - id_tooltip.height;
                id_tooltip.text = text;
                id_tooltip.visible = true;

            }
        }
        LineSeries {
            id:yaw
            axisX: axisX
            axisY: axisy
            name: "Yaw"
            color: "green"
            onClicked: {
                var p = chart.mapToPosition(point);
                var text = qsTr("x: %1, y: %2").arg(Math.round(point.x)).arg(Math.round(point.y));
                id_tooltip.x = p.x;
                id_tooltip.y = p.y - id_tooltip.height;
                id_tooltip.text = text;
                id_tooltip.visible = true;

            }
        }


//        LineSeries {
//            id:user1Line
//            axisX: axisX
//            axisY: axisy
//            name: "User1"
//            color: "purple"
//            onClicked: {
//                var p = chart.mapToPosition(point);
//                var text = qsTr("x: %1, y: %2").arg(Math.round(point.x)).arg(Math.round(point.y));
//                id_tooltip.x = p.x;
//                id_tooltip.y = p.y - id_tooltip.height;
//                id_tooltip.text = text;
//                id_tooltip.visible = true;

//            }
//        }
//        LineSeries {
//            id:user2Line
//            axisX: axisX
//            axisY: axisy
//            name: "User2"
//            color: "yellow"
//            onClicked: {
//                var p = chart.mapToPosition(point);
//                var text = qsTr("x: %1, y: %2").arg(Math.round(point.x)).arg(Math.round(point.y));
//                id_tooltip.x = p.x;
//                id_tooltip.y = p.y - id_tooltip.height;
//                id_tooltip.text = text;
//                id_tooltip.visible = true;

//            }
//        }
//        LineSeries {
//            id:user3Line
//            axisX: axisX
//            axisY: axisy
//            name: "User3"
//            color: "pink"
//            onClicked: {
//                var p = chart.mapToPosition(point);
//                var text = qsTr("x: %1, y: %2").arg(Math.round(point.x)).arg(Math.round(point.y));
//                id_tooltip.x = p.x;
//                id_tooltip.y = p.y - id_tooltip.height;
//                id_tooltip.text = text;
//                id_tooltip.visible = true;

//            }
//        }
//        LineSeries {
//            id:user4Line
//            axisX: axisX
//            axisY: axisy
//            name: "User4"
//            color: "orange"
//            onClicked: {
//                var p = chart.mapToPosition(point);
//                var text = qsTr("x: %1, y: %2").arg(Math.round(point.x)).arg(Math.round(point.y));
//                id_tooltip.x = p.x;
//                id_tooltip.y = p.y - id_tooltip.height;
//                id_tooltip.text = text;
//                id_tooltip.visible = true;

//            }
//        }
//        LineSeries {
//            id:user5Line
//            axisX: axisX
//            axisY: axisy
//            name: "User5"
//            color: "grey"
//            onClicked: {
//                var p = chart.mapToPosition(point);
//                var text = qsTr("x: %1, y: %2").arg(Math.round(point.x)).arg(Math.round(point.y));
//                id_tooltip.x = p.x;
//                id_tooltip.y = p.y - id_tooltip.height;
//                id_tooltip.text = text;
//                id_tooltip.visible = true;

//            }
//        }
//        LineSeries {
//            id:user6Line
//            axisX: axisX
//            axisY: axisy
//            name: "User6"
//            color: "black"
//            onClicked: {
//                var p = chart.mapToPosition(point);
//                var text = qsTr("x: %1, y: %2").arg(Math.round(point.x)).arg(Math.round(point.y));
//                id_tooltip.x = p.x;
//                id_tooltip.y = p.y - id_tooltip.height;
//                id_tooltip.text = text;
//                id_tooltip.visible = true;

//            }
//        }

            //同步飞机和试验台动作
//        CheckBox {
//            id: checkBox_labupdate
//            x: 19
//            y: -39
//            text: qsTr("同步无人机与试验台")
//            font.bold: true
//            font.pointSize: 20
//            checkState: Qt.Unchecked

//            nextCheckState: function() {
//                if (checkState == Qt.Checked){
//                    return Qt.Unchecked
//                }
//                else{

//                    return Qt.Checked
//                }
//            }
//        }


        Timer {
            //Timer for demo rotation of compass

            interval: 100
            running: true
            repeat: true

            onTriggered: {
                if(true === myclassExposeByRegType.getserialDrawClearFlagDrone()){
                    altitude.clear();
                    pitch.clear();
                    roll.clear();
                    yaw.clear();
//                    user1Line.clear();
//                    user2Line.clear();
//                    user3Line.clear();
//                    user4Line.clear();
//                    user5Line.clear();
//                    user6Line.clear();
                    globalForJs = 1;
                    axisX.min = 0;
                    axisX.max = 100;
                    myclassExposeByRegType.setserialDrawClearFlagDrone(false);
                    label_altitude.text= "高度：0 cm";
                    label_pitch.text= "俯仰角：0°";
                    label_roll.text= "翻滚角：0°";
                    label_yaw.text= "偏航角：0°";
                }



//                console.log("angleLine: " + myclassExposeByRegType.getQpointFY(angleLine.at(globalForJs-1))+"   "+globalForJs);
                if(true === myclassExposeByRegType.getserialOpenFlag())
                {

//                    //同步飞机和试验台动作
//                    if(checkBox_labupdate.checkState == Qt.Checked)
//                    {
//                        temp_data=myclassExposeByRegType.getAnglePitchNum();
//                        tem2p_data=myclassExposeByRegType.getAngleYawNum();
//                        myclassExposeByRegType.setMagCorner(temp_data,tem2p_data);
//                    }



                    flag_chartupdata=0;
                    if(axisX.min > 1){
                        altitude.pointRemoved(axisX.min-1);
                        pitch.pointRemoved(axisX.min-1);
                        roll.pointRemoved(axisX.min-1);
                        yaw.pointRemoved(axisX.min-1);
//                        user1Line.pointRemoved(axisX.min-1);
//                        user2Line.pointRemoved(axisX.min-1);
//                        user3Line.pointRemoved(axisX.min-1);
//                        user4Line.pointRemoved(axisX.min-1);
//                        user5Line.pointRemoved(axisX.min-1);
//                        user6Line.pointRemoved(axisX.min-1);
                    }
                    temp_data=myclassExposeByRegType.getAltitude();
                    label_altitude.text="高度："+temp_data+" cm";
                    altitude.append(globalForJs,temp_data);
                    if(checkBox_altitude.checkState == Qt.Checked)
                    {
                        altitude.visible=true;
                        //获取当前曲线显示区域的最大值最小值
                        for(tem2p_data=axisX.min;tem2p_data<axisX.max;tem2p_data++)
                        {
                            tem3p_data=myclassExposeByRegType.getQpointFY(altitude.at(tem2p_data));
                            if(tem2p_data==axisX.min)
                            {
                                temp_data_max=tem3p_data;
                                temp_data_min=tem3p_data;
                            }
                            else
                            {
                                if(tem3p_data>temp_data_max)
                                {
                                    temp_data_max=tem3p_data;
                                }
                                if(tem3p_data<temp_data_min)
                                {
                                    temp_data_min=tem3p_data;
                                }
                            }
                        }

                        //获取多条曲线的最大值最小值
                        if(0==flag_chartupdata)
                        {
                            temp2_data_max=temp_data_max;
                            temp2_data_min=temp_data_min;
                            flag_chartupdata=1;
                        }
                        else
                        {
                            if(temp_data_max>temp2_data_max)
                            {
                                temp2_data_max=temp_data_max;
                            }
                            if(temp_data_min<temp2_data_min)
                            {
                                temp2_data_min=temp_data_min;
                            }
                        }
                    }
                    else
                    {
                        altitude.visible=false;
                    }

                    temp_data=myclassExposeByRegType.getAnglePitchNum();
                    label_pitch.text= "俯仰角："+temp_data+"°";
                    pitch.append(globalForJs,temp_data);
                    if(checkBox_pitch.checkState == Qt.Checked)
                    {
                        pitch.visible=true;
                        //获取当前曲线显示区域的最大值最小值
                        for(tem2p_data=axisX.min;tem2p_data<axisX.max;tem2p_data++)
                        {
                            tem3p_data=myclassExposeByRegType.getQpointFY(pitch.at(tem2p_data));
                            if(tem2p_data==axisX.min)
                            {
                                temp_data_max=tem3p_data;
                                temp_data_min=tem3p_data;
                            }
                            else
                            {
                                if(tem3p_data>temp_data_max)
                                {
                                    temp_data_max=tem3p_data;
                                }
                                if(tem3p_data<temp_data_min)
                                {
                                    temp_data_min=tem3p_data;
                                }

                            }

                        }

                        //获取多条曲线的最大值最小值
                        if(0==flag_chartupdata)
                        {
                            temp2_data_max=temp_data_max;
                            temp2_data_min=temp_data_min;
                            flag_chartupdata=1;
                        }
                        else
                        {
                            if(temp_data_max>temp2_data_max)
                            {
                                temp2_data_max=temp_data_max;
                            }
                            if(temp_data_min<temp2_data_min)
                            {
                                temp2_data_min=temp_data_min;
                            }
                        }
                    }
                    else
                    {
                        pitch.visible=false;
                    }

                    temp_data=myclassExposeByRegType.getAngleRollNum();
                    label_roll.text= "翻滚角："+temp_data+"°";
                    roll.append(globalForJs,temp_data);
                    if(checkBox_roll.checkState == Qt.Checked)
                    {
                        roll.visible=true;
                        //获取当前曲线显示区域的最大值最小值
                        for(tem2p_data=axisX.min;tem2p_data<axisX.max;tem2p_data++)
                        {
                            tem3p_data=myclassExposeByRegType.getQpointFY(roll.at(tem2p_data));
                            if(tem2p_data==axisX.min)
                            {
                                temp_data_max=tem3p_data;
                                temp_data_min=tem3p_data;
                            }
                            else
                            {
                                if(tem3p_data>temp_data_max)
                                {
                                    temp_data_max=tem3p_data;
                                }
                                if(tem3p_data<temp_data_min)
                                {
                                    temp_data_min=tem3p_data;
                                }
                            }
                        }

                        //获取多条曲线的最大值最小值
                        if(0==flag_chartupdata)
                        {
                            temp2_data_max=temp_data_max;
                            temp2_data_min=temp_data_min;
                            flag_chartupdata=1;
                        }
                        else
                        {
                            if(temp_data_max>temp2_data_max)
                            {
                                temp2_data_max=temp_data_max;
                            }
                            if(temp_data_min<temp2_data_min)
                            {
                                temp2_data_min=temp_data_min;
                            }
                        }
                    }
                    else
                    {
                        roll.visible=false;
                    }

                    temp_data=myclassExposeByRegType.getAngleYawNum();
                    if(temp_data<0)
                    {
                        temp_data+=360;
                    }
                    label_yaw.text= "偏航角："+temp_data+"°";
                    yaw.append(globalForJs,temp_data);
                    if(checkBox_yaw.checkState == Qt.Checked)
                    {
                        yaw.visible=true;
                        //获取当前曲线显示区域的最大值最小值
                        for(tem2p_data=axisX.min;tem2p_data<axisX.max;tem2p_data++)
                        {
                            tem3p_data=myclassExposeByRegType.getQpointFY(yaw.at(tem2p_data));
                            if(tem2p_data==axisX.min)
                            {
                                temp_data_max=tem3p_data;
                                temp_data_min=tem3p_data;
                            }
                            else
                            {
                                if(tem3p_data>temp_data_max)
                                {
                                    temp_data_max=tem3p_data;
                                }
                                if(tem3p_data<temp_data_min)
                                {
                                    temp_data_min=tem3p_data;
                                }

                            }

                        }

                        //获取多条曲线的最大值最小值
                        if(0==flag_chartupdata)
                        {
                            temp2_data_max=temp_data_max;
                            temp2_data_min=temp_data_min;
                            flag_chartupdata=1;
                        }
                        else
                        {
                            if(temp_data_max>temp2_data_max)
                            {
                                temp2_data_max=temp_data_max;
                            }
                            if(temp_data_min<temp2_data_min)
                            {
                                temp2_data_min=temp_data_min;
                            }
                        }
                    }
                    else
                    {
                        yaw.visible=false;
                    }

//                    temp_data=myclassExposeByRegType.getMagUser1();
//                    user1Line.append(globalForJs,temp_data);
//                    if(checkBox_user1.checkState == Qt.Checked)
//                    {
//                        user1Line.visible=true;
//                        //获取当前曲线显示区域的最大值最小值
//                        for(tem2p_data=axisX.min;tem2p_data<axisX.max;tem2p_data++)
//                        {
//                            tem3p_data=myclassExposeByRegType.getQpointFY(user1Line.at(tem2p_data));
//                            if(tem2p_data==axisX.min)
//                            {
//                                temp_data_max=tem3p_data;
//                                temp_data_min=tem3p_data;
//                            }
//                            else
//                            {
//                                if(tem3p_data>temp_data_max)
//                                {
//                                    temp_data_max=tem3p_data;
//                                }
//                                if(tem3p_data<temp_data_min)
//                                {
//                                    temp_data_min=tem3p_data;
//                                }

//                            }

//                        }

//                        //获取多条曲线的最大值最小值
//                        if(0==flag_chartupdata)
//                        {
//                            temp2_data_max=temp_data_max;
//                            temp2_data_min=temp_data_min;
//                            flag_chartupdata=1;
//                        }
//                        else
//                        {
//                            if(temp_data_max>temp2_data_max)
//                            {
//                                temp2_data_max=temp_data_max;
//                            }
//                            if(temp_data_min<temp2_data_min)
//                            {
//                                temp2_data_min=temp_data_min;
//                            }
//                        }
//                    }
//                    else
//                    {
//                        user1Line.visible=false;
//                    }


//                    temp_data=myclassExposeByRegType.getMagUser2();
//                    user2Line.append(globalForJs,temp_data);
//                    if(checkBox_user2.checkState == Qt.Checked)
//                    {
//                        user2Line.visible=true;
//                        //获取当前曲线显示区域的最大值最小值
//                        for(tem2p_data=axisX.min;tem2p_data<axisX.max;tem2p_data++)
//                        {
//                            tem3p_data=myclassExposeByRegType.getQpointFY(user2Line.at(tem2p_data));
//                            if(tem2p_data==axisX.min)
//                            {
//                                temp_data_max=tem3p_data;
//                                temp_data_min=tem3p_data;
//                            }
//                            else
//                            {
//                                if(tem3p_data>temp_data_max)
//                                {
//                                    temp_data_max=tem3p_data;
//                                }
//                                if(tem3p_data<temp_data_min)
//                                {
//                                    temp_data_min=tem3p_data;
//                                }

//                            }

//                        }

//                        //获取多条曲线的最大值最小值
//                        if(0==flag_chartupdata)
//                        {
//                            temp2_data_max=temp_data_max;
//                            temp2_data_min=temp_data_min;
//                            flag_chartupdata=1;
//                        }
//                        else
//                        {
//                            if(temp_data_max>temp2_data_max)
//                            {
//                                temp2_data_max=temp_data_max;
//                            }
//                            if(temp_data_min<temp2_data_min)
//                            {
//                                temp2_data_min=temp_data_min;
//                            }
//                        }
//                    }
//                    else
//                    {
//                        user2Line.visible=false;
//                    }

//                    temp_data=myclassExposeByRegType.getMagUser3();
//                    user3Line.append(globalForJs,temp_data);
//                    if(checkBox_user3.checkState == Qt.Checked)
//                    {
//                        user3Line.visible=true;
//                        //获取当前曲线显示区域的最大值最小值
//                        for(tem2p_data=axisX.min;tem2p_data<axisX.max;tem2p_data++)
//                        {
//                            tem3p_data=myclassExposeByRegType.getQpointFY(user3Line.at(tem2p_data));
//                            if(tem2p_data==axisX.min)
//                            {
//                                temp_data_max=tem3p_data;
//                                temp_data_min=tem3p_data;
//                            }
//                            else
//                            {
//                                if(tem3p_data>temp_data_max)
//                                {
//                                    temp_data_max=tem3p_data;
//                                }
//                                if(tem3p_data<temp_data_min)
//                                {
//                                    temp_data_min=tem3p_data;
//                                }

//                            }

//                        }

//                        //获取多条曲线的最大值最小值
//                        if(0==flag_chartupdata)
//                        {
//                            temp2_data_max=temp_data_max;
//                            temp2_data_min=temp_data_min;
//                            flag_chartupdata=1;
//                        }
//                        else
//                        {
//                            if(temp_data_max>temp2_data_max)
//                            {
//                                temp2_data_max=temp_data_max;
//                            }
//                            if(temp_data_min<temp2_data_min)
//                            {
//                                temp2_data_min=temp_data_min;
//                            }
//                        }
//                    }
//                    else
//                    {
//                        user3Line.visible=false;
//                    }

//                    temp_data=myclassExposeByRegType.getMagUser4();
//                    user4Line.append(globalForJs,temp_data);
//                    if(checkBox_user4.checkState == Qt.Checked)
//                    {
//                        user4Line.visible=true;
//                        //获取当前曲线显示区域的最大值最小值
//                        for(tem2p_data=axisX.min;tem2p_data<axisX.max;tem2p_data++)
//                        {
//                            tem3p_data=myclassExposeByRegType.getQpointFY(user4Line.at(tem2p_data));
//                            if(tem2p_data==axisX.min)
//                            {
//                                temp_data_max=tem3p_data;
//                                temp_data_min=tem3p_data;
//                            }
//                            else
//                            {
//                                if(tem3p_data>temp_data_max)
//                                {
//                                    temp_data_max=tem3p_data;
//                                }
//                                if(tem3p_data<temp_data_min)
//                                {
//                                    temp_data_min=tem3p_data;
//                                }

//                            }

//                        }

//                        //获取多条曲线的最大值最小值
//                        if(0==flag_chartupdata)
//                        {
//                            temp2_data_max=temp_data_max;
//                            temp2_data_min=temp_data_min;
//                            flag_chartupdata=1;
//                        }
//                        else
//                        {
//                            if(temp_data_max>temp2_data_max)
//                            {
//                                temp2_data_max=temp_data_max;
//                            }
//                            if(temp_data_min<temp2_data_min)
//                            {
//                                temp2_data_min=temp_data_min;
//                            }
//                        }
//                    }
//                    else
//                    {
//                        user4Line.visible=false;
//                    }

//                    temp_data=myclassExposeByRegType.getMagUser5();
//                    user5Line.append(globalForJs,temp_data);
//                    if(checkBox_user5.checkState == Qt.Checked)
//                    {
//                        user5Line.visible=true;
//                        //获取当前曲线显示区域的最大值最小值
//                        for(tem2p_data=axisX.min;tem2p_data<axisX.max;tem2p_data++)
//                        {
//                            tem3p_data=myclassExposeByRegType.getQpointFY(user5Line.at(tem2p_data));
//                            if(tem2p_data==axisX.min)
//                            {
//                                temp_data_max=tem3p_data;
//                                temp_data_min=tem3p_data;
//                            }
//                            else
//                            {
//                                if(tem3p_data>temp_data_max)
//                                {
//                                    temp_data_max=tem3p_data;
//                                }
//                                if(tem3p_data<temp_data_min)
//                                {
//                                    temp_data_min=tem3p_data;
//                                }

//                            }

//                        }

//                        //获取多条曲线的最大值最小值
//                        if(0==flag_chartupdata)
//                        {
//                            temp2_data_max=temp_data_max;
//                            temp2_data_min=temp_data_min;
//                            flag_chartupdata=1;
//                        }
//                        else
//                        {
//                            if(temp_data_max>temp2_data_max)
//                            {
//                                temp2_data_max=temp_data_max;
//                            }
//                            if(temp_data_min<temp2_data_min)
//                            {
//                                temp2_data_min=temp_data_min;
//                            }
//                        }
//                    }
//                    else
//                    {
//                        user5Line.visible=false;
//                    }

//                    temp_data=myclassExposeByRegType.getMagUser6();
//                    user6Line.append(globalForJs,temp_data);
//                    if(checkBox_user6.checkState == Qt.Checked)
//                    {
//                        user6Line.visible=true;
//                        //获取当前曲线显示区域的最大值最小值
//                        for(tem2p_data=axisX.min;tem2p_data<axisX.max;tem2p_data++)
//                        {
//                            tem3p_data=myclassExposeByRegType.getQpointFY(user6Line.at(tem2p_data));
//                            if(tem2p_data==axisX.min)
//                            {
//                                temp_data_max=tem3p_data;
//                                temp_data_min=tem3p_data;
//                            }
//                            else
//                            {
//                                if(tem3p_data>temp_data_max)
//                                {
//                                    temp_data_max=tem3p_data;
//                                }
//                                if(tem3p_data<temp_data_min)
//                                {
//                                    temp_data_min=tem3p_data;
//                                }

//                            }

//                        }

//                        //获取多条曲线的最大值最小值
//                        if(0==flag_chartupdata)
//                        {
//                            temp2_data_max=temp_data_max;
//                            temp2_data_min=temp_data_min;
//                            flag_chartupdata=1;
//                        }
//                        else
//                        {
//                            if(temp_data_max>temp2_data_max)
//                            {
//                                temp2_data_max=temp_data_max;
//                            }
//                            if(temp_data_min<temp2_data_min)
//                            {
//                                temp2_data_min=temp_data_min;
//                            }
//                        }
//                    }
//                    else
//                    {
//                        user6Line.visible=false;
//                    }


                    if(flag_chartupdata)
                    {
                        globalForJs +=1; //This else is just to stop incrementing the variable unnecessarily

                        if(globalForJs > axisX.max){
                            axisX.min+=1;
                            axisX.max+=1;
                        }
                    }
                }

                value_Max_axisy=temp2_data_max+100;
                value_Min_axisy=temp2_data_min-100;
            }
        }
    }

    CheckBox {
        id: checkBox_altitude
        x: 15
        y: 609
        text: qsTr("实时高度")
        font.bold: true
        font.pointSize: 20
        checkState: Qt.Checked

        nextCheckState: function() {
            if (checkState == Qt.Checked){
                return Qt.Unchecked
            }
            else{
                return Qt.Checked
            }
        }
    }

    CheckBox {
        id: checkBox_pitch
        x: 198
        y: 609
        text: qsTr("俯仰角度")
        font.bold: true
        font.pointSize: 20
        checkState: Qt.Checked

        nextCheckState: function() {
            if (checkState == Qt.Checked){
                return Qt.Unchecked
            }
            else{
                return Qt.Checked
            }
        }
    }

    CheckBox {
        id: checkBox_roll
        x: 381
        y: 609
        text: qsTr("翻滚角度")
        font.bold: true
        font.pointSize: 20
        checkState: Qt.Checked

        nextCheckState: function() {
            if (checkState == Qt.Checked){
                return Qt.Unchecked
            }
            else{
                return Qt.Checked
            }
        }
    }

    CheckBox {
        id: checkBox_yaw
        x: 541
        y: 609
        text: qsTr("偏航角度")
        font.bold: true
        font.pointSize: 20
        checkState: Qt.Checked

        nextCheckState: function() {
            if (checkState == Qt.Checked){
                return Qt.Unchecked
            }
            else{
                return Qt.Checked
            }
        }
    }

    CheckBox {
        id: checkBox_user1
        x: 15
        y: 663
        text: qsTr("用户数据1")
        font.bold: true
        font.pointSize: 20
        checkState: Qt.Unchecked

        nextCheckState: function() {
            if (checkState == Qt.Checked){
                return Qt.Unchecked
            }
            else{
                return Qt.Checked
            }
        }
    }

    CheckBox {
        id: checkBox_user2
        x: 198
        y: 663
        text: qsTr("用户数据2")
        font.bold: true
        font.pointSize: 20
        checkState: Qt.Unchecked

        nextCheckState: function() {
            if (checkState == Qt.Checked){
                return Qt.Unchecked
            }
            else{
                return Qt.Checked
            }
        }
    }

    CheckBox {
        id: checkBox_user3
        x: 381
        y: 663
        text: qsTr("用户数据3")
        font.bold: true
        font.pointSize: 20
        checkState: Qt.Unchecked

        nextCheckState: function() {
            if (checkState == Qt.Checked){
                return Qt.Unchecked
            }
            else{
                return Qt.Checked
            }
        }
    }

    CheckBox {
        id: checkBox_user4
        x: 15
        y: 709
        text: qsTr("用户数据4")
        font.bold: true
        font.pointSize: 20
        checkState: Qt.Unchecked

        nextCheckState: function() {
            if (checkState == Qt.Checked){
                return Qt.Unchecked
            }
            else{
                return Qt.Checked
            }
        }
    }

    CheckBox {
        id: checkBox_user5
        x: 198
        y: 709
        text: qsTr("用户数据5")
        font.bold: true
        font.pointSize: 20
        checkState: Qt.Unchecked

        nextCheckState: function() {
            if (checkState == Qt.Checked){
                return Qt.Unchecked
            }
            else{
                return Qt.Checked
            }
        }
    }

    CheckBox {
        id: checkBox_user6
        x: 381
        y: 709
        text: qsTr("用户数据6")
        font.bold: true
        font.pointSize: 20
        checkState: Qt.Unchecked

        nextCheckState: function() {
            if (checkState == Qt.Checked){
                return Qt.Unchecked
            }
            else{
                return Qt.Checked
            }
        }
    }

    ToolTip {
        id: id_tooltip
        contentItem: Text {
            color: "black"
            text: id_tooltip.text
        }
        background:  Rectangle {
            border.color: "black"
        }
    }

}
