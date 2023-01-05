#include "backend.h"

Backend::Backend()
{

  }

void Backend::connectDB()
{
    koneksi= QSqlDatabase::addDatabase("QODBC");
    koneksi.setDatabaseName("Driver={MySQL ODBC 8.0 ANSI Driver}; Database=perikanan_2010010307");
    koneksi.setHostName("127.0.0.1");
    koneksi.setUserName("root");
    koneksi.setPassword("");
    koneksi.setPort(3306);

    //koding koneksi
    if (koneksi.open()){
        qDebug()<<"Database Berhasil Koneksi";
    } else {
        qDebug()<<koneksi.lastError().text();
    }
}

void Backend::simpanikan(QString id_ikan, QString nama_ikan, QString jenis_ikan, QString harga_bibit)
{
    QSqlQuery sqlsimpan;
    QString text = "INSERT INTO ikan VALUES (?,?,?,?)";
    sqlsimpan.prepare(text);
    sqlsimpan.bindValue(0,id_ikan);
    sqlsimpan.bindValue(1,nama_ikan);
    sqlsimpan.bindValue(2,jenis_ikan);
    sqlsimpan.bindValue(3,harga_bibit);
    sqlsimpan.exec();

}

void Backend::hapusikan(QString id_ikan)
{
    QSqlQuery sqlhapus;
    QString text = "DELETE FROM ikan WHERE id_ikan = :id_ikan";
    sqlhapus.prepare(text);
    sqlhapus.bindValue(":id_ikan",id_ikan);
    if (sqlhapus.exec()){
        qDebug()<<"Data Berhasil Dihapus";
    }else{
        qDebug()<<sqlhapus.lastError().text();
    }
}

void Backend::ubahikan(QString id_ikan, QString nama_ikan, QString jenis_ikan, QString harga_bibit)
{
    QSqlQuery sqlubah;
    QString text = "UPDATE ikan SET nama_ikan =:pnama_ikan, jenis_ikan = :pjenis_ikan, harga_bibit=:pharga_bibit WHERE id_ikan=:pid_ikan ";
    sqlubah.prepare(text);
    sqlubah.bindValue(":pnama_ikan",nama_ikan);
    sqlubah.bindValue(":pjenis_ikan",jenis_ikan);
    sqlubah.bindValue(":pharga_bibit",harga_bibit);
    sqlubah.bindValue(":pid_ikan",id_ikan);
    sqlubah.exec();
}

void Backend::simpanPNGL(QString id_pengelola, QString nama_pengelola, QString nip, QString jabatan, QString alamat, QString no_hp)
{
    QSqlQuery sqlsimpan;
    QString text = "INSERT INTO pengelola VALUES (?,?,?,?,?,?)";
    sqlsimpan.prepare(text);
    sqlsimpan.bindValue(0,id_pengelola);
    sqlsimpan.bindValue(1,nama_pengelola);
    sqlsimpan.bindValue(2,nip);
    sqlsimpan.bindValue(3,jabatan);
    sqlsimpan.bindValue(4,alamat);
    sqlsimpan.bindValue(5,no_hp);
    if (sqlsimpan.exec()){
        qDebug()<<"Data Berhasil Disimpan";
    }else{
        qDebug()<<sqlsimpan.lastError().text();
    }
}

void Backend::hapusPNGL(QString id_pengelola)
{
    QSqlQuery sqlhapus;
    QString text = "DELETE FROM pengelola WHERE id_pengelola = :id_pengelola";
    sqlhapus.prepare(text);
    sqlhapus.bindValue(":id_pengelola",id_pengelola);
    if (sqlhapus.exec()){
        qDebug()<<"Data Berhasil Dihapus";
    }else{
        qDebug()<<sqlhapus.lastError().text();
    }
}

void Backend::ubahPNGL(QString id_pengelola, QString nama_pengelola, QString nip, QString jabatan, QString alamat, QString no_hp)
{
    QSqlQuery sqlubah;
    QString text = "UPDATE pengelola SET nama_pengelola =:pnama_pengelola, nip = :pnip, jabatan=:pjabatan,alamat=:palamat, no_hp=:pno_hp WHERE id_pengelola=:pid_pengelola ";
    sqlubah.prepare(text);
    sqlubah.bindValue(":pnama_pengelola",nama_pengelola);
    sqlubah.bindValue(":pnip",nip);
    sqlubah.bindValue(":pjabatan",jabatan);
    sqlubah.bindValue(":palamat",alamat);
    sqlubah.bindValue(":pno_hp",no_hp);
    sqlubah.bindValue(":pid_pengelola",id_pengelola);
    sqlubah.exec();
}

void Backend::simpanPNJL(QString id_penjualan, QString id_permintaan, QString harga_pasar, QString sub_total, QString id_pengelola, QString total_harga)
{
    QSqlQuery sqlsimpan;
    QString text = "INSERT INTO penjualan VALUES (?,?,?,?,?,?)";
    sqlsimpan.prepare(text);
    sqlsimpan.bindValue(0,id_penjualan);
    sqlsimpan.bindValue(1,id_permintaan);
    sqlsimpan.bindValue(2,harga_pasar);
    sqlsimpan.bindValue(3,sub_total);
    sqlsimpan.bindValue(4,id_pengelola);
    sqlsimpan.bindValue(5,total_harga);
    sqlsimpan.exec();
}

void Backend::ubahPNJL(QString id_penjualan, QString id_permintaan, QString harga_pasar, QString sub_total, QString id_pengelola, QString total_harga)
{
    QSqlQuery sqlubah;
    QString text = "UPDATE penjualan SET id_permintaan=:pid_permintaan, harga_pasar=:phargapasar, sub_total=:psubtotal, id_pengelola=:pidpengelola, total_harga=:ptotalharga WHERE id_penjualan=:pidpenjualan ";
    sqlubah.prepare(text);
    sqlubah.bindValue(":pid_permintaa",id_permintaan);
    sqlubah.bindValue(":phargapasar",harga_pasar);
    sqlubah.bindValue(":psubbtotal",sub_total);
    sqlubah.bindValue(":pidpengelola",id_pengelola);
    sqlubah.bindValue(":ptotalharga",total_harga);
    sqlubah.bindValue(":pidpenjualan",id_penjualan);
    sqlubah.exec();
}

void Backend::hapusPNJL(QString id_penjualan)
{
    QSqlQuery sqlhapus;
    QString text = "DELETE FROM penjualan WHERE id_penjualan = :id_penjualan";
    sqlhapus.prepare(text);
    sqlhapus.bindValue(":id_penjualan",id_penjualan);
    if (sqlhapus.exec()){
        qDebug()<<"Data Berhasil Dihapus";
    }else{
        qDebug()<<sqlhapus.lastError().text();
    }
}

bool Backend::cekValidasi(QString table, QString PK, QString value)
{
    bool hasilDuplikasi;
    QSqlQueryModel model;
    model.setQuery("SELECT * FROM "+table+" WHERE "+PK + " = '" +value+ " '");
    int index=model.rowCount();
    if(index<1)
    {
        hasilDuplikasi = false;
    } else
    {
        hasilDuplikasi = true;

        if (table == "ikan"){
            namaikan = model.record(0).value(1).toString();
            jenisikan = model.record(0).value(2).toString();
            hargabibit = model.record(0).value(3).toString();
        } else if (table == "pengelola"){
            namapengelola = model.record(0).value(1).toString();
            nip = model.record(0).value(2).toString();
            jabatan = model.record(0).value(3).toString();
            alamat = model.record(0).value(4).toString();
            nohp = model.record(0).value(5).toString();
        }


    }
    return hasilDuplikasi;
}

QString Backend::getNamaikan()
{
    return namaikan;
}

QString Backend::getjenisikan()
{
    return jenisikan;
}

QString Backend::gethargabibit()
{
 return hargabibit;

}

QString Backend::getnamapengelola()
{
    return namapengelola;
}

QString Backend::getnip()
{
    return nip;
}

QString Backend::getjabatan()
{
    return jabatan;
}

QString Backend::getalamat()
{
    return alamat;
}

QString Backend::getnohp()
{
    return nohp;
}

QString Backend::getidpermintaan()
{
    return id_permintaan;
}

QString Backend::gethargapasar()
{
    return hargapasar;
}

QString Backend::getsubtotal()
{
    return subtotal;
}

QString Backend::getidpengelola()
{
    return idpengelola;
}

QString Backend::gettotalharga()
{
 return totalharga;
}

