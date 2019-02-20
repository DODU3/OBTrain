#ifndef DATAFRESH_H
#define DATAFRESH_H
#include <QObject>
#include <QApplication>

class dataFresh : public QObject
{
    Q_OBJECT
public:
    dataFresh();

    Q_INVOKABLE void freshBaseData();
    Q_INVOKABLE void buttonSaveClick(QString qs);
    Q_INVOKABLE void buttonStartClick();
    Q_PROPERTY(bool serialDataPrintFlag  READ getserialDataPrintFlag WRITE setserialDataPrintFlag)


    bool getserialDataPrintFlag();
    void setserialDataPrintFlag(bool flag);

private:
    bool serialDataPrintFlag = false;

};

#endif // DATAFRESH_H
