import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import Parser 1.0

Window {
    id: root
    property bool isProcessing: false
    visible: true
    width: 1280
    height: 740
    color: "#17202b"
    title: qsTr("Манипуляторы")

    Rectangle {
        color: "#17202b"
        anchors.fill: parent

            Rectangle {
                color: "#0e1620"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                width: 480

                FieldCustom {
                     id: x1Field
                     anchors.top: parent.top
                     anchors.left: textX1.right
                     anchors.leftMargin: 20
                     validator: RegExpValidator{
                         regExp: /^-?(100(\.0{1,5})?|[1-9][0-9]?(\.[0-9]{1,5})?|0(\.[0-9]{1,5})?)$/
                     }
                }
                Text {
                    id: textX1
                    text: "X1"
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.verticalCenter: x1Field.verticalCenter
                    font.pixelSize: 18
                    color: "#ffffff"
                }

                FieldCustom {
                     id: x2Field
                     anchors.top: parent.top
                     anchors.right: parent.right
                     anchors.rightMargin: 20
                     validator: RegExpValidator{
                         regExp: /^-?(100(\.0{1,5})?|[1-9][0-9]?(\.[0-9]{1,5})?|0(\.[0-9]{1,5})?)$/
                     }
                }
                Text {
                    text: "X2"
                    anchors.right: x2Field.left
                    anchors.rightMargin: 20
                    anchors.verticalCenter: x2Field.verticalCenter
                    font.pixelSize: 18
                    color: "#ffffff"
                }

                FieldCustom {
                     id: y1Field
                     anchors.top: x1Field.top
                     anchors.left: textY1.right
                     anchors.leftMargin: 20
                     validator: RegExpValidator{
                         regExp: /^-?(100(\.0{1,5})?|[1-9][0-9]?(\.[0-9]{1,5})?|0(\.[0-9]{1,5})?)$/
                     }
                }
                Text {
                    id: textY1
                    text: "Y1"
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.verticalCenter: y1Field.verticalCenter
                    font.pixelSize: 18
                    color: "#ffffff"
                }

                FieldCustom {
                     id: y2Field
                     anchors.top: x2Field.top
                     anchors.right: parent.right
                     anchors.rightMargin: 20
                     validator: RegExpValidator{
                         regExp: /-^?(100(\.0{1,5})?|[1-9][0-9]?(\.[0-9]{1,5})?|0(\.[0-9]{1,5})?)$/
                     }
                }
                Text {
                    text: "Y2"
                    anchors.right: y2Field.left
                    anchors.rightMargin: 20
                    anchors.verticalCenter: y2Field.verticalCenter
                    font.pixelSize: 18
                    color: "#ffffff"
                }

                FieldCustom {
                     id: r1Field
                     anchors.top: y1Field.top
                     anchors.left: textR1.right
                     anchors.leftMargin: 20
                     validator: RegExpValidator{
                         regExp: /^(100(\.0{1,5})?|[1-9][0-9]?(\.[0-9]{1,5})?|0(\.[0-9]{1,5})?)$/
                     }
                }


                Text {
                    id: textR1
                    text: "R1"
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.verticalCenter: r1Field.verticalCenter
                    font.pixelSize: 18
                    color: "#ffffff"
                }
                FieldCustom {
                     id: r2Field
                     anchors.top: y2Field.top
                     anchors.right: parent.right
                     anchors.rightMargin: 20
                     validator: RegExpValidator{
                         regExp: /^(100(\.0{1,5})?|[1-9][0-9]?(\.[0-9]{1,5})?|0(\.[0-9]{1,5})?)$/
                     }
                }
                Text {
                    id: textR2
                    text: "R2"
                    anchors.right: r2Field.left
                    anchors.rightMargin: 20
                    anchors.verticalCenter: r2Field.verticalCenter
                    font.pixelSize: 18
                    color: "#ffffff"
                }



                Text {
                    id: x1Text
                    anchors.top: r2Field.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.topMargin: 20
                    font.pixelSize: 18
                    text: "X1: "
                    color: "#ffffff"
                }

                Text {
                    id: y1Text
                    anchors.top: x1Text.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.topMargin: 20
                    font.pixelSize: 18
                    text: "Y1: "
                    color: "#ffffff"
                }

                Text {
                    id: x2Text
                    anchors.bottom: x1Text.bottom
                    anchors.left: textR2.left
                    font.pixelSize: 18
                    text: "X2: "
                    color: "#ffffff"
                }

                Text {
                    id: y2Text
                    anchors.left: x2Text.left
                    anchors.bottom: y1Text.bottom
                    font.pixelSize: 18
                    text: "Y2: "
                    color: "#ffffff"
                }

                Button {
                    id: startButton
                    anchors.top: y2Text.bottom
                    anchors.left: r1Field.left
                    anchors.right: r2Field.right
                    anchors.topMargin: 20
                    height: 40
                    background: Rectangle {
                        color: root.isProcessing ? "#232c37" : "#182433"
                        radius: 5
                        Text {
                            font.pixelSize: 18
                            text: "Начать чтение файла"
                            color: root.isProcessing ? "#b9bfc6" : "#ffffff"
                            anchors.centerIn: parent
                        }
                    }
                    hoverEnabled: true

                    MouseArea {
                           anchors.fill: parent
                           cursorShape: Qt.PointingHandCursor
                           enabled: !root.isProcessing
                           onClicked: {
                               if (x1Field.text !== "" && y1Field.text !== "" && r1Field.text !== "" &&
                                   x2Field.text !== "" && y2Field.text !== "" && r2Field.text !== ""){
                                    root.isProcessing = true;
                                    parser.writeValue(x1Field.text, y1Field.text, r1Field.text, x2Field.text, y2Field.text, r2Field.text)
                                    root.isProcessing = false;
                               }
                           }
                       }

                    signal writeValue(string value, string value, string value, string value, string value, string value)
                }

                Button {
                    id: resetButton
                    anchors.top: startButton.bottom
                    anchors.topMargin: 20
                    anchors.left: r1Field.left
                    anchors.right: r2Field.right
                    height: 40
                    background: Rectangle {
                        anchors.fill: parent
                        color: root.isProcessing ? "#232c37" : "#182433"
                        radius: 5
                        Text {
                            font.pixelSize: 18
                            text: "Сбросить положение манипуляторов"
                            color: root.isProcessing ? "#b9bfc6" : "#ffffff"
                            anchors.centerIn: parent
                        }
                    }
                    hoverEnabled: true

                    MouseArea {
                           enabled: !root.isProcessing
                           anchors.fill: parent
                           cursorShape: Qt.PointingHandCursor
                           onClicked: {
                                    parser.resetBasic()
                                }
                       }
                    signal resetBasic()
                    }
                }
            Connections {
                target: parser

                onSendCoords: {
                    x1Text.text = "X1: " + x1
                    y1Text.text = "Y1: " + y1
                    x2Text.text = "X2: " + x2
                    y2Text.text = "Y2: " + y2
                }
            }
    }
}

