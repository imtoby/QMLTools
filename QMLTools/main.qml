import QtQuick 2.12
import QtQuick.Window 2.12

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
