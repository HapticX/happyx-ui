import
  std/strformat,
  std/strutils,
  std/random,
  happyx

export strformat


proc px*(val: SomeNumber): string = $val.float & "px"
proc em*(val: SomeNumber): string = $val.float & "em"
proc rem*(val: SomeNumber): string = $val.float & "rem"
proc vw*(val: int): string = $val & "vw"
proc vh*(val: int): string = $val & "vh"


proc uid*: string =
  result = "c"
  for i in 0..4: result &= $rand(0..9)
  result &= "-"
  for i in 0..16: result &= $rand(0..9)


type
  Modifier* = ref object
    style*: seq[string]
  Cursor = enum
    Default = "cursor"
    Pointer = "pointer"
    Help = "help"
    ContextMenu = "context-menu"
    Progress = "progress"
    Wait = "wait"
    Cell = "cell"
    Crosshair = "crosshair"
    Text = "text"
    VerticalText = "vertical-text"
    Alias = "alias"
    Copy = "copy"
    Move = "move"
    NoDrop = "no-drop"
    NotAllowed = "not-allowed"
    Grab = "grab"
    Grabbing = "grabbing"
    AllScroll = "all-scroll"
    ColResize = "col-resize"
    RowResize = "row-resize"
    NResize = "n-resize"
    SResize = "s-resize"
    WResize = "w-resize"
    EResize = "e-resize"
    NeResize = "ne-resize"
    NwResize = "nw-resize"
    SeResize = "se-resize"
    SwResize = "sw-resize"
    EwResize = "ew-resize"
    NsResize = "ns-resize"
    NeswResize = "nesw-resize"
    NwseResize = "nwse-resize"
    ZoomIn = "zoom-in"
    ZoomOut = "zoom-out"
  DropShadow = enum
    XM = "filter: drop-shadow(0 1px 1px rgb(0 0 0 / 0.05));"
    Default = "drop-shadow	filter: drop-shadow(0 1px 2px rgb(0 0 0 / 0.1)) drop-shadow(0 1px 1px rgb(0 0 0 / 0.06));"
    MD = "filter: drop-shadow(0 4px 3px rgb(0 0 0 / 0.07)) drop-shadow(0 2px 2px rgb(0 0 0 / 0.06));"
    LG = "filter: drop-shadow(0 10px 8px rgb(0 0 0 / 0.04)) drop-shadow(0 4px 3px rgb(0 0 0 / 0.1));"
    XL = "filter: drop-shadow(0 20px 13px rgb(0 0 0 / 0.03)) drop-shadow(0 8px 5px rgb(0 0 0 / 0.08));"
    XXL = "filter: drop-shadow(0 25px 25px rgb(0 0 0 / 0.15));"


proc initModifier*: Modifier =
  Modifier(style: @[])


proc padding*(self: Modifier, left, top, right, bottom: string): Modifier =
  self.style.add(fmt"padding: {top} {right} {bottom} {left}")
  self
proc padding*(self: Modifier, x, y: string): Modifier =
  self.style.add(fmt"padding: {y} {x}")
  self
proc padding*(self: Modifier, value: string): Modifier =
  self.style.add(fmt"padding: {value}")
  self


proc margin*(self: Modifier, left, top, right, bottom: string): Modifier =
  self.style.add(fmt"margin: {top} {right} {bottom} {left}")
  self
proc margin*(self: Modifier, x, y: string): Modifier =
  self.style.add(fmt"margin: {y} {x}")
  self
proc margin*(self: Modifier, value: string): Modifier =
  self.style.add(fmt"margin: {value}")
  self


proc width*(self: Modifier, value: string): Modifier =
  self.style.add(fmt"width: {value}")
  self
proc height*(self: Modifier, value: string): Modifier =
  self.style.add(fmt"height: {value}")
  self
proc background*(self: Modifier, value: string): Modifier =
  self.style.add(fmt"background: {value}")
  self
proc backgroundColor*(self: Modifier, value: string): Modifier =
  self.style.add(fmt"background-color: {value}")
  self
proc borderRadius*(self: Modifier, value: string): Modifier =
  self.style.add(fmt"border-radius: {value}")
  self
proc borderColor*(self: Modifier, value: string): Modifier =
  self.style.add(fmt"border-color: {value}")
  self
proc borderWidth*(self: Modifier, value: string): Modifier =
  self.style.add(fmt"border-width: {value}")
  self
proc borderStyle*(self: Modifier, value: string): Modifier =
  self.style.add(fmt"border-style: {value}")
  self
proc textColor*(self: Modifier, value: string): Modifier =
  self.style.add(fmt"color: {value}")
  self
proc fontSize*(self: Modifier, value: string): Modifier =
  self.style.add(fmt"font-size: {value}")
  self
proc dropShadow*(self: Modifier, size: string, color: string = "#000000"): Modifier =
  self.style.add(fmt"filter: drop-shadow(0 0 {size} {color});")
  self
proc dropShadow*(self: Modifier, size: DropShadow): Modifier =
  self.style.add($size)
  self
proc cursor(self: Modifier, cursor: string): Modifier =
  self.style.add(fmt"cursor: {cursor}")
  self
proc cursor(self: Modifier, cursor: Cursor): Modifier =
  self.style.add(fmt"cursor: {cursor}")
  self


# Positions
proc absolute*(self: Modifier): Modifier =
  self.style.add("position: absolute")
  self
proc relative*(self: Modifier): Modifier =
  self.style.add("position: relative")
  self
proc fixed*(self: Modifier): Modifier =
  self.style.add("position: fixed")
  self
proc sticky*(self: Modifier): Modifier =
  self.style.add("position: sticky")
  self


proc build*(self: Modifier): string =
  self.style.join(";")
proc build*(self: State[Modifier]): string =
  self.val.style.join(";")
