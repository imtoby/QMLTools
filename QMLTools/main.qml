import QtQuick
import QtQuick.Window

import "./BaseConverter"

Window {
    width: 480
    height: 960
    visible: true
    title: qsTr("QML Tools")

    BaseConverter {
        anchors.fill: parent
    }
}
