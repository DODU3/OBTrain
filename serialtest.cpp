﻿#include "serialtest.h"
#include<iostream>
#include <QSerialPortInfo>
#include <QQmlComponent>
#include <QDebug>
#include <string>
#include <QDateTime>
#include <QQmlProperty>
#include <stdio.h>
#include <QPointF>
#include <QTimer>
#include <QtCore>
#include<stdlib.h>
#include <math.h>
#include <QThread>

SerialTest::Settings currentsetting;//定义设定值结构体的结构体变量
QSerialPort *serialtest;
QString m_serialdataall("");
qint64 mag_corner(0);
qint64 mag_x(0);
qint64 mag_y(0);
qint64 mag_z(0);
qint64 mag_user1(0);
qint64 mag_user2(0);
qint64 mag_user3(0);
qint64 mag_user4(0);
qint64 mag_user5(0);
qint64 mag_user6(0);
QString mag_cornerStr("0\xc2\xb0 \xe5\x8c\x97");

QString m_serialSaveAndApp("");

static qint64 c_sendnumber,c_receivenumber;

static bool settingAddrFlag = false;

static int addr1 = 0;
static int addr2 = 0;
static int addr3 = 0;
static int addrch = 0;

static bool serialOpenFlag = false;
static bool serialDrawClearFlagMag = false;
static bool serialDrawClearFlagIMU = false;
static bool serialDrawClearFlagDrone = false;
static bool serialDrawClearFlagBaro = false;

//static QTimer timerSend;
static bool SerialTestInited = false;
static double currentLon = 0, currentLat = 0;
static int currentNorthSpeed = 0, currentEastSpeed = 0, currentSatelliteNum = 0, currentHdop = 0;
static QThread * threadSerialPort;

static int ACCX = 0, ACCY = 0, ACCZ = 0, GYROX = 0, GYROY = 0, GYROZ = 0;
static double Angle_Acc_X = 0, Angle_Acc_Y;

static int Heigth_Ultrasonic_lowpass = 0, Heigth_Ultrasonic_nofliter = 0;
static double Heigth_Ultrasonic_time = 0;
static double Heigth_Ultrasonic_alpha = 0;

static double anglepitch = 0, angleroll = 0, angleyaw = 0;
static double altitude = 0;
static int TIMEcnt = 0;
static int TIMEINT = 0;

static int pressureRaw = 0, pressureFilter = 0;
static int slideDepth = 8;
static int pressureHeight = 0;

static int opticalflowspeedx = 0, opticalflowspeedy = 0;
static int opticalflowsumx = 0, opticalflowsumy = 0;

static bool serialSendRequest = true;

static int flag_currentPage = 0;//标识符，指示当前页面序号
//1：加速度计模组界面
//2：陀螺仪模组界面
//3：GPS模组界面
//4：气压计模组界面
//5：超声波模组界面
//6：电子罗盘模组界面
//7：无人机整机界面
//8：人脸识别界面
//9：人形跟随界面
//10：姿态识别界面
//11：光流


SerialTest::SerialTest(QSerialPort *parent):
    QSerialPort (parent),
    m_receivedata("Receive Label"),
    m_receivenumber("0"),
    m_sendnumber("0")
{
    if(false == SerialTestInited)
    {
        SerialTestInited = true;

        serialtest = new QSerialPort;
//    QTimer *timerSend = new QTimer(this);
//        timerSend.setInterval(50);
//        timerSend.setTimerType(Qt::TimerType::PreciseTimer);
//        QObject::connect(&timerSend, SIGNAL(timeout()), this, SLOT(timersendtimeout()));
        QObject::connect(serialtest, SIGNAL(readyRead()),this, SLOT(receivefrom()));//将端口收到数据产生的信号绑定receivefrom()函数;
//        threadSerialPort = new QThread(this);
//        serialtest->moveToThread(threadSerialPort);
//        threadSerialPort->start();

    }
}

//打开端口并设置:函数的参数（……Index由qml中combobox的currentIndex决定），由按钮触发
void SerialTest::openAndSetPort(QString PortName,
                                int BaudRateIndex,
                                int DatabitsIndex,
                                int ParityIndex,
                                int StopbitsIndex,
                                int FlowcontrolIndex)
{
    ////////////////////1.得到当前选择的各项设置//////////////////////////////
    //得到当前端口名
//    QString allname[6]={"COM1","COM2","COM3","COM4","COM5","COM6"};//列举所有的端口名
//    currentsetting.name=allname[PortNameIndex];//由qml里表示name的combobox的currentIndex来确定当前的name
    currentsetting.name=PortName;
    std::cout<<" ok setPortName to "+ currentsetting.name.toStdString()<< std::endl;//通过输出来验证设定成功

    //得到当前波特率
    qint32 allbauRate[4]={9600,19200,38400,115200};
    currentsetting.baudRate=allbauRate[BaudRateIndex];

    //得到当前发送位数
    QSerialPort::DataBits allDatabits[4]={QSerialPort::Data5,
                                          QSerialPort::Data6,
                                          QSerialPort::Data7,
                                          QSerialPort::Data8};
    currentsetting.dataBits=allDatabits[DatabitsIndex];

    //得到当前Parity
    QSerialPort::Parity allparity[5]={QSerialPort::NoParity,
                                      QSerialPort::EvenParity,
                                      QSerialPort::OddParity,
                                      QSerialPort::MarkParity,
                                      QSerialPort::SpaceParity};
    currentsetting.parity=allparity[ParityIndex];

    //得到当前停止位
    QSerialPort::StopBits allstopBits[3]={QSerialPort::OneStop,
                                          QSerialPort::OneAndHalfStop,
                                          QSerialPort::TwoStop};
    currentsetting.stopBits=allstopBits[StopbitsIndex];

    //得到当前FlowControl
    QSerialPort::FlowControl allflowControl[3]={QSerialPort::NoFlowControl,
                                                QSerialPort::HardwareControl,
                                                QSerialPort::SoftwareControl};
    currentsetting.flowControl=allflowControl[FlowcontrolIndex];


////////////////////2.设定当前端口名//////////////////////////////
    serialtest->setPortName(currentsetting.name);

////////////////////3.打开这一端口并按照当前设置信息进行设置//////////////////////////////
    if (serialtest->open(QIODevice::ReadWrite))//打开这一端口
    {
        std::cout<<"open port sucess"<<std::endl;

        if(serialtest->setBaudRate(currentsetting.baudRate)//设置各项信息
                && serialtest->setDataBits(currentsetting.dataBits)
                && serialtest->setParity(currentsetting.parity)
                && serialtest->setStopBits(currentsetting.stopBits)
                && serialtest->setFlowControl(currentsetting.flowControl))
        {
            std::cout<<"set sucess"<<std::endl;
//            threadSerialPort->start();
        }

        serialDrawClearFlagMag = true;
        serialDrawClearFlagIMU = true;
        serialDrawClearFlagDrone = true;
        serialDrawClearFlagBaro = true;
        serialOpenFlag = true;
        clearSerialDataAll();
        QString pagenumber = QString("%1").arg(flag_currentPage, 2, 16, QLatin1Char( '0' ));
        sendCMD("2c", "808080800800", pagenumber+"00000000000000");
//        timerSend.start();
    }
}


void SerialTest::getPortInfo()
{
    m_portInfo.clear();
    const auto infos = QSerialPortInfo::availablePorts();
    for (const QSerialPortInfo &info : infos){
        std::cout<<" port name" + info.portName().toStdString()<<std::endl;
        m_portInfo.append(info.portName());
    }

}

//构建和发送无人机串口通信发送帧
void SerialTest::DroneFrame_MakeAndSerialSend(quint8 Realdata[4],quint8 Realstatus[2],quint8 Command,quint8 CommandData[8],quint8 Heartbeat)
{
    quint8 temp_uint8;

    //常整形转换为Qstring形
//    long a =63;
//    QString str=QString::number(a,16); //str="3f";
//    QString str=QString::number(a,16).toUpper(); //str="3F";

    QString StrDroneFrame;//无人机串口通信发送帧
    QString StrFramehead = "ff55";//帧头


    QString StrRealdata;
    for(temp_uint8=0;temp_uint8<4;temp_uint8++)
    {
        StrRealdata+=QString::number(Realdata[temp_uint8],16);//实时数据
    }

    QString StrRealstatus;
    for(temp_uint8=0;temp_uint8<2;temp_uint8++)
    {
        StrRealstatus+=QString::number(Realstatus[temp_uint8],16);//实时状态
    }

    QString StrCommand=QString::number(Command,16); //功能字

    QString StrCommandData;
    for(temp_uint8=0;temp_uint8<8;temp_uint8++)
    {
        StrCommandData+=QString::number(CommandData[temp_uint8],16);//功能字数据
    }

    QString StrHeartbeat=QString::number(Heartbeat,16); //心跳包

    StrDroneFrame=StrFramehead+StrRealdata+StrRealstatus+StrCommand+StrCommandData+StrHeartbeat;

    std::cout<<" StrDroneFrame:" + StrDroneFrame.toStdString()<<std::endl;

//    sendto(StrDroneFrame);

}

void SerialTest::setRFaddr(QString addr1,QString addr2,QString addr3,QString channel)
{

//    QString straddr1 = QString("%1").arg(addr1, 2, 16, QLatin1Char( '0' ));
//    QString straddr2 = QString("%1").arg(addr2, 2, 16, QLatin1Char( '0' ));
//    QString straddr3 = QString("%1").arg(addr3, 2, 16, QLatin1Char( '0' ));
//    QString strchannel = QString("%1").arg(channel, 2, 16, QLatin1Char( '0' ));
//    command += straddr1;
//    command += straddr2;
//    command += straddr3;
//    command += straddr1;
//    command += straddr2;
//    command += straddr3;
//    command += strchannel;
//        command += "0000";

//    QString command = "ff5580808080080029";
    QString command = "";
    QString straddr1 ;
    QString straddr2 ;
    QString straddr3 ;
    QString strchannel;
    bool ok;
    quint8 dec;
    dec=addr1.toInt(&ok,10); //dec=255 ; ok=rue
    straddr1 = QString("%1").arg(dec, 2, 16, QLatin1Char( '0' ));
    dec=addr2.toInt(&ok,10); //dec=255 ; ok=rue
    straddr2 = QString("%1").arg(dec, 2, 16, QLatin1Char( '0' ));
    dec=addr3.toInt(&ok,10); //dec=255 ; ok=rue
    straddr3 = QString("%1").arg(dec, 2, 16, QLatin1Char( '0' ));
    dec=channel.toInt(&ok,10); //dec=255 ; ok=rue
    strchannel = QString("%1").arg(dec, 2, 16, QLatin1Char( '0' ));
    command += straddr1;
    command += straddr2;
    command += straddr3;
    command += straddr3;
    command += straddr2;
    command += straddr1;
    command += strchannel;

    command += "00";

//    std::cout<<" value:" + command.toStdString()<<std::endl;

//    sendto(command);
    sendCMD("29", "808080800800", command);
}


void SerialTest::setCurrentPage(int current_page)
{
    flag_currentPage=current_page;
}

int SerialTest::getCurrentPage(void)
{
    return flag_currentPage;
}




void SerialTest::setUltrasonicLowpassfliter(QString value_freq,QString value_confficent)
{

    QString command = "";
    QString strvalue_freq;
    QString stvalue_confficent;

    bool ok;
    int dec;
    float temp_float;

    dec=value_freq.toInt(&ok,10);
    if(0!=dec)
    {
        dec=1000/dec;//转换为周期，单位是ms
        if(dec>1000)
        {
            dec=1000;
        }
        else if(dec<10)
        {
            dec=10;
        }
    }
    else {
        dec=50;
    }
    strvalue_freq = QString("%1").arg(dec, 4, 16, QLatin1Char( '0' ));


    temp_float=value_confficent.toFloat();
//    temp_float=value_confficent.toDouble();
    temp_float=temp_float*10000;
    dec=temp_float;
    if(dec>9999)
    {
        dec=9999;
    }
    else if(dec<1)
    {
        dec=1;
    }

    stvalue_confficent = QString("%1").arg(dec, 4, 16, QLatin1Char( '0' ));
    command += strvalue_freq;
    command += stvalue_confficent;
    command += "0000000000";

//    std::cout<<" value" + command.toStdString()<<std::endl;
    sendCMD("2e", "808080800800", command);
}

void SerialTest::setLabAngle(QString angle_Roll,QString angle_Yaw)
{

//    QString command = "ff55000000000000280000";

    QString command = "0000";
    QString strangle_Roll;
    QString strangle_Yaw;

    bool ok;
    int dec;

    dec=angle_Roll.toInt(&ok,10); //dec=255 ; ok=rue
    strangle_Roll = QString("%1").arg(dec, 4, 16, QLatin1Char( '0' ));
    dec=angle_Yaw.toInt(&ok,10); //dec=255 ; ok=rue
    strangle_Yaw = QString("%1").arg(dec, 4, 16, QLatin1Char( '0' ));
    if(strangle_Roll.length() >4){
        command += strangle_Roll.mid(12,4);
    }else{
        command += strangle_Roll;
    }
    command += strangle_Yaw;
    command += "000000";

//    std::cout<<" value" + command.toStdString()<<std::endl;
    sendCMD("28", "808080800800", command);
}


void SerialTest::setMagCorner(int yawValue,int rollValue)
{
    QString yaw = QString("%1").arg(yawValue, 4, 16, QLatin1Char( '0' ));
    QString roll = QString("%1").arg(rollValue, 4, 16, QLatin1Char( '0' ));
//    QString command = "ff55000020000000280000";
    QString command = "0000";
    if(roll.length() >4){
        command += roll.mid(12,4);
    }else{
        command += roll;
    }


    command += yaw;
    command += "000000";

//    std::cout<<" value" + command.toStdString()<<std::endl;
//    sendto(command);
    sendCMD("28", "808080800800", command);

}


void SerialTest::setPlatformYawAngle(int yawValue,int yawRateValue)
{
    QString yaw = QString("%1").arg(yawValue, 4, 16, QLatin1Char( '0' ));
    QString yawrate = QString("%1").arg(yawRateValue, 2, 16, QLatin1Char( '0' ));
    QString command1 = "0000";

    command1 += yawrate;

    command1 += "000000";

    QString command2 = "00000000";

    command2 += yaw;
    command2 += "0000";

//    std::cout<<" value" + command2.toStdString()<<std::endl;

//    sendto(command);
    sendCMD("28", command1, command2);

}

void SerialTest::setPlatformRollAngle(int rollValue,int rollRateValue)
{
    QString roll = QString("%1").arg(rollValue, 4, 16, QLatin1Char( '0' ));
    QString rollrate = QString("%1").arg(rollRateValue, 2, 16, QLatin1Char( '0' ));
    QString command1 = "00";

    command1 += rollrate;

    command1 += "00000000";

    QString command2 = "0000";

    if(roll.length() >4){
        command2 += roll.mid(12,4);
    }else{
        command2 += roll;

    }
    command2 += "00000000";

//    std::cout<<" value" + command2.toStdString()<<std::endl;

//    sendto(command);
    sendCMD("28", command1, command2);

}

void SerialTest:: setBaroSlideDepth(int slidedepth)
{
    QString yawrateStr = QString("%1").arg(slidedepth, 2, 16, QLatin1Char( '0' ));
    QString command1 = "808080800800";

    QString command2 = "";

    command2 += yawrateStr;
    command2 += "00000000000000";

//    std::cout<<" value" + command.toStdString()<<std::endl;

//    sendto(command);
    sendCMD("31", command1, command2);
}

void SerialTest:: setOptDistance(int distance)
{
    QString distanceStr = QString("%1").arg(distance, 2, 16, QLatin1Char( '0' ));
    QString command1 = "808080800800";

    QString command2 = "";

    command2 += distanceStr;
    command2 += "00000000000000";

//    std::cout<<" value" + command.toStdString()<<std::endl;

//    sendto(command);
    sendCMD("30", command1, command2);
}

QStringList SerialTest:: receivePort()
{
    return m_portInfo;
}

static quint8 heartbeat = 0;

////////////////////4.发送数据//////////////////////////////
void SerialTest::sendto(QString sendmessage)//此函数由qml里的send按钮触发，sendmessage来源于qml文本框的当前文本，
{
    if(true == serialOpenFlag){
        heartbeat++;
        QString heartbeatStr = QString("%1").arg(heartbeat, 2, 16, QLatin1Char( '0' ));
        QString value =  sendmessage.mid(0, 34) + heartbeatStr;    // "FFFF"   <- just the hex values!
//        std::cout<<" value" + value.toStdString()<<std::endl;
        QByteArray data = QByteArray::fromHex(value.toLatin1());
    //    QByteArray data = sendmessage.toLocal8Bit()+'\r';//将QString转为QByteArray，并加上'\r'（回车符）,因为芯片要求在回车符之后再返回数据

        qint64 testwritenumber=serialtest->write(data);//写入数据

        m_receivedata=m_receivedata+"\n";//加上换行符便于显示

        c_sendnumber=c_sendnumber+testwritenumber-1;//发送数据字节数统计（减去回车符）
        setsendnumber(QString ::number(c_sendnumber));//更新发送的数据字节总数

//        addSerialDataAll("Tx:" + value);
    }
}

//static int CMDsendtime = 0;
static QString CMDFormat;

void SerialTest::sendCMD(QString cmd, QString data1, QString data2){

    CMDFormat = "ff55" + data1.mid(0,12) + cmd.mid(0,2) + data2.mid(0,16);

    qDebug() << CMDFormat;
    addSerialDataAll("Tx:" + CMDFormat);

//    CMDFormat = QByteArray::fromHex(value.toLatin1());

//    CMDsendtime = 1;
    sendto(CMDFormat);

}

void SerialTest::timersendtimeout(void){
//    QTime currentTime = QTime::currentTime();
//    qDebug() << currentTime;
//    if(CMDsendtime <= 0){
//        if(true == serialSendRequest){
//            sendto("ff5580808080080000000000000000000000");
//        }
//    }
//    else{
//        CMDsendtime--;
//        sendto(CMDFormat);
//    }
}

void SerialTest::setsendnumber(QString sendnumber)//更新发送的数据字节总数，触发sendnumberChanged()的消息响应函数sendnumber()来更新显示
{
    m_sendnumber=sendnumber;
    emit sendnumberChanged();
}

QString SerialTest::sendnumber()//响应sendnumberChanged()消息
{
    return m_sendnumber;
}

////////////////////4.接收数据//////////////////////////////
void SerialTest::receivefrom()//由readyRead()消息出发（在前边进行绑定），当串口收到数据此消息被激活（对于串口，每发送出去一个字节，都会将此字节返回，触发readyread消息，当芯片有特殊指令时，收到的信息更多，比如对sim900，发送0000，芯片就会受到0000，但是发送AT，会受到 AT OK）
{
    QByteArray data = serialtest->readAll();//读取所有收到的数据

    QString receivedata=data.toHex();//将QByteArray转为QString来显示
//    qDebug() << receivedata;
    QString subString = receivedata.mid(0,4);

    QDateTime currentTime = QDateTime::currentDateTime();
    QString qs_currenttime = currentTime.toString("ss.zzz");
//    qDebug() << qs_currenttime;


    bool ok = false;

    if(subString == "ff55")
    {
        if(receivedata.mid(28,2) == "01"){
//            bool ok = false;
            qint64 corner = (receivedata.mid(4,4).toInt(&ok, 16))/10;
            int x = (receivedata.mid(8,4).toInt(&ok, 16));
            if(x >= 32768){
                x -= 65536;
            }
            int y = (receivedata.mid(12,4).toInt(&ok, 16));
            if(y >= 32768){
                y -= 65536;
            }
            int z = (receivedata.mid(16,4).toInt(&ok, 16));
            if(z >= 32768){
                z -= 65536;
            }
            mag_x = x;
            mag_y= y;
            mag_z = z;

            if(6==flag_currentPage)
            {
                addserialSaveAndApp( "MxMyMz: " +
                                    QString::number(corner,'f',1) + " " +
                                    QString::number(x) + " " +
                                    QString::number(y) + " " +
                                    QString::number(z) + " ");
                           // qDebug() << corner << "  " << x << "  " << y << "  " << z << "  ";
            }

            if(ok && corner != mag_corner){
                mag_corner = corner;
                if(mag_corner <= 21 || mag_corner >= 338 ){
                    setMagCornerStr(QString::number(mag_corner) + "\xc2\xb0 \xe5\x8c\x97");
                }else if (mag_corner >= 22 && mag_corner <= 66) {
                    setMagCornerStr(QString::number(mag_corner) + "\xc2\xb0 \xe4\xb8\x9c\xe5\x8c\x97");
                }else if (mag_corner >= 67 && mag_corner <= 112) {
                    setMagCornerStr(QString::number(mag_corner) + "\xc2\xb0 \xe4\xb8\x9c");
                }else if (mag_corner >= 113 && mag_corner <= 156) {
                    setMagCornerStr(QString::number(mag_corner) + "\xc2\xb0 \xe4\xb8\x9c\xe5\x8d\x97");
                }else if (mag_corner >= 157 && mag_corner <= 201) {
                    setMagCornerStr(QString::number(mag_corner) + "\xc2\xb0 \xe5\x8d\x97");
                }else if (mag_corner >= 202 && mag_corner <= 247) {
                    setMagCornerStr(QString::number(mag_corner) + "\xc2\xb0 \xe8\xa5\xbf\xe5\x8d\x97");
                }else if (mag_corner >= 248 && mag_corner <= 291) {
                    setMagCornerStr(QString::number(mag_corner) + "\xc2\xb0 \xe8\xa5\xbf");
                }else if (mag_corner >= 292 && mag_corner <= 337) {
                    setMagCornerStr(QString::number(mag_corner) + "\xc2\xb0 \xe8\xa5\xbf\xe5\x8c\x97");
                }
//                std::cout<<" mag_cornerStr:" + mag_cornerStr.toStdString()<<std::endl;
                emit receiveMagCornerChanged();
            }

        }else if(receivedata.mid(28,2) == "06"){
                if(settingAddrFlag == true){
                    settingAddrFlag = false;
//                    bool ok = false;
                    addr1 = receivedata.mid(4,2).toInt(&ok, 16);
                    addr2 = receivedata.mid(6,2).toInt(&ok, 16);
                    addr3 = receivedata.mid(8,2).toInt(&ok, 16);
                    addrch = receivedata.mid(16,2).toInt(&ok, 16);
                }

        }
        else if(receivedata.mid(28,2) == "05"){
            //gps信息
//            bool ok = false;
            int u16half = 1 << 15;
            int u16 = 1 << 16;
            long u32half = 1 << 31;
            long u32 = 1 << 32;
            int currentLonInt = receivedata.mid(4,8).toInt(&ok, 16);
            if(currentLonInt >= (u32half)){
                currentLonInt -= u32;
            }
            currentLon = ((double)currentLonInt / 1e7);
            int currentLatInt = receivedata.mid(12,8).toInt(&ok, 16);
            if(currentLatInt >= (u32half)){
                currentLatInt -= (u32);
            }
            currentLat = ((double)currentLatInt / 1e7);
            currentEastSpeed = receivedata.mid(20,4).toInt(&ok, 16);
            if(currentEastSpeed >= u16half){
                currentEastSpeed -= u16;
            }
            currentNorthSpeed = receivedata.mid(24,4).toInt(&ok, 16);
            if(currentNorthSpeed >= u16half){
                currentNorthSpeed -= u16;
            }
            currentSatelliteNum = receivedata.mid(30,2).toInt(&ok, 16);
            currentHdop  = receivedata.mid(32,4).toInt(&ok, 16);
//            QDateTime currentTime = QDateTime::currentDateTime();
//            QString qs_currenttime = currentTime.toString("hh:mm:ss.zzz");

//            if(3==flag_currentPage)
//            {
//                addserialSaveAndApp("GPS_Data: " +
//                                getCurrentLon() + " " +
//                                getCurrentLat() + " ");
//                //            qDebug() << (QString::number(currentLon) + "," + QString::number(currentLat) + "," +QString::number(currentEastSpeed)
////                         +"," +QString::number(currentNorthSpeed) + "," +QString::number(currentSatelliteNum) + "," +QString::number(currentHdop));
////            qDebug() << (1<<15);
//            }
        }else if(receivedata.mid(28,2) == "02")
        {
            //接收到IMU模组数据模块1
            int u16half = 1 << 15;
            int u16 = 1 << 16;
            ACCX = receivedata.mid(4,4).toInt(&ok, 16);
            if(ACCX >= u16half){
                ACCX -= u16;
            }
            ACCY = receivedata.mid(8,4).toInt(&ok, 16);
            if(ACCY >= u16half){
                ACCY -= u16;
            }
            ACCZ = receivedata.mid(12,4).toInt(&ok, 16);
            if(ACCZ >= u16half){
                ACCZ -= u16;
            }

            float temp;
            temp=atan((double)ACCX/sqrtf(ACCY*ACCY+ACCZ*ACCZ))*180/3.1415926;
            temp-=Angle_Acc_X;
            if(temp>0.2||temp<-0.2)
            {
                Angle_Acc_X+=temp;
            }
            temp=atan((double)ACCY/sqrtf(ACCX*ACCX+ACCZ*ACCZ))*180/3.1415926;
            temp-=Angle_Acc_Y;
            if(temp>0.2||temp<-0.2)
            {

                Angle_Acc_Y+=temp;
            }

            GYROX = receivedata.mid(16,4).toInt(&ok, 16);
            if(GYROX >= u16half){
                GYROX -= u16;
            }
            GYROY = receivedata.mid(20,4).toInt(&ok, 16);
            if(GYROY >= u16half){
                GYROY -= u16;
            }
            GYROZ = receivedata.mid(24,4).toInt(&ok, 16);
            if(GYROZ >= u16half){
                GYROZ -= u16;
            }

            if(0 == TIMEINT)
            {
                TIMEINT = receivedata.mid(32,4).toInt(&ok, 16);
            }
            TIMEcnt = receivedata.mid(32,4).toInt(&ok, 16) - TIMEINT;
            if(1==flag_currentPage)
            {
                addserialSaveAndApp("AxAyAz; " +
                                    QString::number((double)ACCX/512,'f',4) + "  " +
                                    QString::number((double)ACCY/512,'f',4) + "  " +
                                    QString::number((double)ACCZ/512,'f',4) + "  " );
                //            qDebug() << (QString::number(currentLon) + "," + QString::number(currentLat) + "," +QString::number(currentEastSpeed)


            }
            else if(2==flag_currentPage){
                addserialSaveAndApp(QString::number(TIMEcnt*0.05,'f',2)/*qs_currenttime*/ + ";  " +
                                    QString::number(GYROZ* 0.061035,'f',6) + ";  ");
                //            qDebug() << (QString::number(currentLon) + "," + QString::number(currentLat) + "," +QString::number(currentEastSpeed)
            }



        }
        else if(receivedata.mid(28,2) == "08")
        {
            //接收到超声波模组数据
            int u16half = 1 << 15;
            int u16 = 1 << 16;
            Heigth_Ultrasonic_nofliter = receivedata.mid(4,4).toInt(&ok, 16);
            if(Heigth_Ultrasonic_nofliter >= u16half){
                Heigth_Ultrasonic_nofliter = 1;
            }

            Heigth_Ultrasonic_lowpass = receivedata.mid(8,4).toInt(&ok, 16);
            if(Heigth_Ultrasonic_lowpass >= u16half){
                Heigth_Ultrasonic_lowpass = 1;
            }
            Heigth_Ultrasonic_time = Heigth_Ultrasonic_lowpass/170.0;// / 340 * 2

            Heigth_Ultrasonic_alpha = receivedata.mid(16,4).toInt(&ok, 16) / 10000.0;

            if(5==flag_currentPage)
            {
                addserialSaveAndApp("Ultrasonic_Data: " +
                                getHeigth_Ultrasonic_nofliter() + " " +
                                getHeigth_Ultrasonic_lowpass());
//            qDebug() << Heigth_Ultrasonic_nofliter << Heigth_Ultrasonic_lowpass;
            }
        }
        else if(receivedata.mid(28,2) == "03")
        {
            //接收到IMU模组数据模块2
            int u16half = 1 << 15;
            int u16 = 1 << 16;
            anglepitch = receivedata.mid(4,4).toInt(&ok, 16);
            if(anglepitch >= u16half){
                anglepitch -= u16;
            }
            anglepitch = anglepitch / 10.0;
            angleroll = receivedata.mid(8,4).toInt(&ok, 16);
            if(angleroll >= u16half){
                angleroll -= u16;
            }
            angleroll = angleroll / 10.0;
            angleyaw = receivedata.mid(12,4).toInt(&ok, 16);
            if(angleyaw >= u16half){
                angleyaw -= u16;
            }
            angleyaw = (angleyaw/10.0 - 180);

//            addserialSaveAndApp(qs_currenttime + ";  " +
//                                getAnglePitch() + ";  " +
//                                getAngleRoll() + ";  " +
//                                getAngleYaw() + ";  ");//            qDebug() << (QString::number(currentLon) + "," + QString::number(currentLat) + "," +QString::number(currentEastSpeed)
//            qDebug() << anglepitch << angleroll << angleyaw;
        }

        else if(receivedata.mid(28,2) == "00")
        {
            //接收到无人机整机数据帧

            int u16half = 1 << 15;
            int u16 = 1 << 16;
            int temp;

            altitude = receivedata.mid(20,4).toInt(&ok, 16);

            angleyaw = receivedata.mid(12,4).toInt(&ok, 16);
            if(angleyaw >= u16half){
               angleyaw -= u16;
            }
            angleyaw = angleyaw/10.0;
            if(angleyaw<0)
            {
                angleyaw+=360;

            }

            temp=receivedata.mid(30,2).toInt(&ok, 16);
            if(temp==1)
            {
                anglepitch = receivedata.mid(32,4).toInt(&ok, 16);
                if(anglepitch >= u16half){
                    anglepitch -= u16;
                }
                anglepitch = anglepitch / 10.0;
            }
            else if(temp==2)
            {
                angleroll = receivedata.mid(32,4).toInt(&ok, 16);
                if(angleroll >= u16half){
                    angleroll -= u16;
                }
                angleroll = angleroll / 10.0;
            }
//            else if(temp==3)
//            {
//                altitude = receivedata.mid(32,4).toInt(&ok, 16);
//                if(altitude >= u16half){
//                    altitude -= u16;
//                }
//            }
//            else if(temp==5)
//            {
//                angleyaw = receivedata.mid(32,4).toInt(&ok, 16);
//                if(angleyaw >= u16half){
//                     angleyaw -= u16;
//                }
//                angleyaw = (angleyaw/10.0 - 180);
//            }

            if(7==flag_currentPage)
            {
            addserialSaveAndApp("Drone_Data:" +
                                        getAnglePitch() + " " +
                                        getAngleRoll() + " " +
                                        getAngleYaw() + " ");//            qDebug() << (QString::number(currentLon) + "," + QString::number(currentLat) + "," +QString::number(currentEastSpeed)
        //            qDebug() << anglepitch << angleroll << angleyaw;
            }
        }

        else if(receivedata.mid(28,2) == "0b")
        {
            //无人机整机实验设计数据
            int u16half = 1 << 15;
            int u16 = 1 << 16;
            ACCX = receivedata.mid(4,4).toInt(&ok, 16);
            if(ACCX >= u16half){
                ACCX -= u16;
            }
            ACCY = receivedata.mid(8,4).toInt(&ok, 16);
            if(ACCY >= u16half){
                ACCY -= u16;
            }
            ACCZ = receivedata.mid(12,4).toInt(&ok, 16);
            if(ACCZ >= u16half){
                ACCZ -= u16;
            }

            float temp;
            temp=atan((double)ACCX/sqrtf(ACCY*ACCY+ACCZ*ACCZ))*180/3.1415926;
            temp-=Angle_Acc_X;
            if(temp>0.2||temp<-0.2)
            {
                Angle_Acc_X+=temp;
            }
            temp=atan((double)ACCY/sqrtf(ACCX*ACCX+ACCZ*ACCZ))*180/3.1415926;
            temp-=Angle_Acc_Y;
            if(temp>0.2||temp<-0.2)
            {

                Angle_Acc_Y+=temp;
            }

            GYROX = receivedata.mid(16,4).toInt(&ok, 16);
            if(GYROX >= u16half){
                GYROX -= u16;
            }
            GYROY = receivedata.mid(20,4).toInt(&ok, 16);
            if(GYROY >= u16half){
                GYROY -= u16;
            }
            GYROZ = receivedata.mid(24,4).toInt(&ok, 16);
            if(GYROZ >= u16half){
                GYROZ -= u16;
            }

            if(7==flag_currentPage){
                addserialSaveAndApp(/*"AxAyAzGxGyGz " +*/
                                    QString::number(ACCX/512.0,'f',4) + "  " +
                                    QString::number(ACCY/512.0,'f',4) + "  " +
                                    QString::number(ACCZ/512.0,'f',4) + "  " +
                                    QString::number(GYROX* 0.0001,'f',4) + "  " +
                                    QString::number(GYROY* 0.0001,'f',4) + "  " +
                                    QString::number(GYROZ* 0.0001,'f',4) + "  ");
//                qDebug() <<  QString::number(ACCX/512.0,'f',4);
                //            qDebug() << (QString::number(currentLon) + "," + QString::number(currentLat) + "," +QString::number(currentEastSpeed)
            }
        }
        else if(receivedata.mid(28,2) == "04"){
            //气压计信息
//            bool ok = false;
            int u16half = 1 << 15;
            int u16 = 1 << 16;
            long u32half = 1 << 31;
            long u32 = 1 << 32;
            pressureRaw = receivedata.mid(4,8).toInt(&ok, 16);
            if(pressureRaw >= (u32half)){
                pressureRaw -= u32;
            }
            pressureFilter = receivedata.mid(12,8).toInt(&ok, 16);
            if(pressureFilter >= u32half){
               pressureFilter -= u32;
            }
            slideDepth = receivedata.mid(20,2).toInt(&ok, 16);
//            qDebug()<<(slideDepth);
            pressureHeight = receivedata.mid(22,4).toInt(&ok, 16);
            if(pressureHeight >= u16half){
               pressureHeight -= u16;
            }
            if(4==flag_currentPage)
            {
                addserialSaveAndApp("Barometric_Data: " +
                                        getpressureRaw() + " " +
                                        getpressureFilter() + " ");
            }
        }
        else if(receivedata.mid(28,2) == "09"){
            //光流信息
//            bool ok = false;
            int u16half = 1 << 15;
            int u16 = 1 << 16;
            opticalflowspeedx = receivedata.mid(4,4).toInt(&ok, 16);
            if(opticalflowspeedx >= (u16half)){
                opticalflowspeedx -= u16;
            }
            opticalflowspeedy = receivedata.mid(8,4).toInt(&ok, 16);
            if(opticalflowspeedy >= (u16half)){
                opticalflowspeedy -= u16;
            }
            opticalflowsumx = receivedata.mid(12,4).toInt(&ok, 16);
            if(opticalflowsumx >= (u16half)){
                opticalflowsumx -= u16;
            }
            opticalflowsumy = receivedata.mid(16,4).toInt(&ok, 16);
            if(opticalflowsumy >= (u16half)){
                opticalflowsumy -= u16;
            }
            if(11==flag_currentPage)
            {
//                addserialSaveAndApp("OpticalFlow_Data: " +
//                                    getopticalflowspeedx() + " " +
//                                    getopticalflowspeedy() + " " +
//                                    getopticalflowsumx() + " " +
//                                    getopticalflowsumy() + " ");
            }
        }
        else if(receivedata.mid(28,2) == "ff")
        {
            //用户自定数据
            bool ok = false;
            mag_user1 = (receivedata.mid(4,4).toInt(&ok, 16));
            if(mag_user1 >= 32768){
                mag_user1 -= 65536;
            }
            mag_user2 = (receivedata.mid(8,4).toInt(&ok, 16));
            if(mag_user2 >= 32768){
                mag_user2 -= 65536;
            }
            mag_user3 = (receivedata.mid(12,4).toInt(&ok, 16));
            if(mag_user3 >= 32768){
                mag_user3 -= 65536;
            }
            mag_user4 = (receivedata.mid(16,4).toInt(&ok, 16));
            if(mag_user4 >= 32768){
                mag_user4 -= 65536;
            }
            mag_user5 = (receivedata.mid(20,4).toInt(&ok, 16));
            if(mag_user5 >= 32768){
                mag_user5 -= 65536;
            }
            mag_user6 = (receivedata.mid(24,4).toInt(&ok, 16));
            if(mag_user6 >= 32768){
                mag_user6 -= 65536;
            }
        }
//        std::cout<<" receivedata" + receivedata.toStdString()<<std::endl;
        m_receivedata= receivedata;//将某次收到的数据进行累加，因为如果不累加的话每次有readyread就会触发此函数，会重置m_receivedata，覆盖之前收到的数据
//        if(receivedata.length() > 36){
//            receivedata = receivedata.mid(0, 36);
//        }
//        addSerialDataAll("Rx:" + receivedata);
        emit receivedataChanged();//发送消息触发receivedata()，更新当前收到的数据显示receivedata

        qint64 testreadnumber=data.length();//接收数据字节数统计

        c_receivenumber=c_receivenumber+testreadnumber;

        setreceivenumber(QString ::number(c_receivenumber));//更新接收的数据字节总数
    }



}

void SerialTest::setreceivenumber(QString receivenumber)//更新接收的数据字节总数
{
    m_receivenumber=receivenumber;
    emit receivenumberChanged();;
}

QString SerialTest::receivenumber()//响应receivenumberChanged()消息
{
    return m_receivenumber;
}

QString SerialTest::receiveMagCorner()//
{
    std::cout<<"corner str:" + mag_cornerStr.toStdString()<<std::endl;
    return mag_cornerStr;
}

void SerialTest::setMagCornerStr(QString cornerStr)//
{
    mag_cornerStr = cornerStr;

//    emit receiveMagCornerChanged();

}

QString SerialTest::getMagCornerStr()
{
    return mag_cornerStr;
}

qint64 SerialTest::getMagCorner()
{
    return mag_corner;
}

QString SerialTest::getMagX()
{
    return QString::number(mag_x);
}

QString SerialTest::getMagY()
{
    return QString::number(mag_y);
}

QString SerialTest::getMagZ()
{
    return QString::number(mag_z);
}

qint64 SerialTest::getMagUser1()
{
    return mag_user1;
}
qint64 SerialTest::getMagUser2()
{
    return mag_user2;
}
qint64 SerialTest::getMagUser3()
{
    return mag_user3;
}
qint64 SerialTest::getMagUser4()
{
    return mag_user4;
}
qint64 SerialTest::getMagUser5()
{
    return mag_user5;
}
qint64 SerialTest::getMagUser6()
{
    return mag_user6;
}


QString SerialTest::receivedata()//qml读取receivedata值的时候就会触发此函数,或者emit receivedataChanged()更新当前收到的数据显示时触发
{
    return m_receivedata;
}
void SerialTest::setreceivedata(QString receivedata)//其任务已被receive from函数完成，但是在清空数据时用到这个函数
{
    m_receivedata=receivedata;
    emit receivedataChanged();
}

QString SerialTest::getSerialDataAll()
{
    //std::cout<<"123:" + m_serialdataall.toStdString()<<std::endl;

    return m_serialdataall;
}
void SerialTest::addSerialDataAll(QString data)
{
//    qDebug() << m_serialdataall.size();
    if(m_serialdataall.size() > 3000)
    {
        m_serialdataall.remove(0, data.size()+2);
    }
    m_serialdataall.append(data + '\n');

    //emit receivedataChanged();
}
void SerialTest::clearSerialDataAll(void)
{
    m_serialdataall.clear();
}

QString SerialTest::getserialSaveAndApp()
{
    return m_serialSaveAndApp;
}
void SerialTest::addserialSaveAndApp(QString data)
{
    m_serialSaveAndApp.append(data + '\n');
    //emit receivedataChanged();
}
void SerialTest::clearserialSaveAndApp(void)
{
    m_serialSaveAndApp.clear();
}

bool SerialTest::getsettingAddrFlag(void){
    return settingAddrFlag;
}

void SerialTest::setsettingAddrFlag(bool trueorfalse){
    settingAddrFlag = trueorfalse;
}

QString SerialTest::getaddr1(void){
    return QString::number(addr1);
}

QString SerialTest::getaddr2(void){
    return QString::number(addr2);
}

QString SerialTest::getaddr3(void){
    return QString::number(addr3);
}

QString SerialTest::getaddrch(void){
    return QString::number(addrch);
}


qreal SerialTest::getQpointFX(QPointF pointf){
    return pointf.x();
}

qreal SerialTest::getQpointFY(QPointF pointf){
    return pointf.y();
}

QString SerialTest::randomNumStr(int min, int max, bool setseed){
//    QTime t= QTime::currentTime();
    if(setseed)
    {
        srand( (unsigned)time( 0 ) );
    }
//    sleep(200);
//    qsrand(t.msec()+t.second()*1000);
    int Range = max - min;
//    srand((unsigned int)time(NULL));
    int randa = rand();
    return QString::number((randa % Range) + min);
}

bool SerialTest::getserialOpenFlag(void){
    return serialOpenFlag;
}

bool SerialTest::getserialDrawClearFlagMag(void){
    return serialDrawClearFlagMag;
}

void SerialTest::setserialDrawClearFlagMag(bool trueOrFalse){
    serialDrawClearFlagMag = trueOrFalse;
}

bool SerialTest::getserialDrawClearFlagIMU(void){
    return serialDrawClearFlagIMU;
}

void SerialTest::setserialDrawClearFlagIMU(bool trueOrFalse){
    serialDrawClearFlagIMU = trueOrFalse;
}

bool SerialTest::getserialDrawClearFlagDrone(void){
    return serialDrawClearFlagDrone;
}

void SerialTest::setserialDrawClearFlagDrone(bool trueOrFalse){
    serialDrawClearFlagDrone = trueOrFalse;
}

bool SerialTest::getserialDrawClearFlagBaro(void){
    return serialDrawClearFlagBaro;
}

void SerialTest::setserialDrawClearFlagBaro(bool trueOrFalse){
    serialDrawClearFlagBaro = trueOrFalse;
}

QString SerialTest::getCurrentLon(void){
    return QString::number(currentLon, 'f', 7);
}

QString SerialTest::getCurrentLat(void){
    return QString::number(currentLat, 'f', 7);
}

QString SerialTest::getCurrentNS(void){
    return QString::number(currentNorthSpeed);
}

QString SerialTest::getCurrentES(void){
    return QString::number(currentEastSpeed);
}

QString SerialTest::getCurrentSN(void){
    return QString::number(currentSatelliteNum);
}

QString SerialTest::getCurrentHDOP(void){
    return QString::number(currentHdop);
}

QString SerialTest::getAnglePitch(void){
    return QString::number(anglepitch, 'f', 1);
}

QString SerialTest::getAngleRoll(void){
    return QString::number(angleroll, 'f', 1);
}

QString SerialTest::getAngleYaw(void){
//    qDebug() << angleyaw/10.0;
    return QString::number(angleyaw, 'f', 1);
}

QString SerialTest::getAccAngleX(void){
    return QString::number(Angle_Acc_X, 'f', 1);
}

QString SerialTest::getAccAngleY(void){
    return QString::number(Angle_Acc_Y, 'f', 1);
}


QString SerialTest::getAccX(void){
    return QString::number((double)ACCX/512, 'f', 4);
}
QString SerialTest::getAccY(void){
    return QString::number((double)ACCY/512, 'f', 4);
}
QString SerialTest::getAccZ(void){
    return QString::number((double)ACCZ/512, 'f', 4);
}

QString SerialTest::getHeigth_Ultrasonic_lowpass(void){
    return QString::number(Heigth_Ultrasonic_lowpass);
}
QString SerialTest::getHeigth_Ultrasonic_nofliter(void){
    return QString::number(Heigth_Ultrasonic_nofliter);
}

QString SerialTest::getHeigth_Ultrasonic_time(void){
    return QString::number(Heigth_Ultrasonic_time, 'f', 3);
}

QString SerialTest::getHeigth_Ultrasonic_alpha(void){
    return QString::number(Heigth_Ultrasonic_alpha, 'f', 4);
}

QString SerialTest::getGgyrox(void){
    if(7==flag_currentPage)
    {
        return QString::number(GYROX* 0.0001, 'f', 4);
    }
    else {
        return QString::number(GYROX* 0.061035, 'f', 4);
    }
}

QString SerialTest::getGgyroy(void){
    if(7==flag_currentPage)
    {
        return QString::number(GYROY* 0.0001, 'f', 4);
    }
    else {
        return QString::number(GYROY* 0.061035, 'f', 4);
    }
}

QString SerialTest::getGgyroz(void){
    if(7==flag_currentPage)
    {
        return QString::number(GYROZ* 0.0001, 'f', 4);
    }
    else {
        return QString::number(GYROZ* 0.061035, 'f', 4);
    }
}


double SerialTest::getAnglePitchNum(void){
//    qDebug() << angleyaw/10.0;
    return (anglepitch);
}

double SerialTest::getAngleRollNum(void){
//    qDebug() << angleyaw/10.0;
    return (angleroll);
}

double SerialTest::getAngleYawNum(void){
//    qDebug() << angleyaw/10.0;
    return (angleyaw);
}

QString SerialTest::getAltitude(void){
    return QString::number(altitude, 'f', 1);
}

double SerialTest::getAltitudeNum(void){
    return (altitude);
}

double SerialTest::getOffsetX(void){
    return (100 * sin(angleroll/180*3.141592654));
//    return (100 * sin(300.0/1800*3.141592654));
}

double SerialTest::getOffsetY(void){
//    qDebug() << sin(3.141592654/2);
    return (100 * sin(anglepitch/180*3.141592654));
//    return (100 * sin(300.0/1800*3.141592654));
}


double SerialTest::getOffsetX_Acc(void){
    return (100 * sin(Angle_Acc_X/180*3.141592654));
//    return (100 * sin(300.0/1800*3.141592654));
}

double SerialTest::getOffsetY_Acc(void){
//    qDebug() << sin(3.141592654/2);
    return (100 * sin(Angle_Acc_Y/180*3.141592654));
//    return (100 * sin(300.0/1800*3.141592654));
}

void SerialTest::setSerialSendRequest(bool TrueOrFalse)
{
    serialSendRequest = TrueOrFalse;
}

QString SerialTest::getpressureRaw(void){
    return QString::number(pressureRaw);
}

QString SerialTest::getpressureFilter(void){
    return QString::number(pressureFilter);
}

QString SerialTest::getSlideDepth(void){
    return QString::number(slideDepth);
}
QString SerialTest::getpressureHeight(void){
    return QString::number(pressureHeight);
}
//QString SerialTest::getTemperature(void){
//    return QString::number(temperature, 'f', 1);
//}

int SerialTest::getpressureRawNum(void){
    return (pressureRaw);
}

int SerialTest::getpressureFilterNum(void){
    return (pressureFilter);
}

//double SerialTest::getTemperatureNum(void){
//    return (temperature);
//}

QString SerialTest::getopticalflowspeedx(void){
    return QString::number(opticalflowspeedx);
}

QString SerialTest::getopticalflowspeedy(void){
    return QString::number(opticalflowspeedy);
}

QString SerialTest::getopticalflowsumx(void){
    return QString::number(opticalflowsumx);
}

QString SerialTest::getopticalflowsumy(void){
    return QString::number(opticalflowsumy);
}

void SerialTest::saveGPSData(void)
{
    if(3==flag_currentPage)
    {
        addserialSaveAndApp("GPS_Data: " +
                        getCurrentLon() + " " +
                        getCurrentLat() + " ");
    }
}

void SerialTest::clearTIMESet(void){
    TIMEINT = 0;
}


////////////////////5.关闭端口//////////////////////////////
void SerialTest::closePort()//由按钮出发
{
    serialtest->close();
    std::cout<<"close port sucess"<<std::endl;
    serialOpenFlag = false;
//    threadSerialPort->quit();
//    timerSend.stop();
}



////////////////////6.清空计数//////////////////////////////
void SerialTest::clearnumber()//由按钮出发
{
    c_sendnumber=0;
    c_receivenumber=0;
}

SerialTest::~SerialTest()
{
//    serialtest->close();
//    serialtest->deleteLater();
//    threadSerialPort->exit();
//    threadSerialPort->wait();
//    threadSerialPort->deleteLater();
}
