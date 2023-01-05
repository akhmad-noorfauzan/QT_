import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import QtQuick.Window 2.3

Page {
    id:formpengelola

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
            id:form2
            text:"Form"
            onClicked: {
                menuSwipe.currentIndex=0
            }
        }
        TabButton{
            id:table2
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


            Item{
                id:item2
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
                    text: "Form Data Pengelola"
                    font.bold: true
                    font.pixelSize: 30


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



                    GridLayout {
                        id:layoutKasir
                        columns: 2
                        x : 140
                        y : 40

                        Label{
                        text:"id_pengelola :"
                        font.pixelSize: 20
                         }

                        TextField{
                        id:txtid_pengelola
                        Material.background: Material.Grey
                        onTextChanged: {

                            if (FTI.cekValidasi("pengelola", "id_pengelola", txtid_pengelola.text) === true){
                                txtnama_pengelola.text = FTI.getnamapengelola()
                                txtnip.text = FTI.getnip()
                                txtjabatan.text = FTI.getjabatan()
                                txtalamat.text = FTI.getalamat()
                                txtno_hp.text = FTI.getnohp()
                            } else{
                                txtnama_pengelola.clear()
                                txtnip.clear()
                                txtjabatan.clear()
                                txtalamat.clear()
                                txtno_hp.clear()
                            }

                         }
                        }

                        Label{
                        text:"nama_pengelola :"
                        font.pixelSize: 20
                         }

                        TextField{
                        id:txtnama_pengelola
                        Material.background: Material.Grey
                         }

                        Label{
                        text:"nip :"
                        font.pixelSize: 20
                         }

                        TextField{
                        id:txtnip
                        Material.background: Material.Grey
                         }

                        Label{
                        text:"jabatan :"
                        font.pixelSize: 20
                         }

                        TextField{
                        id:txtjabatan
                        Material.background: Material.Grey
                         }
                        Label{
                        text:"alamat :"
                        font.pixelSize: 20
                         }

                        TextField{
                        id:txtalamat
                        Material.background: Material.Grey
                         }
                        Label{
                        text:"no_hp :"
                        font.pixelSize: 20
                         }

                        TextField{
                        id:txtno_hp
                        Material.background: Material.Grey
                         }}

                    GridLayout{
                    id:layout2
                    columns: 3
                    columnSpacing: 50
                    x:30
                    y:330

                        Button{
                        id:btnsimpanpengelola
                        text: "Simpan"
                        Material.background: Material.Teal
                        onClicked: {
                                if (txtid_pengelola.text === ""){
                                    isipesan = "Id pengelola wajib diisi"
                                    pesanValidasi.open()
                                    txtid_pengelola.focus = true
                                } else if (txtnama_pengelola.text === ""){
                                    isipesan = "Nama pengelola wajib diisi"
                                    pesanValidasi.open()
                                    txtnama_pengelola.focus = true
                                } else if (txtnip.text === ""){
                                    isipesan = "nip diisi"
                                    pesanValidasi.open()
                                    txtnip.focus = true
                                } else if (txtalamat.text === ""){
                                    isipesan = "alamat wajib diisi"
                                    pesanValidasi.open()
                                    txtalamat.focus = true
                                }else if (txtjabatan.text === ""){
                                    isipesan = "jabatan wajib diisi"
                                    pesanValidasi.open()
                                    txtjabatan.focus = true
                                }else if (txtno_hp.text === ""){
                                    isipesan = "alamat wajib diisi"
                                    pesanValidasi.open()
                                    txtno_hp.focus = true
                                } else {
                                    FTI.cekValidasi("pengelola", "id_pengelola", txtid_pengelola.text)
                                    if (FTI.cekValidasi === true){
                                        isipesan = "Id Sudah Tersimpan"
                                        pesanValidasi.open()
                                    } else {
                                        FTI.simpanPNGL(txtid_pengelola.text, txtnama_pengelola.text,txtnip.text,txtalamat.text, txtjabatan.text, txtno_hp.text);
                                        txtid_pengelola.text="";
                                        txtnama_pengelola.text="";
                                        txtnip.text="";
                                        txtalamat.text="";
                                        txtjabatan.text="";
                                        txtno_hp.text="";
                                        isipesan="Data Berhasil Disimpan"
                                        pesanValidasi.open()
                                        txtid_pengelola.focus = true
                                    }

                            }

                       }
                        }

                        Button{
                        id:btnhapuspengelola
                        text: "Hapus"
                        Material.background: Material.Teal
                        onClicked: {
                            FTI.hapusPNGL(txtid_pengelola.text);
                        }
                        }
                        Button{
                            id:btnubahpegnelola
                            text: "Ubah"
                             Material.background: Material.Teal
                            onClicked: {
                                if (txtid_pengelola.text === ""){
                                    isipesan = "Id pengelola wajib diisi"
                                    pesanValidasi.open()
                                    txtid_pengelola.focus = true
                                } else if (txtnama_pengelola.text === ""){
                                    isipesan = "Nama pengelola wajib diisi"
                                    pesanValidasi.open()
                                    txtnama_pengelola.focus = true
                                } else if (txtnip.text === ""){
                                    isipesan = "nip diisi"
                                    pesanValidasi.open()
                                    txtnip.focus = true
                                } else if (txtalamat.text === ""){
                                    isipesan = "alamat wajib diisi"
                                    pesanValidasi.open()
                                    txtalamat.focus = true
                                }else if (txtjabatan.text === ""){
                                    isipesan = "jabatan wajib diisi"
                                    pesanValidasi.open()
                                    txtjabatan.focus = true
                                }else if (txtno_hp.text === ""){
                                    isipesan = "alamat wajib diisi"
                                    pesanValidasi.open()
                                    txtno_hp.focus = true
                                } else{
                                        FTI.simpanPNGL(txtid_pengelola.text, txtnama_pengelola.text,txtnip.text,txtalamat.text, txtjabatan.text, txtno_hp.text);
                                        txtid_pengelola.text="";
                                        txtnama_pengelola.text="";
                                        txtnip.text="";
                                        txtalamat.text="";
                                        txtjabatan.text="";
                                        txtno_hp.text="";
                                        isipesan="Data Berhasil Disimpan"
                                        pesanValidasi.open()
                                        txtid_pengelola.focus = true
                                    }

                            }

                       }
                            
                        }
                       }
                }



            Item{
                id:item3
                Rectangle{
                    id:kotakitem1
                    width:parent.width
                    height:parent.height
                    color: "lavender"
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

                                     model:modelpengelola


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
                                                 text: modelpengelola.headerData(modelData, Qt.Horizontal)
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
        }}}}


