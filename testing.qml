import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3


Page {
    id:formikan

                Rectangle{

                    id:kotakitem0
                    width:parent.width
                    height:parent.height
                    color: Material.color(Material.Cyan)


                    Image{
                    id:bgikan
                    width: parent.width
                    height: parent.height
                    source: "qrc:/dataikan.jpg"
                    }

                    Label{
                    text: "Form Data Ikan"
                    font.bold: true
                    font.pixelSize: 60
                    color: "white"
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
                    anchors.centerIn: kotakform1
                    x:30
                    y:40

                        Label{
                        text:"id_ikan :"
                        font.pixelSize: 20
                         }

                        TextField{
                        id:txtid_ikan
                        Material.background: Material.Grey
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
                        Material.background: Material.Grey
                         }

                        Label{
                        text:"harga_bibit :"
                        font.pixelSize: 20
                         }

                        TextField{
                        id:txtharga_bibit
                        Material.background: Material.Grey
                         }

                        RowLayout{

                        Button{
                        id:btnsimpanikan
                        text: "Simpan"
                        Material.background: Material.Teal
                        onClicked: {
                            FTI.simpanikan(txtid_ikan.text, txtnama_ikan.text, txtjenis_ikan.text, txtharga_bibit.text)
                        }
                        }

                        Button{
                        id:btnhapusikan
                        text: "Hapus"
                        Material.background: Material.Teal
                        }
                        Button{
                        id:btnubahikan
                        text: "Ubah"
                        Material.background: Material.Teal
                        }
                        }
                       }
                    }
                }
            }

