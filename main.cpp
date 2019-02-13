#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qqmlengine.h>
#include <qqmlcontext.h>
#include <qqml.h>
#include <QStringList>

#include "serialtest.h"
#include "portmodel.h"
#include "systemopen.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);



    qmlRegisterType<SerialTest>("RegisterMyType", 1, 0, "MyClassType");

    qmlRegisterType<systemOpen>("RegisterSystemOpen", 1, 0, "MySystemOpen");


    QQmlApplicationEngine engine;
    portModel combo;
    QQmlContext *ownContext = engine.rootContext();
    ownContext->setContextProperty("myModel", QVariant::fromValue(combo.comboList()));

    QQmlContext *classContext = engine.rootContext();
    classContext->setContextProperty("comboModel", &combo);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;



    return app.exec();
}
