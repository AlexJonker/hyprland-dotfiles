import QtQuick 2.15
import QtQuick.Controls 2.15
import SddmComponents 2.0

Column {
    id: clock
    spacing: 0


    anchors {
      margins: 10
      top: parent.top
      left: parent.horizontalCenter
      right: parent.horizontalCenter
    }

    Label {
        id: timeLabel
        anchors.horizontalCenter: parent.horizontalCenter
        color: config.text
        renderType: Text.QtRendering
        font.family: config.Font
        font.pixelSize: 100
        function updateTime() {
            text = new Date().toLocaleTimeString(Qt.locale(config.Locale), config.HourFormat == "long" ? Locale.LongFormat : config.HourFormat !== "" ? config.HourFormat : Locale.ShortFormat)
        }
    }

    Label {
        id: dateLabel
        anchors.horizontalCenter: parent.horizontalCenter
        color: config.text
        renderType: Text.QtRendering
        font.family: config.Font
        font.pixelSize: 50
        function updateTime() {
            text = new Date().toLocaleDateString(Qt.locale(config.Locale), config.DateFormat == "short" ? Locale.ShortFormat : config.DateFormat !== "" ? config.DateFormat : Locale.LongFormat)
        }
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            dateLabel.updateTime()
            timeLabel.updateTime()
        }
    }

    Component.onCompleted: {
        dateLabel.updateTime()
        timeLabel.updateTime()
    }
}

/*
import QtQuick 2.15
import SddmComponents 2.0

Clock {
  id: time
  color: config.text
  timeFont.family: config.Font
  dateFont.family: config.Font
  anchors {
    margins: 10
    top: parent.top
    left: parent.horizontalCenter
    right: parent.horizontalCenter
  }
}
*/