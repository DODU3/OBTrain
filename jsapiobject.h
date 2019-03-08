#ifndef JSAPIOBJECT_H
#define JSAPIOBJECT_H

#include <QObject>
#include <QtWebChannel>
#include<iostream>

class jsApiObject : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString Log READ receiveLog WRITE setLog NOTIFY LogChanged);
    Q_PROPERTY(QString Code READ receiveCode WRITE setCode NOTIFY CodeChanged);
public:
    explicit jsApiObject(QObject *parent = nullptr);

    Q_INVOKABLE void setCanStartWork();
    Q_INVOKABLE void generalLog(QString someLog);
    Q_INVOKABLE void generalCode(QString someCode);
    Q_INVOKABLE void runBlockly(QString code);
    Q_INVOKABLE void saveBlockly(QString name, QString txt);
    Q_INVOKABLE void loadUrl(QString url);

    Q_INVOKABLE QString receiveLog();
    void setLog(QString log);

    Q_INVOKABLE QString receiveCode();
    void setCode(QString code);

    Q_INVOKABLE void jsOnstart();

signals:
    Q_INVOKABLE void onStart();
    Q_INVOKABLE void onSave(QString name);
    void onOpen(QString str);
    Q_INVOKABLE void onClear();
    void onSetLang(QString str);
    void onBackup(QString str);
    void onUpdateHWVersion(QString str);

    void LogChanged();
    void CodeChanged();

public slots:

private:
    QString m_Log;
    QString m_Code;
};

#endif // JSAPIOBJECT_H
