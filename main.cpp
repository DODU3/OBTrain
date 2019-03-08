#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qqmlengine.h>
#include <qqmlcontext.h>
#include <qqml.h>
#include <QStringList>
#include <qtwebengineglobal.h>
#include <QtWebView>
#include <QWebSocketServer>
#include <QCoreApplication>


#include "serialtest.h"
#include "portmodel.h"
#include "systemopen.h"
#include "datafresh.h"
#include <QmlFFMPEG/XVideo.h>
#include "websockettransport.h"
#include "jsapiobject.h"


int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication  app(argc, argv);


    QtWebEngine::initialize();

    qmlRegisterType<XVideo>("XVideo", 1, 0, "XVideo");

    qmlRegisterType<SerialTest>("RegisterMyType", 1, 0, "MyClassType");

    qmlRegisterType<systemOpen>("RegisterSystemOpen", 1, 0, "MySystemOpen");

    qmlRegisterType<dataFresh>("RegisterDataFresh", 1, 0, "MyDataFresh");

    qmlRegisterType<WebSocketTransport>("io.decovar.WebSocketTransport", 1, 0, "WebSocketTransport");

    qmlRegisterType<jsApiObject>("RegisterJsApiObject", 1, 0, "MyJsApiObject");

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
