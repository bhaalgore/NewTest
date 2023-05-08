#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "include/notify_model.h"
#include "include/notification_entity.h"
#include <QQmlContext>
#include <QDebug>
#include <QtQuick>
int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    LogicPlugin::NotificationModel notificationModel;
    int pos = 0;
    QQmlApplicationEngine engine;
    QQmlEngine Qengine;
    QObject::connect(&notificationModel, &QAbstractItemModel::rowsInserted, [&](const QModelIndex &parent, int first, int last) {
        for (int i = first; i <= last; ++i) {
            QQmlComponent component(&Qengine, QUrl(QStringLiteral("qrc:/NotificationWindow.qml")));
            QObject* object = component.create();
            if (object) {
                QQuickWindow* window = qobject_cast<QQuickWindow*>(object);
                if (window) {
                    window->setProperty("title", notificationModel.data(notificationModel.index(i, 0),
                                                                        LogicPlugin::NotificationModel::TitleRole));
                    window->setProperty("message", notificationModel.data(notificationModel.index(i, 0),
                                                                          LogicPlugin::NotificationModel::MessageRole));
                    window->setProperty("type", notificationModel.data(notificationModel.index(i, 0),
                                                                       LogicPlugin::NotificationModel::TypeRole));
                    window->setProperty("pos", QVariant::fromValue(pos));
                    pos+=85;
                    //window->setClearBeforeRendering(true);
                    //window->show();
                }
                else {
                    delete object;
                }
            }
        }
    });

    engine.rootContext()->setContextProperty("NotificationModel", &notificationModel);
    LogicPlugin::TypeManager::addType("test");
    auto myImpl = new LogicPlugin::NotificationEntity("test", "Очень важная информация. Очень важная информация.", 1);
    notificationModel.addNotification(myImpl);
    auto myImpl1 = new LogicPlugin::NotificationEntity("test", "Очень важная информация. Очень важная информация.", 2);
    notificationModel.addNotification(myImpl1);
    auto myImpl2 = new LogicPlugin::NotificationEntity("test", "Очень важная информация. Очень важная информация.", 3);
    notificationModel.addNotification(myImpl2);
    app.exec();
}
