import QtQuick 2.12

Item {

    Rectangle {
        anchors.fill: parent
        anchors.topMargin: 40
        anchors.bottomMargin: 40
        anchors.leftMargin: 20
        anchors.rightMargin: 20

        radius: 16
        color: "transparent"
        border.color: "#DEDEDE"

        Column {
            anchors.fill: parent
            anchors.margins: 20

            spacing: 10

            Text {
                id: id_title
                anchors.horizontalCenter: parent.horizontalCenter

                font.pixelSize: 20
                font.weight: 600

                text: qsTr("Base Converter")
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                implicitHeight: 1
            }

            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                color: "#EDEDED"
                implicitHeight: 1;
            }

            Text {
                id: id_source_label
                anchors.left: parent.left

                text: qsTr("Source Base:")

                Rectangle {
                    width: id_current_base.paintedWidth + 12
                    height: id_current_base.paintedHeight + 10
                    radius: 6
                    anchors.centerIn: id_current_base
                    color: id_current_base_button.pressed ? "#C9C9C9" : "#9C9C9C"

                    Rectangle {
                        width: 12
                        height: 12
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        color: parent.color
                    }
                }

                Text {
                    id: id_current_base
                    text: "10-base"
                    anchors.left: parent.left
                    anchors.leftMargin: id_source_label.paintedWidth + 20
                    color: "#FFFFFF"

                    MouseArea {
                        id: id_current_base_button
                        anchors.fill: parent
                        anchors.margins: -8
                    }
                }
            }

            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                color: "#EDEDED"
                implicitHeight: 1;
            }

        }
    }
}
