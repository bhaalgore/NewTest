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

    QQmlApplicationEngine engine;
    QQmlEngine Qengine;
    QList<QQuickWindow*> windows;
    QScreen *screen = QGuiApplication::primaryScreen();
    QSize screenSize = screen->size();
    int screenHeight = screenSize.height();
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
                    qreal pos = 0;
                    if(windows.count())
                     pos = windows.back()->property("y").toReal();
                    else pos = screenHeight - 40;
                    pos-=85;
                    window->setProperty("y", QVariant::fromValue(pos));
                    window->setClearBeforeRendering(true);
                    window->show();
                    windows.append(window);
                    QObject::connect(window, &QQuickWindow::visibleChanged, [&windows,window]() {
                        qreal closedWindowPos = window->property("y").toReal();
                        for (auto& w : windows) {
                            qreal wPos = w->property("y").toReal();
                            if (w != window && wPos < closedWindowPos) {
                                w->setProperty("y", QVariant::fromValue(wPos + 85));
                            }
                        }
                        windows.removeOne(window);
                    });
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
