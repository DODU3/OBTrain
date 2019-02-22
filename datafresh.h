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
    Q_INVOKABLE void buttonOpenFolderClick();
//    Q_INVOKABLE QString getSaveFileName(void);

    Q_PROPERTY(bool serialDataPrintFlag  READ getserialDataPrintFlag WRITE setserialDataPrintFlag)
    Q_PROPERTY(QString saveFileName  READ getSaveFileName NOTIFY saveFileNameChanged)


    bool getserialDataPrintFlag();
    void setserialDataPrintFlag(bool flag);
    QString getSaveFileName(void);

signals:
    void saveFileNameChanged();

private:
    bool serialDataPrintFlag = false;

    QString savefilename;
};

#endif // DATAFRESH_H
