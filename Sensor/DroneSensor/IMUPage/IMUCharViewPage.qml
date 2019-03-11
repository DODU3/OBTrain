import QtQuick 2.0
import QtCharts 2.0
import QtQuick.Controls 2.2

Item {
    width: 1600
    height: 400

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
        y: 0
        title: "实时数据"
        width: 1061
        height: 400
        antialiasing: true

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
            id:angleLinePitch
            axisX: axisX
            axisY: axisy
            name: "Pitch"
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
            id:angleLineRoll
            axisX: axisX
            axisY: axisy
            name: "Roll"
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

        LineSeries {
            id:angleLineYaw
            axisX: axisX
            axisY: axisy
            name: "Yaw"
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


//        LineSeries {
//            id:xLine
//            axisX: axisX
//            axisY: axisy
//            name: "X"
////            color: "blue"
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
//            id:yLine
//            axisX: axisX
//            axisY: axisy
//            name: "Y"
////            color: "brown"
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
//            id:zLine
//            axisX: axisX
//            axisY: axisy
//            name: "Z"
////            color: "green"
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
//            id:user1Line
//            axisX: axisX
//            axisY: axisy
//            name: "User1"
////            color: "purple"
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
////            color: "yellow"
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
////            color: "pink"
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
////            color: "orange"
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
////            color: "grey"
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
////            color: "black"
//            onClicked: {
//                var p = chart.mapToPosition(point);
//                var text = qsTr("x: %1, y: %2").arg(Math.round(point.x)).arg(Math.round(point.y));
//                id_tooltip.x = p.x;
//                id_tooltip.y = p.y - id_tooltip.height;
//                id_tooltip.text = text;
//                id_tooltip.visible = true;

//            }
//        }

        Timer {
            //Timer for demo rotation of compass

            interval: 100
            running: true
            repeat: true

            onTriggered: {
                if(true === myclassExposeByRegType.getserialDrawClearFlagIMU()){
                    angleLinePitch.clear();
                    angleLineRoll.clear();
                    angleLineYaw.clear();
//                    xLine.clear();
//                    yLine.clear();
//                    zLine.clear();
//                    user1Line.clear();
//                    user2Line.clear();
//                    user3Line.clear();
//                    user4Line.clear();
//                    user5Line.clear();
//                    user6Line.clear();
                    globalForJs = 1;
                    axisX.min = 0;
                    axisX.max = 100;
                    myclassExposeByRegType.setserialDrawClearFlagIMU(false);
                }



//                console.log("angleLine: " + myclassExposeByRegType.getQpointFY(angleLine.at(globalForJs-1))+"   "+globalForJs);
                if(true === myclassExposeByRegType.getserialOpenFlag())
                {
                    flag_chartupdata=0;
                    if(axisX.min > 1){
                        angleLinePitch.pointRemoved(axisX.min-1);
                        angleLineRoll.pointRemoved(axisX.min-1);
                        angleLineYaw.pointRemoved(axisX.min-1);
//                        xLine.pointRemoved(axisX.min-1);
//                        yLine.pointRemoved(axisX.min-1);
//                        zLine.pointRemoved(axisX.min-1);
//                        user1Line.pointRemoved(axisX.min-1);
//                        user2Line.pointRemoved(axisX.min-1);
//                        user3Line.pointRemoved(axisX.min-1);
//                        user4Line.pointRemoved(axisX.min-1);
//                        user5Line.pointRemoved(axisX.min-1);
//                        user6Line.pointRemoved(axisX.min-1);
                    }

                    temp_data=myclassExposeByRegType.getAnglePitchNum();
                    angleLinePitch.append(globalForJs,temp_data);
                    if(checkBox_anglepitch.checkState === Qt.Checked)
                    {
                        angleLinePitch.visible=true;
                        //获取当前曲线显示区域的最大值最小值
                        for(tem2p_data=axisX.min;tem2p_data<axisX.max;tem2p_data++)
                        {
                            tem3p_data=myclassExposeByRegType.getQpointFY(angleLinePitch.at(tem2p_data));
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
                        angleLinePitch.visible=false;
                    }

                    temp_data=myclassExposeByRegType.getAngleRollNum();
                    angleLineRoll.append(globalForJs,temp_data);
                    if(checkBox_angleroll.checkState === Qt.Checked)
                    {
                        angleLineRoll.visible=true;
                        //获取当前曲线显示区域的最大值最小值
                        for(tem2p_data=axisX.min;tem2p_data<axisX.max;tem2p_data++)
                        {
                            tem3p_data=myclassExposeByRegType.getQpointFY(angleLineRoll.at(tem2p_data));
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
                        angleLineRoll.visible=false;
                    }

                    temp_data=myclassExposeByRegType.getAngleYawNum();
                    angleLineYaw.append(globalForJs,temp_data);
                    if(checkBox_angleyaw.checkState === Qt.Checked)
                    {
                        angleLineYaw.visible=true;
                        //获取当前曲线显示区域的最大值最小值
                        for(tem2p_data=axisX.min;tem2p_data<axisX.max;tem2p_data++)
                        {
                            tem3p_data=myclassExposeByRegType.getQpointFY(angleLineYaw.at(tem2p_data));
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
                        angleLineYaw.visible=false;
                    }

//                    temp_data=myclassExposeByRegType.getMagX();
//                    xLine.append(globalForJs,temp_data);
//                    if(checkBox_xline.checkState == Qt.Checked)
//                    {
//                        xLine.visible=true;
//                        //获取当前曲线显示区域的最大值最小值
//                        for(tem2p_data=axisX.min;tem2p_data<axisX.max;tem2p_data++)
//                        {
//                            tem3p_data=myclassExposeByRegType.getQpointFY(xLine.at(tem2p_data));
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
//                        xLine.visible=false;
//                    }

//                    temp_data=myclassExposeByRegType.getMagY();
//                    yLine.append(globalForJs,temp_data);
//                    if(checkBox_yline.checkState == Qt.Checked)
//                    {
//                        yLine.visible=true;
//                        //获取当前曲线显示区域的最大值最小值
//                        for(tem2p_data=axisX.min;tem2p_data<axisX.max;tem2p_data++)
//                        {
//                            tem3p_data=myclassExposeByRegType.getQpointFY(yLine.at(tem2p_data));
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
//                        yLine.visible=false;
//                    }

//                    temp_data=myclassExposeByRegType.getMagZ();
//                    zLine.append(globalForJs,temp_data);
//                    if(checkBox_zline.checkState == Qt.Checked)
//                    {
//                        zLine.visible=true;
//                        //获取当前曲线显示区域的最大值最小值
//                        for(tem2p_data=axisX.min;tem2p_data<axisX.max;tem2p_data++)
//                        {
//                            tem3p_data=myclassExposeByRegType.getQpointFY(zLine.at(tem2p_data));
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
//                        zLine.visible=false;
//                    }

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

                value_Max_axisy=temp2_data_max+10;
                value_Min_axisy=temp2_data_min-10;
            }
        }
    }

    CheckBox {
        id: checkBox_anglepitch
        x: 1076
        y: 6
        text: qsTr("俯仰角")
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
        id: checkBox_angleroll
        x: 1252
        y: 8
        text: qsTr("横滚角")
        font.bold: true
        nextCheckState: function() {
            if (checkState == Qt.Checked){
                return Qt.Unchecked
            }
            else{
                return Qt.Checked
            }
        }
        checkState: Qt.Checked
        font.pointSize: 20
    }

    CheckBox {
        id: checkBox_angleyaw
        x: 1425
        y: 8
        text: qsTr("偏航角")
        font.bold: true
        nextCheckState: function() {
                if (checkState == Qt.Checked){
                    return Qt.Unchecked
                }
                else{
                    return Qt.Checked
                }
        }
        checkState: Qt.Checked
        font.pointSize: 20
    }

    CheckBox {
        id: checkBox_xline
        x: 1076
        y: 52
        text: qsTr("X轴角速度")
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
        id: checkBox_yline
        x: 1250
        y: 52
        text: qsTr("Y轴角速度")
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
        id: checkBox_zline
        x: 1424
        y: 52
        text: qsTr("Z轴角速度")
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
        id: checkBox_xline1
        x: 1076
        y: 98
        text: qsTr("X轴加速度")
        font.bold: true
        nextCheckState: function() {
            if (checkState == Qt.Checked){
                return Qt.Unchecked
            }
            else{
                return Qt.Checked
            }
        }
        checkState: Qt.Unchecked
        font.pointSize: 20
    }

    CheckBox {
        id: checkBox_yline1
        x: 1250
        y: 98
        text: qsTr("Y轴加速度")
        font.bold: true
        nextCheckState: function() {
            if (checkState == Qt.Checked){
                return Qt.Unchecked
            }
            else{
                return Qt.Checked
            }
        }
        checkState: Qt.Unchecked
        font.pointSize: 20
    }

    CheckBox {
        id: checkBox_zline1
        x: 1424
        y: 98
        text: qsTr("Z轴加速度")
        font.bold: true
        nextCheckState: function() {
                if (checkState == Qt.Checked){
                    return Qt.Unchecked
                }
                else{
                    return Qt.Checked
                }
            }
        checkState: Qt.Unchecked
        font.pointSize: 20
    }

    CheckBox {
        id: checkBox_user1
        x: 1076
        y: 144
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
        x: 1250
        y: 144
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
        x: 1424
        y: 144
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
        x: 1076
        y: 197
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
        x: 1250
        y: 197
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
        x: 1424
        y: 197
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
