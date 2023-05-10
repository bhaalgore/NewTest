#ifndef HISTORY_MODEL_H
#define HISTORY_MODEL_H


#include <QtSql>

class HistoryModel : public QSqlTableModel
{
    Q_OBJECT
public:
    HistoryModel(QObject *parent = nullptr)
        : QSqlTableModel(parent)
    {
        setTable("notification");
        select();
    }
};

#endif // HISTORY_MODEL_H
