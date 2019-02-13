#include "portmodel.h"
#include "qdebug.h"
#include<iostream>

portModel::portModel(QObject *parent) :
    QObject(parent)
{
}

portModel::portModel(const QStringList &list, int count, QObject *parent) :
    QObject(parent), m_comboList(list), m_count(count)
{

}

const QStringList portModel::comboList()
{
    return m_comboList;
}

void portModel::setComboList(const QStringList &comboList)
{
    if (m_comboList != comboList)
    {
        m_comboList = comboList;
        emit comboListChanged();
    }

}

int portModel::count()
{
    return m_count;
}

void portModel::setCount(int cnt)
{
    if (cnt != m_count)
    {
        m_count = cnt;
        emit countChanged();
    }
}

QString portModel::getElement(int index)
{
    return m_comboList.at(index);
}

void portModel::addElement(const QString &element)
{
    m_comboList.append(element);
    emit comboListChanged();
    setCount(m_comboList.count());
    emit countChanged();

    for (int i = 0; i<m_count; i++)
    {
        qDebug() << m_comboList.at(i);
    }
}

void portModel::clearElement()
{
    m_comboList.clear();
    emit comboListChanged();
}

void portModel::removeElement(int index)
{
    if (index < m_comboList.count())
    {
        m_comboList.removeAt(index);
        emit comboListChanged();
        setCount(m_comboList.count());
        emit countChanged();
    }

    for (int i = 0; i<m_count; i++)
    {
        qDebug() << m_comboList.at(i);
    }
}
