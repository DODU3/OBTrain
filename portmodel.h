#ifndef PORTMODEL_H
#define PORTMODEL_H

#include <QObject>
#include <QStringList>
#include<iostream>


class portModel: public QObject
{
    Q_OBJECT

    Q_PROPERTY(QStringList comboList READ comboList WRITE setComboList NOTIFY comboListChanged)
    Q_PROPERTY(int count READ count WRITE setCount NOTIFY countChanged)

public:
    portModel(QObject *parent = 0);
    portModel(const QStringList &list,int count, QObject *parent = 0);

    const QStringList comboList();
    Q_INVOKABLE void setComboList(const QStringList &comboList);

    int count();
    void setCount(int cnt);

    Q_INVOKABLE void addElement(const QString &element);
    Q_INVOKABLE void removeElement(int index);
    Q_INVOKABLE void clearElement();
    Q_INVOKABLE QString getElement(int index);

signals:

    void comboListChanged();
    void countChanged();

public slots:


private:

    QStringList m_comboList;
    int         m_count;
};

#endif // PORTMODEL_H
