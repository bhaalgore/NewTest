#include "notify_model.h"

LogicPlugin::NotificationModel::NotificationModel(QObject *parent) : QAbstractListModel(parent)
{
    logger.openDatabase("QSQLITE", "./notify_db.db");
    logger.createTable();
}

int LogicPlugin::NotificationModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }
    return _notifications.size();
}

QVariant LogicPlugin::NotificationModel::data(const QModelIndex &index, int role) const
{
    if (index.row() > _notifications.size())
        return QVariant();

    const auto notification = _notifications.at(index.row()).get();
    switch (role) {
    case IdRole:
        return notification->id();
    case TitleRole:
        return notification->title();
    case MessageRole:
        return notification->description();
    case TypeRole:
        return notification->type();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> LogicPlugin::NotificationModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractItemModel::roleNames();
    roles[IdRole] = "id";
    roles[TitleRole] = "title";
    roles[MessageRole] = "message";
    roles[TypeRole] = "type";
    return roles;
}

void LogicPlugin::NotificationModel::addNotification(LogicPlugin::AbstractNotification *notification)
{
    beginInsertRows(QModelIndex(), _notifications.size(), _notifications.size());
    notification->setId(avalaibleId());
    _notifications.emplace_back(notification);
    logger.insert(notification->title(), notification->description(),notification->type(),
                  QDate::currentDate());
    endInsertRows();
}

void LogicPlugin::NotificationModel::removeNotification(int id)
{
    // Поскольку уведомления отсортированы по id, то можем применять бинарный поиск
    const auto it = std::lower_bound(_notifications.begin(), _notifications.end(), id,
                                     [](const auto &notification, auto id) {
                                         return notification->id() < id;
                                     });

    if (it == _notifications.end())
        return;

    const auto index = std::distance(_notifications.begin(), it);
    beginRemoveRows(QModelIndex(), index, index);
    _notifications.erase(it);
    endRemoveRows();
}

void LogicPlugin::NotificationModel::clearNotifications()
{
    beginResetModel();
    _notifications.clear();
    endResetModel();
}

int LogicPlugin::NotificationModel::count() const
{
    return _notifications.size();
}

int32_t LogicPlugin::NotificationModel::avalaibleId() const
{
    return _notifications.empty() ? 0 : _notifications.back()->id() + 1;
}
