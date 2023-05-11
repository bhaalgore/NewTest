#include "notify_model.h"
#include "notification_entity.h"
LogicPlugin::NotificationModel::NotificationModel(QObject *parent) : QAbstractListModel(parent)
{
    logger.openDatabase("QSQLITE", "./notify_db.db");
    logger.createTable();
    _timerId = startTimer(4000);
}

int LogicPlugin::NotificationModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }
    return _notifications.count();
}

QVariant LogicPlugin::NotificationModel::data(const QModelIndex &index, int role) const
{
    if (index.row() > _notifications.size())
        return QVariant();
    const auto row = _notifications.at(index.row());
    switch (role) {
    case TitleRole:
        return row->title();
    case MessageRole:
        return row->description();
    case TypeRole:
        return row->type();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> LogicPlugin::NotificationModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractItemModel::roleNames();
    roles[TitleRole] = "title";
    roles[MessageRole] = "message";
    roles[TypeRole] = "type";
    return roles;
}

void LogicPlugin::NotificationModel::addNotification(
 QPointer<LogicPlugin::AbstractNotification> notification)
{
    beginInsertRows(QModelIndex(), _notifications.count(), _notifications.count());
    _notifications.push_back(notification);

    logger.insert(notification->type(), notification->title(), notification->description(),
                  QDate::currentDate(), QTime::currentTime().toString("hh:mm:ss"));
    endInsertRows();
}

void LogicPlugin::NotificationModel::removeNotification(int index)
{
    if (index > _notifications.size())
        return;
    beginRemoveRows(QModelIndex(), index, index);
    _notifications.removeAt(index);
    endRemoveRows();
}

void LogicPlugin::NotificationModel::timerEvent(QTimerEvent *event)
{
    if (_timerId != event->timerId())
        return;
    if (count() > 10)
        return;
    std::random_device                  rand_dev;
    std::mt19937                        generator(rand_dev());
    std::uniform_int_distribution<int>  distr(0, 3);
    int num = distr(generator);
    auto myImpl1 = new LogicPlugin::NotificationEntity(
        "Обнаружена цель в SportCenter", "Очень важная информация. Очень важная информация.", 1);
    auto myImpl2 = new LogicPlugin::NotificationEntity(
        "Камера не доступна!", "Очень важная информация. Очень важная информация.", 2);
    auto myImpl3 = new LogicPlugin::NotificationEntity(
        "Высокий уровень шума!", "Очень важная информация. Очень важная информация.", 3);
    switch(num){
    case 1:
        addNotification(myImpl1);
        break;
    case 2:
        addNotification(myImpl2);
        break;
     case 3:

        addNotification(myImpl3);
        break;
    }

}
void LogicPlugin::NotificationModel::clearNotifications()
{
    beginResetModel();
    _notifications.clear();
    endResetModel();
}

int LogicPlugin::NotificationModel::count() const
{
    return _notifications.count();
}
