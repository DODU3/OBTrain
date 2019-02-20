#ifndef SYSTEMOPEN_H
#define SYSTEMOPEN_H
#include <QObject>

class systemOpen : public QObject
{
    Q_OBJECT
public:
    systemOpen();

    Q_INVOKABLE void openProject();
    Q_INVOKABLE void openMagPresent();
    Q_INVOKABLE void openMagFlow();
    Q_INVOKABLE void openFaceDet();
    Q_INVOKABLE void openFaceRec();
    Q_INVOKABLE void openKCF();
    Q_INVOKABLE void openHuman();
    Q_INVOKABLE void openPosture();
};

#endif // SYSTEMOPEN_H
