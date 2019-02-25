#ifndef SERIALTEST_H
#define SERIALTEST_H
#include <QObject>
#include <QtSerialPort/QSerialPort>
#include <QQmlListProperty>
#include <QQmlComponent>
#include <QQmlApplicationEngine>
#include "portmodel.h"
#include<iostream>



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
    Q_INVOKABLE qint64 getMagX();
    Q_INVOKABLE qint64 getMagY();
    Q_INVOKABLE qint64 getMagZ();
    Q_INVOKABLE qint64 getMagUser1();
    Q_INVOKABLE qint64 getMagUser2();
    Q_INVOKABLE qint64 getMagUser3();
    Q_INVOKABLE qint64 getMagUser4();
    Q_INVOKABLE qint64 getMagUser5();
    Q_INVOKABLE qint64 getMagUser6();

    Q_INVOKABLE void openAndSetPort(QString PortName,int BaudRateIndex,int DatabitsIndex,int ParityIndex,int StopbitsIndex,int FlowcontrolIndex);//打开并设定端口;
    Q_INVOKABLE void closePort();//关闭端口;
    Q_INVOKABLE void sendto(QString sendmessage);//发送数据;
    Q_INVOKABLE void clearnumber();//数据统计清零;
    Q_INVOKABLE void getPortInfo();


    Q_INVOKABLE void setMagCorner(int yawValue,int rollValue);
    Q_INVOKABLE void DroneFrame_MakeAndSerialSend(quint8 Realdata[4],quint8 Realstatus[2],quint8 Command,quint8 CommandData[8],quint8 Heartbeat);//构建和发送无人机串口通信发送帧
    Q_INVOKABLE void setRFaddr(QString addr1,QString addr2,QString addr3,QString channel);

    Q_INVOKABLE bool getsettingAddrFlag(void);
    Q_INVOKABLE void setsettingAddrFlag(bool trueorfalse);
    Q_INVOKABLE QString getaddr1(void);
    Q_INVOKABLE QString getaddr2(void);
    Q_INVOKABLE QString getaddr3(void);
    Q_INVOKABLE QString getaddrch(void);
    Q_INVOKABLE QString randomNumStr(int min, int max);

    Q_INVOKABLE QString getSerialDataAll(void);
    Q_INVOKABLE void addSerialDataAll(QString receivedata);
    Q_INVOKABLE void clearSerialDataAll(void);

    Q_INVOKABLE QString getserialSaveAndApp(void);
    Q_INVOKABLE void addserialSaveAndApp(QString receivedata);
    Q_INVOKABLE void clearserialSaveAndApp(void);

signals:
    void receivedataChanged();

    void receivenumberChanged();
    void sendnumberChanged();

    void receiveMagCornerChanged();


public slots:
    void receivefrom();//信号（收到数据激发的信号）响应函数
private:
    QString m_receivedata;
    QString m_sendnumber,m_receivenumber;
    QStringList   m_portInfo;

//    quint8 m_data_send[18]={0,0,0};
//    quint8 m_data_send=0;
};

#endif // SERIALTEST_H
