import QtQuick 2.12

Item {

    Column {
        Row {
            Text {
                id: id_source_label
                text: qsTr("Source Base:")
            }

            TextInput {
                id: id_source_input
            }
        }
    }
}
