import QtQuick 2.0
import TextBalloon 1.0
import Ubuntu.Components 1.1
import QtQuick.Layouts 1.1

Item {
    id: delegate
    width: ListView.view.width
    height: txt.contentHeight + 20
    property bool rightAligned: index % 2 == 0 ? false : true

    RowLayout {
        spacing: units.gu(2)
        anchors.right: index % 2 == 0 ? undefined : parent.right

        Image {
            id: leftImg
            width: root.contentWidth*.2
            height: width
            anchors.top:parent.top
            source: "images/pic1.jpg"
            visible: delegate.rightAligned ? false : true
            fillMode: Image.PreserveAspectCrop
            Layout.maximumWidth:root.contentWidth*.2
            Layout.maximumHeight: root.contentWidth*.2
        }

        Text {
            id: txt
            anchors.top: parent.top
            anchors.topMargin: units.gu(1)
            width: root.contentWidth
            wrapMode: Text.WordWrap
            text: content
//            horizontalAlignment: delegate.rightAligned ? Text.AlignRight : Text.AlignLeft
            font.pixelSize: units.gu(3)

            Layout.maximumWidth: root.contentWidth

            TextBalloon {
                anchors.fill: parent
                z: -1
                rightAligned: delegate.rightAligned
                anchors.margins: -units.gu(1.5)
            }
        }

        Image {
            id: rightImg
            anchors.top:parent.top
            width: root.contentWidth*.2
            height: width
            source: "images/pic2.jpg"
            visible: delegate.rightAligned ? true : false
            fillMode: Image.PreserveAspectCrop
            Layout.maximumWidth:root.contentWidth*.2
            Layout.maximumHeight: root.contentWidth*.2
        }
    }
}

