#ifndef SERIALTEST_H
#define SERIALTEST_H
#include <QObject>
#include <QtSerialPort/QSerialPort>
#include <QQmlListProperty>
#include <QQmlComponent>
#include <QQmlApplicationEngine>
#include "portmodel.h"
#include<iostream>
#include <QPointF>


class SerialTest : public QSerialPort
{
    Q_OBJECT
    Q_PROPERTY(QString receivedata READ receivedata WRITE setreceivedata NOTIFY receivedataChanged)//从串口收到的数据
    Q_PROPERTY(QString sendnumber READ sendnumber WRITE setsendnumber NOTIFY sendnumberChanged)//发送的数据字节统计
    Q_PROPERTY(QString receivenumber READ receivenumber WRITE setreceivenumber NOTIFY receivenumberChanged)//接收的数据字节统计
    Q_PROPERTY(QStringList m_portInfo  READ receivePort)//接收的数据字节统计
    Q_PROPERTY(QString receiveMagCorner  READ receiveMagCorner WRITE setMagCornerStr NOTIFY receiveMagCornerChanged)//接收的数据字节统计
//    Q_PROPERTY(quint8 data_send MEMBER m_data_send)
//    Q_PROPERTY(quint8* data_send  READ readdata_send WRITE setdata_send NOTIFY data_sendChanged)//发送的数据

public:
    struct Settings {//端口设定结构体
        QString name;
        qint32 baudRate;
        QSerialPort::DataBits dataBits;
        QSerialPort::Parity parity;
        QSerialPort::StopBits stopBits;
        QSerialPort::FlowControl flowControl;
    };
    SerialTest(QSerialPort *parent = 0);
    ~SerialTest();

    Q_INVOKABLE QStringList receivePort();

    QString receivedata(void);
    void setreceivedata(QString receivedata);



    QString sendnumber();
    void setsendnumber(QString sendnumber);

    QString receivenumber();
    void setreceivenumber(QString receivenumber);


    QString receiveMagCorner();
    Q_INVOKABLE void setMagCornerStr(QString cornerStr);
    Q_INVOKABLE QString getMagCornerStr();

    Q_INVOKABLE qint64 getMagCorner();
    Q_INVOKABLE QString getMagX();
    Q_INVOKABLE QString getMagY();
    Q_INVOKABLE QString getMagZ();
    Q_INVOKABLE qint64 getMagUser1();
    Q_INVOKABLE qint64 getMagUser2();
    Q_INVOKABLE qint64 getMagUser3();
    Q_INVOKABLE qint64 getMagUser4();
    Q_INVOKABLE qint64 getMagUser5();
    Q_INVOKABLE qint64 getMagUser6();

    Q_INVOKABLE void openAndSetPort(QString PortName,int BaudRateIndex,int DatabitsIndex,int ParityIndex,int StopbitsIndex,int FlowcontrolIndex);//打开并设定端口;
    Q_INVOKABLE void closePort();//关闭端口;
    Q_INVOKABLE void sendto(QString sendmessage);//发送数据;
    Q_INVOKABLE void sendCMD(QString cmd, QString data1, QString data2);
    Q_INVOKABLE void clearnumber();//数据统计清零;
    Q_INVOKABLE void getPortInfo();


    Q_INVOKABLE void setMagCorner(int yawValue,int rollValue);
    Q_INVOKABLE void DroneFrame_MakeAndSerialSend(quint8 Realdata[4],quint8 Realstatus[2],quint8 Command,quint8 CommandData[8],quint8 Heartbeat);//构建和发送无人机串口通信发送帧
    Q_INVOKABLE void setRFaddr(QString addr1,QString addr2,QString addr3,QString channel);
    Q_INVOKABLE void setLabAngle(QString angle_Roll,QString angle_Yaw);
    Q_INVOKABLE void setCurrentPage(int current_page);
    Q_INVOKABLE int getCurrentPage(void);
    Q_INVOKABLE void setUltrasonicLowpassfliter(QString value_freq,QString value_confficent);

    Q_INVOKABLE bool getsettingAddrFlag(void);
    Q_INVOKABLE void setsettingAddrFlag(bool trueorfalse);
    Q_INVOKABLE QString getaddr1(void);
    Q_INVOKABLE QString getaddr2(void);
    Q_INVOKABLE QString getaddr3(void);
    Q_INVOKABLE QString getaddrch(void);
    Q_INVOKABLE QString randomNumStr(int min, int max, bool setseed);

    Q_INVOKABLE QString getSerialDataAll(void);
    Q_INVOKABLE void addSerialDataAll(QString receivedata);
    Q_INVOKABLE void clearSerialDataAll(void);

    Q_INVOKABLE QString getserialSaveAndApp(void);
    Q_INVOKABLE void addserialSaveAndApp(QString receivedata);
    Q_INVOKABLE void clearserialSaveAndApp(void);

    Q_INVOKABLE qreal getQpointFX(QPointF pointf);
    Q_INVOKABLE qreal getQpointFY(QPointF pointf);
	
    Q_INVOKABLE bool getserialOpenFlag(void);
    Q_INVOKABLE bool getserialDrawClearFlagMag(void);
    Q_INVOKABLE void setserialDrawClearFlagMag(bool trueOrFalse);
    Q_INVOKABLE bool getserialDrawClearFlagIMU(void);
    Q_INVOKABLE void setserialDrawClearFlagIMU(bool trueOrFalse);
    Q_INVOKABLE bool getserialDrawClearFlagDrone(void);
    Q_INVOKABLE void setserialDrawClearFlagDrone(bool trueOrFalse);
    Q_INVOKABLE bool getserialDrawClearFlagBaro(void);
    Q_INVOKABLE void setserialDrawClearFlagBaro(bool trueOrFalse);


    Q_INVOKABLE QString getCurrentLon(void);
    Q_INVOKABLE QString getCurrentLat(void);
    Q_INVOKABLE QString getCurrentNS(void);
    Q_INVOKABLE QString getCurrentES(void);
    Q_INVOKABLE QString getCurrentSN(void);
    Q_INVOKABLE QString getCurrentHDOP(void);

    Q_INVOKABLE QString getAnglePitch(void);
    Q_INVOKABLE QString getAngleRoll(void);
    Q_INVOKABLE QString getAngleYaw(void);
    Q_INVOKABLE QString getGgyrox(void);
    Q_INVOKABLE QString getGgyroy(void);
    Q_INVOKABLE QString getGgyroz(void);
    Q_INVOKABLE double getAnglePitchNum(void);
    Q_INVOKABLE double getAngleRollNum(void);
    Q_INVOKABLE double getAngleYawNum(void);

    Q_INVOKABLE QString getAccX(void);
    Q_INVOKABLE QString getAccY(void);
    Q_INVOKABLE QString getAccZ(void);
    Q_INVOKABLE QString getAccAngleX(void);
    Q_INVOKABLE QString getAccAngleY(void);
    Q_INVOKABLE double getOffsetX_Acc(void);
    Q_INVOKABLE double getOffsetY_Acc(void);

    Q_INVOKABLE QString getHeigth_Ultrasonic_lowpass(void);
    Q_INVOKABLE QString getHeigth_Ultrasonic_nofliter(void);
    Q_INVOKABLE QString getHeigth_Ultrasonic_time(void);
    Q_INVOKABLE QString getHeigth_Ultrasonic_alpha(void);


    Q_INVOKABLE QString getAltitude(void);
    Q_INVOKABLE double getAltitudeNum(void);

    Q_INVOKABLE double getOffsetX(void);
    Q_INVOKABLE double getOffsetY(void);

    Q_INVOKABLE void setSerialSendRequest(bool TrueOrFalse);

    Q_INVOKABLE QString getpressureRaw(void);
    Q_INVOKABLE QString getpressureFilter(void);
    Q_INVOKABLE QString getSlideDepth(void);
    Q_INVOKABLE QString getpressureHeight(void);
//    Q_INVOKABLE QString getTemperature(void);
    Q_INVOKABLE int getpressureRawNum(void);
    Q_INVOKABLE int getpressureFilterNum(void);
//    Q_INVOKABLE double getTemperatureNum(void);

    Q_INVOKABLE QString getopticalflowspeedx(void);
    Q_INVOKABLE QString getopticalflowspeedy(void);
    Q_INVOKABLE QString getopticalflowsumx(void);
    Q_INVOKABLE QString getopticalflowsumy(void);


    Q_INVOKABLE void setPlatformYawAngle(int yawValue,int yawRateValue);
    Q_INVOKABLE void setPlatformRollAngle(int rollValue,int rollRateValue);

    Q_INVOKABLE void setBaroSlideDepth(int slidedepth);

    Q_INVOKABLE void saveGPSData(void);

    Q_INVOKABLE void setOptDistance(int distance);


    Q_INVOKABLE void clearTIMESet(void);

signals:
    void receivedataChanged();

    void receivenumberChanged();
    void sendnumberChanged();

    void receiveMagCornerChanged();


public slots:
    void receivefrom();//信号（收到数据激发的信号）响应函数
    void timersendtimeout();
private:
    QString m_receivedata;
    QString m_sendnumber,m_receivenumber;
    QStringList   m_portInfo;

//    quint8 m_data_send[18]={0,0,0};
//    quint8 m_data_send=0;
};

#endif // SERIALTEST_H
