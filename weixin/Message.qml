import QtQuick 2.0
import Ubuntu.Components 1.1


Item {
    id: root

    property int contentWidth: width *.6

    ListModel {
        id: balloonModel
    }

    ListView {
        id: balloonView
        anchors.bottom: controls.top
        anchors.bottomMargin: 2
        anchors.top: parent.top
        clip:true

        delegate: MyDelegate {}

        model: balloonModel
        spacing: units.gu(4)
        width: parent.width
    }

    Rectangle {
        id: controls

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 1
        anchors.right: parent.right
        border.width: 2
        color: "white"
        height: parent.height * 0.15

        Text {
            anchors.centerIn: parent
            text: "Add another balloon"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                balloonModel.append({"balloonWidth": Math.floor(Math.random() * 200 + 100),
                                     "content": "this is cool"
                                     })
                balloonView.positionViewAtIndex(balloonView.count -1, ListView.End)
            }
            onEntered: {
                parent.color = "#8ac953"
            }
            onExited: {
                parent.color = "white"
            }
        }
    }

    Component.onCompleted: {
        console.log("contentWidth: " + root.contentWidth);
        balloonModel.append({"balloonWidth": root.contentWidth,
                             "content": "this is a text, this is a perfect world to play with, and I love to play the world"
                             });
        balloonModel.append({"balloonWidth": root.contentWidth,
                             "content": "this is a text, this is a perfect world to play with, and I love to play the world"
                             });

    }
}
