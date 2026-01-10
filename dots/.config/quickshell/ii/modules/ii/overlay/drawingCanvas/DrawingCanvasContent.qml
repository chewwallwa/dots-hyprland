import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import qs.modules.common
import qs.modules.common.widgets

Rectangle {
    id: root
    required property real radius
    required property bool isClickthrough
    
    color: Appearance.colors.colLayer2Base
    radius: root.radius
    clip: true
    
    property string currentTool: "pen"  // "pen" or "eraser"
    property color currentColor: "#000000"
    property real currentThickness: 3
    property var strokes: []
    
    function clearCanvas() {
        strokes = []
        canvas.requestPaint()
    }
    
    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        
        // Toolbar
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            color: Appearance.colors.colLayer1Base
            
            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 8
                
                // Pen tool button
                ToolButton {
                    materialSymbol: "edit"
                    text: "Pen"
                    isActive: root.currentTool === "pen"
                    onClicked: root.currentTool = "pen"
                }
                
                // Eraser tool button
                ToolButton {
                    materialSymbol: "ink_eraser"
                    text: "Eraser"
                    isActive: root.currentTool === "eraser"
                    onClicked: root.currentTool = "eraser"
                }
                
                Rectangle {
                    Layout.preferredWidth: 1
                    Layout.fillHeight: true
                    Layout.topMargin: 4
                    Layout.bottomMargin: 4
                    color: Appearance.colors.colOutlineVariant
                }
                
                // Color picker
                StyledText {
                    text: "Color:"
                    Layout.alignment: Qt.AlignVCenter
                }
                
                ColorButton {
                    color: "#000000"
                    onClicked: root.currentColor = color
                    isActive: root.currentColor === color
                }
                ColorButton {
                    color: "#ff0000"
                    onClicked: root.currentColor = color
                    isActive: root.currentColor === color
                }
                ColorButton {
                    color: "#00ff00"
                    onClicked: root.currentColor = color
                    isActive: root.currentColor === color
                }
                ColorButton {
                    color: "#0000ff"
                    onClicked: root.currentColor = color
                    isActive: root.currentColor === color
                }
                ColorButton {
                    color: "#ffff00"
                    onClicked: root.currentColor = color
                    isActive: root.currentColor === color
                }
                ColorButton {
                    color: "#ff00ff"
                    onClicked: root.currentColor = color
                    isActive: root.currentColor === color
                }
                ColorButton {
                    color: "#00ffff"
                    onClicked: root.currentColor = color
                    isActive: root.currentColor === color
                }
                ColorButton {
                    color: "#ffffff"
                    onClicked: root.currentColor = color
                    isActive: root.currentColor === color
                }
                
                Rectangle {
                    Layout.preferredWidth: 1
                    Layout.fillHeight: true
                    Layout.topMargin: 4
                    Layout.bottomMargin: 4
                    color: Appearance.colors.colOutlineVariant
                }
                
                // Thickness control
                StyledText {
                    text: "Size:"
                    Layout.alignment: Qt.AlignVCenter
                }
                
                StyledSlider {
                    Layout.preferredWidth: 100
                    from: 1
                    to: 20
                    value: root.currentThickness
                    stepSize: 1
                    onValueChanged: root.currentThickness = value
                }
                
                StyledText {
                    text: Math.round(root.currentThickness)
                    Layout.preferredWidth: 20
                    Layout.alignment: Qt.AlignVCenter
                }
                
                Item {
                    Layout.fillWidth: true
                }
                
                // Clear button
                RippleButton {
                    text: "Clear"
                    Layout.preferredHeight: 34
                    onClicked: root.clearCanvas()
                }
            }
        }
        
        // Canvas area
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#ffffff"
            
            Canvas {
                id: canvas
                anchors.fill: parent
                
                property var currentPath: null
                
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.clearRect(0, 0, width, height)
                    
                    // Draw all completed strokes
                    for (var i = 0; i < root.strokes.length; i++) {
                        var stroke = root.strokes[i]
                        if (stroke.points.length < 2) continue
                        
                        ctx.strokeStyle = stroke.color
                        ctx.lineWidth = stroke.thickness
                        ctx.lineCap = "round"
                        ctx.lineJoin = "round"
                        
                        if (stroke.tool === "eraser") {
                            ctx.globalCompositeOperation = "destination-out"
                        } else {
                            ctx.globalCompositeOperation = "source-over"
                        }
                        
                        ctx.beginPath()
                        ctx.moveTo(stroke.points[0].x, stroke.points[0].y)
                        
                        for (var j = 1; j < stroke.points.length; j++) {
                            ctx.lineTo(stroke.points[j].x, stroke.points[j].y)
                        }
                        
                        ctx.stroke()
                    }
                    
                    // Draw current stroke being drawn
                    if (canvas.currentPath && canvas.currentPath.points.length >= 2) {
                        ctx.strokeStyle = canvas.currentPath.color
                        ctx.lineWidth = canvas.currentPath.thickness
                        ctx.lineCap = "round"
                        ctx.lineJoin = "round"
                        
                        if (canvas.currentPath.tool === "eraser") {
                            ctx.globalCompositeOperation = "destination-out"
                        } else {
                            ctx.globalCompositeOperation = "source-over"
                        }
                        
                        ctx.beginPath()
                        ctx.moveTo(canvas.currentPath.points[0].x, canvas.currentPath.points[0].y)
                        
                        for (var k = 1; k < canvas.currentPath.points.length; k++) {
                            ctx.lineTo(canvas.currentPath.points[k].x, canvas.currentPath.points[k].y)
                        }
                        
                        ctx.stroke()
                    }
                }
                
                MouseArea {
                    anchors.fill: parent
                    enabled: !root.isClickthrough
                    acceptedButtons: Qt.LeftButton
                    
                    onPressed: (mouse) => {
                        if (root.isClickthrough) return
                        
                        canvas.currentPath = {
                            tool: root.currentTool,
                            color: root.currentColor,
                            thickness: root.currentThickness,
                            points: [{ x: mouse.x, y: mouse.y }]
                        }
                    }
                    
                    onPositionChanged: (mouse) => {
                        if (root.isClickthrough) return
                        if (!canvas.currentPath) return
                        
                        // Add point to current path and request repaint
                        canvas.currentPath.points.push({ x: mouse.x, y: mouse.y })
                        canvas.requestPaint()
                    }
                    
                    onReleased: {
                        if (root.isClickthrough) return
                        if (!canvas.currentPath) return
                        
                        // Finalize the stroke by adding it to permanent strokes
                        var newStrokes = root.strokes.slice()
                        newStrokes.push(canvas.currentPath)
                        root.strokes = newStrokes
                        
                        canvas.currentPath = null
                        canvas.requestPaint()
                    }
                }
            }
        }
    }
    
    // Tool button component
    component ToolButton: RippleButton {
        id: toolBtn
        required property string materialSymbol
        required property bool isActive
        
        Layout.preferredHeight: 34
        Layout.preferredWidth: 70
        
        colBackground: isActive ? Appearance.colors.colPrimaryContainer : Appearance.colors.colLayer2Base
        colBackgroundHover: isActive ? Appearance.colors.colPrimaryContainerHover : Appearance.colors.colLayer2BaseHover
        colRipple: isActive ? Appearance.colors.colPrimaryContainerActive : Appearance.colors.colLayer2BaseActive
        
        contentItem: RowLayout {
            spacing: 4
            
            MaterialSymbol {
                text: toolBtn.materialSymbol
                iconSize: 16
                Layout.alignment: Qt.AlignVCenter
                color: toolBtn.isActive ? Appearance.colors.colOnPrimaryContainer : Appearance.colors.colOnSurface
            }
            
            StyledText {
                text: toolBtn.text
                Layout.alignment: Qt.AlignVCenter
                font.pixelSize: 12
                color: toolBtn.isActive ? Appearance.colors.colOnPrimaryContainer : Appearance.colors.colOnSurface
            }
        }
    }
    
    // Color button component
    component ColorButton: Rectangle {
        id: colorBtn
        required property color color
        required property bool isActive
        signal clicked()
        
        Layout.preferredWidth: 24
        Layout.preferredHeight: 24
        radius: 12
        color: colorBtn.color
        border.color: colorBtn.isActive ? Appearance.colors.colPrimary : Appearance.colors.colOutlineVariant
        border.width: colorBtn.isActive ? 3 : 1
        
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: colorBtn.clicked()
        }
    }
}
