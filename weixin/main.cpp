#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>

#include "textballoon.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<TextBalloon>("TextBalloon", 1, 0, "TextBalloon");

    QQuickView view;
    view.setSource(QUrl(QStringLiteral("qrc:///Main.qml")));
    view.setResizeMode(QQuickView::SizeRootObjectToView);

    view.show();
    return app.exec();
}

