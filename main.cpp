#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Parser.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<Parser>("Parser", 1, 0, "Parser");
    QQmlApplicationEngine engine;
    Parser parser;
    engine.rootContext()->setContextProperty("parser", new Parser());
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
