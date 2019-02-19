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
    Q_INVOKABLE void openFaceDBW();
};

#endif // SYSTEMOPEN_H
