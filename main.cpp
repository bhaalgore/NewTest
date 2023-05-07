#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "G:\Qt\repos\NewTest\include\notify_model.h"
#include "G:\Qt\repos\NewTest\include\notification_entity.h"
#include <QQmlContext>
#include <QDebug>

int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    LogicPlugin::NotificationModel notificationModel;

    LogicPlugin::TypeManager::addType("test");
    auto myImpl = new LogicPlugin::NotificationEntity("Камера не доступна!", "Очень важная информация. Очень важная информация.", 2);

    notificationModel.addNotification(myImpl);
    auto myImpl1 = new LogicPlugin::NotificationEntity("Высокий уровень шума", "Очень важная информация. Очень важная информация.", 3);
    notificationModel.addNotification(myImpl1);
//    notificationModel.addNotification("Обнаружена цель в SportCenter", "Очень важная информация. Очень важная информация.", 0);
//    notificationModel.addNotification("Камера не доступна!", "Очень важная информация. Очень важная информация.", 1);
//    notificationModel.addNotification("Высокий уровень шума", "Очень важная информация. Очень важная информация.", 2);



    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("Notificationmodel", &notificationModel);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
