#include "abstract_notification.h"

LogicPlugin::AbstractNotification::AbstractNotification(const QString &title,
                                                        const QString &description,
                                                        uint16_t typeID) :
    _title(title),
    _description(description)
{
    setType(typeID);
}

int32_t LogicPlugin::AbstractNotification::id() const
{
    return _id;
}

void LogicPlugin::AbstractNotification::setId(int32_t id)
{
    _id = id;
}

QString LogicPlugin::AbstractNotification::title() const
{
    return _title;
}

QString LogicPlugin::AbstractNotification::description() const
{
    return _description;
}

QString LogicPlugin::AbstractNotification::type() const
{
    return LogicPlugin::TypeManager::stringType(_typeID);
}

void LogicPlugin::AbstractNotification::setTitle(const QString &title)
{
    _title = title;
}

void LogicPlugin::AbstractNotification::setDescription(const QString &description)
{
    _description = description;
}

void LogicPlugin::AbstractNotification::setType(const uint16_t &typeID)
{
    if (LogicPlugin::TypeManager::isTypeExist(typeID)) {
        _typeID = typeID;
    } else {
        qDebug() << Q_FUNC_INFO
                 << " NotificationType structure does not have type with id: " << typeID
                 << "\n NotificationType will be set to default value";
        _typeID = 0;
    }
}
