import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.3

Page {
    id:pagehome
    Rectangle{
        id:bgikan
        height:pagehome.height
        width: pagehome.width
        Image {
            id: name
            height:bgikan.height
            width:bgikan.width
            source: "qrc:/bglaut.jpg" }
        Rectangle{
        id:logo
        height: 600
        width: 1000
        radius: 50
        color: Material.color(Material.LightBlue)
        anchors.centerIn: bgikan
        opacity: 0.9
        gradient: Gradient {
               GradientStop { position: 0.0; color: "lightsteelblue" }
               GradientStop { position: 1.0; color: "blue" }
           }




        Image{
            id:logo1
            height:300
            width: 300
            anchors.horizontalCenter: logo.horizontalCenter
            anchors.topMargin: 10
            source: "qrc:/ikan2.png"
        }
        Label{
        id:judul
        text: "PENCATATAN PERSEBARAN IKAN DI PASAR"
        color: "white"
        font.bold: true
        font.pixelSize: 40
        y:300
        anchors.horizontalCenter: logo.horizontalCenter
        }
        }
    }
}

