QT += quick serialport qml multimedia multimediawidgets sensors charts widgets core gui network webview webengine websockets webchannel
CONFIG += c++11 big_resources

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

#include(deps/QmlVlc/QmlVlc.pri)
#include(deps/QmlFFMPEG/deployment.pri)

#INCLUDEPATH += deps

#INCLUDEPATH +=E:/vlc-3.0.6/sdk/include
#LIBS += E:/vlc-3.0.6/sdk/lib/libvlc.lib
#LIBS += E:/vlc-3.0.6/sdk/lib/libvlccore.lib

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    serialtest.cpp \
    portmodel.cpp \
    jsapiobject.cpp \
    datafresh.cpp \
    jsapiobject.cpp \
    main.cpp \
    portmodel.cpp \
    serialtest.cpp \
    systemopen.cpp \
    openfile.cpp

RESOURCES += \
    sensor.qrc \
    qml.qrc \
    module.qrc \
    drone.qrc


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    serialtest.h \
    portmodel.h \
    websockettransport.h \
    jsapiobject.h \
    datafresh.h \
    jsapiobject.h \
    portmodel.h \
    serialtest.h \
    systemopen.h \
    websockettransport.h \
    openfile.h

FORMS +=
