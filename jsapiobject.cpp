#include "jsapiobject.h"

jsApiObject::jsApiObject(QObject *parent) :
    QObject(parent),
    m_Log(""),
    m_Code("Initializa...")
{

}

void jsApiObject::setCanStartWork()
{

}

void jsApiObject::generalLog(QString someLog)
{
    setLog(someLog);
}

void jsApiObject::generalCode(QString someCode)
{
    setCode(someCode);
}

void jsApiObject::runBlockly(QString code)
{
    qDebug()<<"runcode:"<<code;
    m_Code = code;
    emit CodeChanged();
}
/*
void jsApiObject::saveBlockly(QString name, QString txt)
{

}
*/
void jsApiObject::loadUrl(QString url)
{

}

QString jsApiObject::receiveLog()
{
    return m_Log;
}

void jsApiObject::setLog(QString log)
{
    m_Log = log;
    emit LogChanged();
}

QString jsApiObject::receiveCode()
{
    return  m_Code;
}

void jsApiObject::setCode(QString code)
{
    m_Code = code;
    emit CodeChanged();
}

void jsApiObject::jsOnstart()
{
    emit onStart();
}
