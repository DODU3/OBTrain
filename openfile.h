#ifndef OPENFILE_H
#define OPENFILE_H

#include <QJsonDocument>
#include <QJsonObject>
#include <QObject>
#include <QDebug>
#include <QTime>
#include <iostream>
#include <QQuickItem>

class Openfile : public QObject
{
    Q_OBJECT

    public:
    explicit Openfile(QObject *parent = 0);
    Q_INVOKABLE QString  readfile(QString pathstr);
    Q_INVOKABLE void savefile(QString path,QString content);
     Q_INVOKABLE QString getfilename();
    Q_INVOKABLE void setfilename(QString name);
    signals:
    void readxmlsignal(QString message);
    private:
    QString Last_FileName;
};

#endif // OPENFILE_H
