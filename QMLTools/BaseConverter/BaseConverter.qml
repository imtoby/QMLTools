import QtQuick 2.12

Item {
    id: id_base_converter
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
                        id: id_current_base_button_bg
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
                        onClicked: {

                            const incubatorFinished = (incubatorObject) => {
                                const pos = id_current_base_button_bg.mapToItem(
                                    id_base_converter,
                                    id_current_base_button_bg.width,
                                    id_current_base_button_bg.height)
                                incubatorObject.x = pos.x
                                incubatorObject.y = pos.y
                            }

                            const incubator = id_source_bases_menu.incubateObject(id_base_converter);
                            if (incubator.status !== Component.Ready) {
                                incubator.onStatusChanged = function(status) {
                                    if (status === Component.Ready) {
                                        incubatorFinished(incubator.object);
                                    }
                                }
                            } else {
                                incubatorFinished(incubator.object);
                            }
                        }
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

    Component {
        id: id_source_bases_menu
        Rectangle {
            implicitWidth: 120
            implicitHeight: 120
            color: "#9C9C9C"
            radius: 6

            Rectangle {
                width: 12
                height: 12
                color: parent.color
            }

            Column {
                anchors.fill: parent
                anchors.margins: 10

                Repeater {
                    model: sourceBaseModel
                    Text {
                        id: id_current_base
                        text: model.modelData.name
                        color: "#FFFFFF"
                        height: 24
                    }
                }
            }
        }
    }

    property var sourceBaseModel: [
        { name: "2-base", value: 2 },
        { name: "8-base", value: 8 },
        { name: "10-base", value: 10 },
        { name: "16-base", value: 16 },
    ]
}
