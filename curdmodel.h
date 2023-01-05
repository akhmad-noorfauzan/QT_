#ifndef CURDMODEL_H
#define CURDMODEL_H

#include <QObject>
#include <QSqlQueryModel>
#include <QSqlRecord>
#include <QSqlField>

class curdModel : public QSqlQueryModel
{
    Q_OBJECT
public:
    curdModel();
    void setQuery(const QString &query, const QSqlDatabase &db = QSqlDatabase());
    void setQuery(const QSqlQuery &query);

    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE void perintahSql(QString sql);

private :
    void generateRoleNames();
    QHash<int, QByteArray> m_roleNames;
};

#endif // CURDMODEL_H
