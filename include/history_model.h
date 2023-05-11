#ifndef HISTORY_MODEL_H
#define HISTORY_MODEL_H
#include <QtSql>

class HistoryModel : public QSqlTableModel
{
    Q_OBJECT
public:
    enum Roles {
        TitleRole = Qt::UserRole + 1,
        MessageRole,
        TypeRole,
        DateRole,
        TimeRole
    };

    HistoryModel(QObject *parent = nullptr)
        : QSqlTableModel(parent)
    {
        setTable("notification");
        //select();
    }

    QHash<int, QByteArray> roleNames() const override
    {
        QHash<int, QByteArray> roles;
        roles[TitleRole] = "title";
        roles[MessageRole] = "message";
        roles[TypeRole] = "type";
        roles[DateRole] = "date";
        roles[TimeRole] = "time";
        return roles;
    }

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override
    {
        if (role < Qt::UserRole)
            return QSqlTableModel::data(index, role);

        QSqlRecord record = QSqlTableModel::record(index.row());
        switch (role) {
        case TitleRole:
            return record.value("Title");
        case MessageRole:
            return record.value("Description");
        case TypeRole:
            return record.value("Type");
        case DateRole:
            return record.value("Date");
        case TimeRole:
            return record.value("Time");
        default:
            return QVariant();
        }
    }
    Q_INVOKABLE void selectByDate(const QString& dateStr)
    {
        QString arg = dateStr + '%';
        setFilter(QString("Date LIKE '%1'").arg(arg));
        select();
    }
};


#endif // HISTORY_MODEL_H
