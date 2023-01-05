#ifndef BACKEND_H
#define BACKEND_H


#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include <QSqlQueryModel>
#include <QSqlRecord>

class Backend : public QObject
{
    Q_OBJECT
public:
    Backend();
    Q_INVOKABLE void connectDB();

    //backend ikan
    Q_INVOKABLE void simpanikan(QString id_ikan, QString nama_ikan,QString jenis_ikan, QString harga_bibit );
    Q_INVOKABLE void hapusikan (QString id_ikan);
    Q_INVOKABLE void ubahikan(QString id_ikan, QString nama_ikan,QString jenis_ikan, QString harga_bibit );

    //backend pengelola
    Q_INVOKABLE void simpanPNGL(QString id_pengelola, QString nama_pengelola, QString nip, QString jabatan, QString alamat, QString no_hp);
    Q_INVOKABLE void hapusPNGL (QString id_pengelola);
    Q_INVOKABLE void ubahPNGL (QString id_pengelola, QString nama_pengelola, QString nip, QString jabatan, QString alamat, QString no_hp);

    //backend penjualan
    Q_INVOKABLE void simpanPNJL(QString id_penjualan, QString id_permintaan, QString harga_pasar, QString sub_total, QString id_pengelola, QString total_harga);
    Q_INVOKABLE void ubahPNJL (QString id_penjualan, QString id_permintaan, QString harga_pasar, QString sub_total, QString id_pengelola, QString total_harga);
    Q_INVOKABLE void hapusPNJL (QString id_penjualan);

    Q_INVOKABLE bool cekValidasi(QString table, QString PK, QString value);
    //table ikan
    Q_INVOKABLE QString getNamaikan();
    Q_INVOKABLE QString getjenisikan();
    Q_INVOKABLE QString gethargabibit();
    //table pengelola
      Q_INVOKABLE QString getnamapengelola();
      Q_INVOKABLE QString getnip();
      Q_INVOKABLE QString getjabatan();
      Q_INVOKABLE QString getalamat();
      Q_INVOKABLE QString getnohp();
    //table penjualan
     Q_INVOKABLE QString getidpermintaan();
    Q_INVOKABLE QString gethargapasar();
    Q_INVOKABLE QString getsubtotal();
    Q_INVOKABLE QString getidpengelola();
    Q_INVOKABLE QString gettotalharga();



private:
    QSqlDatabase koneksi;
    QString namaikan, jenisikan, hargabibit;
    QString namapengelola, nip, jabatan, alamat, nohp;
    QString id_permintaan, hargapasar, subtotal, idpengelola, totalharga;



};

#endif // BACKEND_H
