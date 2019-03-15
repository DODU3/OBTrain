#include "openfile.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QObject>
#include <QDebug>
#include <QTime>
#include <iostream>
#include <QQuickItem>
#include <QFile>
#include <QFileDevice>
#include <QTextStream>
#include <QtEvents>



Openfile::Openfile(QObject *parent) : QObject(parent)
{

}

Q_INVOKABLE QString Openfile::getfilename()
{
    return Last_FileName;
}
Q_INVOKABLE void Openfile::setfilename(QString name)
{
    Last_FileName= name;
}

Q_INVOKABLE QString  Openfile::readfile(QString pathstr)
{
    QString displayString;
  //  QFile file("C:/Users/lian/Desktop/test.blockly");
    QFile file(pathstr);

    if(!file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        qDebug()<<"Can't open the file!"<<endl;
    }
    while(!file.atEnd())
    {
        QByteArray line = file.readLine();
        QString str(line);
        qDebug()<< str;
        displayString.append(str);
    }

        return displayString;
    //发射信号
   //  emit readxmlsignal(displayString);
}

Q_INVOKABLE void Openfile::savefile(QString path,QString content)
{
  //  if(Flag_IsNew)                  //如果新文件标记位为1，则弹出保存文件对话框
    {

        QString displayString;
      //  QFile file("C:/Users/lian/Desktop/test.blockly");
        QFile file(path);

        if(!file.open(QIODevice::WriteOnly | QIODevice::Text))
        {
            qDebug()<<"Can't open the file!"<<endl;
        }
        QTextStream out(&file);
        out<<content<<endl;
        out.flush();
        file.close();
    }

}

