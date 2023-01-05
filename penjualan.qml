import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import QtQuick.Window 2.3

Page {
    id:formpenjualan
    property string isipesan: ""
    Dialog{
        id:pesanValidasi
        title : "Informasi"

        Text {
            id: idpesan
            text: isipesan
           }
    }
    footer:TabBar{
        id:menuTabBarikan
        currentIndex: menuSwipe.currentIndex
        TabButton{
            id:form3
            text:"Form"
            onClicked: {
                menuSwipe.currentIndex=0
            }
        }
        TabButton{
            id:table3
            text:"Table"
            onClicked: {
                menuSwipe.currentIndex=1
            }
        }
    }

    Rectangle{
        id: menuUtamaSwipe
        height:parent.height
        width: parent.width
        color: "azure"


        SwipeView{
            id:menuSwipe
            width:parent.width
            height: parent.height
            currentIndex: Page.currentindex

            Item{
                id:item4
                Material.accent: Material.Blue

                Rectangle{

                    id:kotakitem0
                    width:parent.width
                    height:parent.height
                    color: Material.color(Material.Cyan)
                    Image {
                        id: name
                        height:parent.height
                        width:parent.width
                        source: "qrc:/bglaut.jpg" }

                    Label{
                    text: "Form Data Penjualan"
                    font.bold: true
                    font.pixelSize: 30
                    color: white

                    anchors.horizontalCenter: kotakitem0.horizontalCenter
                    }

                    Rectangle{
                        id:kotakform1
                        width: parent.width-700
                        height: parent.height-300
                        color: Material.color(Material.Grey)
                        anchors.centerIn: kotakitem0
                        border.color:"black"
                        border.width: 1
                        radius: 20
                        gradient: "NightFade"



                    GridLayout{
                    id:layout1
                    columns: 2
                    columnSpacing: 100
                    x:30
                    y:40

                        Label{
                        text:"id_penjualan :"
                        font.pixelSize: 20
                         }

                        TextField{
                        id:txtid_penjualan
                        Material.background: Material.Grey
                        onTextChanged: {

                            if (FTI.cekValidasi("penjualan", "id_penjualan", txtid_penjualan.text) === true){
                                txtid_permintaan.text = FTI.getidpermintaan()
                                txtharga_pasar.text = FTI.gethargapasar()
                                txtsub_total.text = FTI.getsubtotal()
                                txtid_pengelola.text = FTI.idpengelola()
                                txttotal_harga.text = FTI.gettotalharga()
                            } else{
                                txtid_permintaan.clear()
                                txtharga_pasar.clear()
                                txtsub_total.clear()
                                txtid_pengelola.clear()
                                txttotal_harga.clear()
                            }

                         }
                         }

                        Label{
                        text:"id_permintaan :"
                        font.pixelSize: 20
                         }

                        TextField{
                        id:txtid_permintaan
                        Material.background: Material.Grey
                         }

                        Label{
                        text:"harga_pasar"
                        font.pixelSize: 20
                         }

                        TextField{
                        id:txtharga_pasar
                        Material.background: Material.Grey
                         }

                        Label{
                        text:"sub_total"
                        font.pixelSize: 20
                         }

                        TextField{
                        id:txtsub_total
                        Material.background: Material.Grey
                         }
                        Label{
                        text:"id_pengelola"
                        font.pixelSize: 20
                         }

                        TextField{
                        id:txtid_pengelola
                        Material.background: Material.Grey
                         }
                        Label{
                        text:"total_harga"
                        font.pixelSize: 20
                         }

                        TextField{
                        id:txttotal_harga
                        Material.background: Material.Grey
                         }}

                    GridLayout{
                    id:layout2
                    columns: 3
                    columnSpacing: 50
                    x:30
                    y:330

                        Button{
                        id:btnsimpan
                        text: "Simpan"
                        Material.background: Material.Teal
                        onClicked: {
                                if (txtid_penjualan.text === ""){
                                    isipesan = "Id penjualan wajib diisi"
                                    pesanValidasi.open()
                                    txtid_penjualan.focus = true
                                } else if (txtid_permintaan.text === ""){
                                    isipesan = "id permintaan wajib diisi"
                                    pesanValidasi.open()
                                    txtid_permintaan.focus = true
                                } else if (txtharga_pasar.text === ""){
                                    isipesan = "harga pasar wajibdiisi"
                                    pesanValidasi.open()
                                    txtharga_pasar.focus = true
                                } else if (txtsub_total.text === ""){
                                    isipesan = "sub_total wajib diisi"
                                    pesanValidasi.open()
                                    txtsub_total.focus = true
                                }else if (txtid_pengelola.text === ""){
                                    isipesan = "id_pengelola wajib diisi"
                                    pesanValidasi.open()
                                    txtid_pengelola.focus = true
                                }else if (txttotal_harga.text === ""){
                                    isipesan = "total harga wajib diisi"
                                    pesanValidasi.open()
                                    txttotal_harga.focus = true
                                } else {
                                    FTI.cekValidasi("penjualan", "id_penjualan", txtid_penjualan.text)
                                    if (FTI.cekValidasi === true){
                                        isipesan = "Id Sudah Tersimpan"
                                        pesanValidasi.open()
                                    } else {
                                        FTI.simpanPNJL(txtid_penjualan.text, txtid_permintaan.text,txtharga_pasar.text,txtsub_total.text, txtid_pengelola.text, txttotal_harga.text);
                                        txtid_penjualan.text="";
                                        txtharga_pasar.text="";
                                        txtsub_total.text="";
                                        txtid_pengelola.text="";
                                        txtid_pengelola.text="";
                                        txtid_permintaan.text="";
                                        isipesan="Data Berhasil Disimpan"
                                        pesanValidasi.open()
                                        txtid_pengelola.focus = true
                                    }

                            }

                       }
                        }

                        Button{
                        id:btnhapus
                        text: "Hapus"
                        Material.background: Material.Teal
                        onClicked: {
                            FTI.hapusPNJL(txtid_penjualan.text)
                        }
                        }
                        Button{
                        id:btnubah
                        text: "Hapus"
                        Material.background: Material.Teal
                        onClicked: {
                                if (txtid_penjualan.text === ""){
                                    isipesan = "Id penjualan wajib diisi"
                                    pesanValidasi.open()
                                    txtid_penjualan.focus = true
                                } else if (txtid_permintaan.text === ""){
                                    isipesan = "id permintaan wajib diisi"
                                    pesanValidasi.open()
                                    txtid_permintaan.focus = true
                                } else if (txtharga_pasar.text === ""){
                                    isipesan = "harga pasar wajibdiisi"
                                    pesanValidasi.open()
                                    txtharga_pasar.focus = true
                                } else if (txtsub_total.text === ""){
                                    isipesan = "sub_total wajib diisi"
                                    pesanValidasi.open()
                                    txtsub_total.focus = true
                                }else if (txtid_pengelola.text === ""){
                                    isipesan = "id_pengelola wajib diisi"
                                    pesanValidasi.open()
                                    txtid_pengelola.focus = true
                                }else if (txttotal_harga.text === ""){
                                    isipesan = "total harga wajib diisi"
                                    pesanValidasi.open()
                                    txttotal_harga.focus = true
                                } else {
                                        FTI.simpanPNJL(txtid_penjualan.text, txtid_permintaan.text,txtharga_pasar.text,txtsub_total.text, txtid_pengelola.text, txttotal_harga.text);
                                        txtid_penjualan.text="";
                                        txtharga_pasar.text="";
                                        txtsub_total.text="";
                                        txtid_pengelola.text="";
                                        txtid_pengelola.text="";
                                        txtid_permintaan.text="";
                                        isipesan="Data Berhasil Disimpan"
                                        pesanValidasi.open()
                                        txtid_pengelola.focus = true
                                    }

                            }

                       }


                        }
                       }
                    }
                }


            Item{
                id:item1
                Rectangle{
                    id:kotakitem1
                    width:parent.width
                    height:parent.height
                    color: "lavender"
                    Label{
                        font.bold: true
                        text: "Table"
                        anchors.centerIn: parent
              }
                    Rectangle{
                         width: parent.width -20
                         height: parent.height -20
                         TableView {
                                     id: tableView
                                     topMargin:columnsHeader.implicitHeight

                                     columnWidthProvider:function (){return 200}// { return 200 }
                                     rowHeightProvider: function () { return 20; }
                                     anchors.fill: parent

                                     ScrollBar.horizontal: ScrollBar{}
                                     ScrollBar.vertical: ScrollBar{}
                                     clip: true

                                     model:modelpenjualan


                                     // Table Body

                                     delegate: Rectangle {
                                         Text {
                                             text: display // This is set in mysqlmodel.cpp roleNames()
                                             anchors.fill: parent
                                             anchors.margins: 10
                                             color: 'black'
                                             font.pixelSize: 15
                                             verticalAlignment: Text.AlignVCenter
                                         }
                                     }


                                     // Table Header

                                     Row {
                                         id: columnsHeader
                                         y: tableView.contentY
                                         z: 2
                                         Repeater {
                                             model: tableView.columns > 0 ? tableView.columns : 1
                                             Label {
                                                 width: tableView.columnWidthProvider(modelData)
                                                 height: 25
                                                 text: modelpenjualan.headerData(modelData, Qt.Horizontal)
                                                 font.pixelSize: 15
                                                 padding: 10
                                                 verticalAlignment: Text.AlignVCenter

                                                 background: Rectangle { color: "#ccc" }
                                             }
                                         }
                                     }


                                     ScrollIndicator.horizontal: ScrollIndicator { }
                                     ScrollIndicator.vertical: ScrollIndicator { }


                                 }
                     }

             }
      }
        }}}
