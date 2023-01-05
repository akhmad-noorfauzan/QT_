import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import QtQuick.Window 2.3


Page {
id:formikan


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
                    id:item1
                    Material.accent: Material.Blue
                    Rectangle{
                        id:kotakitem0
                        width:parent.width
                        height:parent.height
                        color: Material.color(Material.Cyan)
                        Image {
                            id: name
                            height:formikan.height
                            width:formikan.width
                            source: "qrc:/bglaut.jpg" }


                        Label{
                            text: "Form Data Ikan"
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
                                    text:"id_ikan :"
                                    font.pixelSize: 20
                                }

                                TextField{
                                    id:txtid_ikan
                                    Material.background: Material.Grey
                                    onTextChanged: {

                                        if (FTI.cekValidasi("ikan", "id_ikan", txtid_ikan.text) === true){
                                            txtnama_ikan.text = FTI.getNamaikan()
                                            txtjenis_ikan.text = FTI.getjenisikan()
                                            txtharga_bibit.text = FTI.gethargabibit()
                                        } else{
                                            txtnama_ikan.clear()
                                            txtjenis_ikan.clear()
                                            txtharga_bibit.clear()
                                        }
                                    }
                                }

                                Label{
                                    text:"nama_ikan :"
                                    font.pixelSize: 20
                                }

                                TextField{
                                    id:txtnama_ikan
                                    Material.background: Material.Grey
                                }

                                Label{
                                    text:"jenis_ikan :"
                                    font.pixelSize: 20
                                }

                           TextField{
                           id:txtjenis_ikan
                           }

                                Label{
                                    text:"harga_bibit :"
                                    font.pixelSize: 20
                                }
                                TextField{
                                    id:txtharga_bibit
                                    Material.background: Material.Grey
                                }
                                Button{
                                    id:btnsimpanikan
                                    text: "Simpan"
                                    Material.background: Material.Teal
                                    onClicked: {
                                            if (txtid_ikan.text === ""){
                                                isipesan = "Id ikan wajib diisi"
                                                pesanValidasi.open()
                                                txtid_ikan.focus = true
                                            } else if (txtnama_ikan.text === ""){
                                                isipesan = "Nama ikan wajib diisi"
                                                pesanValidasi.open()
                                                txtnama_ikan.focus = true
                                            } else if (txtjenis_ikan.text === ""){
                                                isipesan = "jenis ikan wajib diisi"
                                                pesanValidasi.open()
                                                txtjenis_ikan.focus = true
                                            } else if (txtharga_bibit.text === ""){
                                                isipesan = "harga bibit wajib diisi"
                                                pesanValidasi.open()
                                                txtharga_bibit.focus = true
                                            } else {
                                                FTI.cekValidasi("ikan", "id_ikan", txtid_ikan.text)
                                                if (FTI.cekValidasi === true){
                                                    isipesan = "Id Sudah Tersimpan"
                                                    pesanValidasi.open()
                                                } else {
                                                    FTI.simpanikan(txtid_ikan.text, txtnama_ikan.text,txtjenis_ikan.text,txtharga_bibit.text);
                                                    txtid_ikan.text="";
                                                    txtnama_ikan.text="";
                                                    txtjenis_ikan.text="";
                                                    txtharga_bibit.text="";
                                                    isipesan="Data Berhasil Disimpan"
                                                    pesanValidasi.open()
                                                    txtid_ikan.focus = true
                                                }

                                        }

                                   }
                                }

                                Button{
                                    id:btnhapusikan
                                    text: "Hapus"
                                    Material.background: Material.Teal
                                    onClicked: {
                                        FTI.hapusikan(txtid_ikan.text);
                                    }
                                }
                                Button{
                                    id:btnubahikan
                                    text: "Ubah"
                                    Material.background: Material.Teal
                                    onClicked: {

                                            if (txtid_ikan.text === ""){
                                                isipesan = "Id ikan wajib diisi"
                                                pesanValidasi.open()
                                                txtid_ikan.focus = true
                                            } else if (txtnama_ikan.text === ""){
                                                isipesan = "Nama ikan wajib diisi"
                                                pesanValidasi.open()
                                                txtnama_ikan.focus = true
                                            } else if (txtjenis_ikan.text === ""){
                                                isipesan = "jenis ikan wajib diisi"
                                                pesanValidasi.open()
                                                txtjenis_ikan.focus = true
                                            } else if (txtharga_bibit.text === ""){
                                                isipesan = "harga bibit wajib diisi"
                                                pesanValidasi.open()
                                                txtharga_bibit.focus = true
                                            } else {
                                                    FTI.ubahikan(txtid_ikan.text, txtnama_ikan.text,txtjenis_ikan.text,txtharga_bibit.text);
                                                    txtid_ikan.text="";
                                                    txtnama_ikan.text="";
                                                    txtjenis_ikan.text="";
                                                    txtharga_bibit.text="";
                                                    isipesan="Data Berhasil Di Ubah"
                                                    pesanValidasi.open()
                                                    txtid_ikan.focus = true
                                                }

                                        }

                                   }
                                }
                            }
                        }
                    }

                Item{
                    id:item2
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
                                model:modelikan
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
                                            text: modelikan.headerData(modelData, Qt.Horizontal)
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
            }

        }

}
