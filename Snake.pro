QT += qml quickcontrols2

CONFIG += c++11

SOURCES += main.cpp \
    buttonstyle.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =
# QT_QUICK_CONTROLS_STYLE=/home/andrzeju/Documents/Programming/Snake/controls/ <- add this variable to apply styles

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    buttonstyle.h
