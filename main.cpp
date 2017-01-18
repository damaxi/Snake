#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QProcessEnvironment>
#include <QQuickStyle>
#include <QDebug>
#include "buttonstyle.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    //QProcessEnvironment environment;
    //environment.insert(QLatin1String("QT_QUICK_CONTROLS_STYLE"), QLatin1String("/home/andrzeju/Documents/Programming/Snake/controls/"));
    //QQuickStyle::setStyle("Dupa");
    qDebug() << QQuickStyle::path();

    QQmlApplicationEngine engine;
    qmlRegisterUncreatableType<ButtonStyle>("ButtonStyle", 1, 0, "ButtonStyle", "ButtonStyle is an attacked property");
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
