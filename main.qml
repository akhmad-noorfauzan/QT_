import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.3

ApplicationWindow {
    id:form1
    width: 1300
    height: 800
    visible: true
    title: qsTr("Home")

    header:ToolBar{
        contentHeight: ToolButton.implicitContentHeight

        ToolButton{
            id:tombolatas
            text: halamanView.depth>1? "\u2198" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize*2.5
            onClicked: {
                if(halamanView.depth>1){
                    halamanView.pop()
                }else{
                    menuSamping.open()
                }
            }
        }

    }



    Drawer{
        id:menuSamping

        height:parent.height
        width:parent.width*0.5

        Column{
            height:parent.height
            width: parent.width



            ItemDelegate{
                width: parent.width
                height:100

                Rectangle{
                    width:parent.width
                    height:100
                    color: "black"

                    Image {
                        id: logo
                        height: 80
                        width:80
                        x:20
                        y:10
                        source:"qrc:/ikan2.png"}

                    Label{
                        text: "Menu"
                        font.bold: true
                        font.pixelSize: 30
                        color: "white"
                        x:120
                        y:40
                    }
                }
            }

            ItemDelegate{
            text: "ikan"
            width:parent.width
            font.bold: true
            onClicked: {
                halamanView.push("ikan.qml")
                menuSamping.close()
            }
            }


            ItemDelegate{
            text: "Pengelola"
            width:parent.width
            font.bold: true
            onClicked: {
                halamanView.push("pengelola.qml")
                menuSamping.close()
            }
            }
            ItemDelegate{
            text: "Penjualan"
            width:parent.width
            font.bold: true
            onClicked: {
                halamanView.push("penjualan.qml")
                menuSamping.close()
            }
            }

            Image {
                source: "qrc:/dokumen.JPG"
                width:150
                height:200

            }
            Label{
                text: "Nama :akhmad noorfauzan"
                font.bold: true
            }
            Label{
                text: "NPM :2010010307"
                font.bold: true
            }

        }
    }

        StackView{
            id:halamanView
            anchors.fill: parent
            initialItem: "home.qml"
        }
}
