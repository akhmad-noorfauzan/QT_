#include "curdmodel.h"

curdModel::curdModel()
{

}

void curdModel::setQuery(const QString &query, const QSqlDatabase &db)
{
    QSqlQueryModel::setQuery(query, db);
    generateRoleNames();
}

void curdModel::setQuery(const QSqlQuery &query)
{
    QSqlQueryModel::setQuery(query);
    generateRoleNames();
}

QVariant curdModel::data(const QModelIndex &index, int role) const
{
    QVariant value;

        if(role < Qt::UserRole) {
            value = QSqlQueryModel::data(index, role);
        }
        else {
            int columnIdx = role - Qt::UserRole - 1;
            QModelIndex modelIndex = this->index(index.row(), columnIdx);
            value = QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
        }
        return value;
}

QHash<int, QByteArray> curdModel::roleNames() const
{
    return {{Qt::DisplayRole, "display"}};
}

void curdModel::perintahSql(QString sql)
{
    setQuery(sql);
}

void curdModel::generateRoleNames()
{
    m_roleNames.clear();
        for( int i = 0; i < record().count(); i ++) {
            m_roleNames.insert(Qt::UserRole + i + 1, record().fieldName(i).toUtf8());
        }
}
