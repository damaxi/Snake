import QtQuick 2.6
import QtQuick.Templates 2.0 as T

T.Button {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             contentItem.implicitHeight + topPadding + bottomPadding)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    font { pixelSize: 25; family: "Lucida Console"; }
    padding: 6
    hoverEnabled: true
    leftPadding: padding + 2
    rightPadding: padding + 2

    //! [contentItem]
    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled || control.highlighted || control.checked || control.hovered ? 1 : 0.3
        color: control.checked || control.highlighted || control.hovered ? "#ffffff" : (control.visualFocus ? "#0066ff" : (control.down ? "#26282a" : "#353637"))
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
    //! [contentItem]

    //! [background]
    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 40
        radius: 8
        opacity: enabled ? 1 : 0.3
        visible: !control.flat || control.down || control.checked || control.highlighted
        color: control.checked || control.highlighted || control.hovered ?
            (control.visualFocus ? (control.down ? "#599bff" : "#0066ff") : (control.down ? "#26C6DA" : "#00838F")) :
            (control.visualFocus ? (control.down ? "#cce0ff" : "#f0f6ff") : (control.down ? "#d0d0d0" : "#80DEEA"))
        border.color: "#006064"
        border.width: control.visualFocus ? 2 : 0
    }
    //! [background]
}
