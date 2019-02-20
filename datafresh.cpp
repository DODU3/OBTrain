#include "datafresh.h"
#include <QApplication>
#include <QDebug>
#include <QFile>
#include <QTextStream>
//#include <Qdir>
#include <QMessageBox>
#include <QFileDialog>
#include <QQuickItem>
#include <QMetaObject>
#include <QCoreApplication>

#include <QDateTime>

#include <QQmlComponent>
#include <QQmlEngine>
#include <QQmlApplicationEngine>
#include <QQmlProperty>

dataFresh::dataFresh()
{

}

void dataFresh::freshBaseData()
{

}

void dataFresh::buttonSaveClick(QString qs)
{

    QDateTime currentTime = QDateTime::currentDateTime();
    QString qs_currenttime = currentTime.toString("hh_mm_ss");

    QString path = QCoreApplication::applicationDirPath();
    path.replace("/", "\\");
    //qDebug() << path;
    QString a = qs;
    a.replace(QString("\n"), QString("\r\n"));//windows only
//    qDebug() << a;
//    QString currentPath = QDir::currentPath();
//    qDebug() << currentPath;
//    QString filename = QFileDialog::getSaveFileName(this,
//                                                    tr("保存数据"),
//                                                    "",
//                                                    tr(".txt"));
    QFile file(path + "\\Content resource\\磁力计模组\\数据保存\\" + "data_" + qs_currenttime + ".txt");
    if(file.open(QIODevice::WriteOnly | QIODevice::Text))
    {
        QTextStream out(&file);
        out << a;
        file.close();
//        qDebug() << "save successfully!";
//        QMessageBox::information(NULL, "Information", "保存成功！");
    }
}

void dataFresh::buttonStartClick()
{
    QQmlApplicationEngine engine;
    QQmlComponent component(&engine, QUrl(QStringLiteral("qrc:/Sensor/DroneSensor/MagPage/MagDataApplicatePage.qml")));
    QObject *object = component.create();
    QObject *item = object->findChild<QObject*>("MagDateAppPageText");

//    qDebug() << QQmlProperty::read(object, "title");
//    qDebug() << QQmlProperty::read(item, "placeholderText");

    if(item){
        item->setProperty("Text", QString("sss"));
    }
    delete object;
}
bool dataFresh::getserialDataPrintFlag()
{
    return serialDataPrintFlag;
}

void dataFresh::setserialDataPrintFlag(bool flag)
{
    serialDataPrintFlag = flag;
}
