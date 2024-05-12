import
  std/strformat,
  std/strutils,
  std/random,
  happyx

export strformat


proc px*(val: SomeNumber): string = $val.float & "px"
proc em*(val: SomeNumber): string = $val.float & "em"
proc vw*(val: SomeNumber): string = $val.float & "vw"
proc vh*(val: SomeNumber): string = $val.float & "vh"
proc pt*(val: SomeNumber): string = $val.float & "pt"
proc deg*(val: SomeNumber): string = $val.float & "deg"
proc rad*(val: SomeNumber): string = $val.float & "rad"
proc turn*(val: SomeNumber): string = $val.float & "turn"
proc rem*(val: SomeNumber): string = $val.float & "rem"


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


proc indexOf*(self: Modifier, key: string): int =
  for i in 0..self.style.high:
    if key & ":" in self.style[i]:
      return i
  return -1


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


proc rotate*(self: Modifier, x, y, z: bool, value: string): Modifier =
  let i = self.indexOf("transform")
  if i != -1:
    self.style[i] &= fmt" rotate({x.int} {y.int} {z.int} {value})"
  else:
    self.style.add(fmt"transform: rotate({x.int} {y.int} {z.int} {value})")
  self
proc rotate*(self: Modifier, value: string): Modifier =
  let i = self.indexOf("transform")
  if i != -1:
    self.style[i] &= fmt" rotate({value})"
  else:
    self.style.add(fmt"transform: rotate({value})")
  self
proc rotate3d*(self: Modifier, x, y, z: string): Modifier =
  let i = self.indexOf("transform")
  if i != -1:
    self.style[i] &= fmt" rotate3d({x} {y} {z})"
  else:
    self.style.add(fmt"transform: rotate3d({x} {y} {z})")
  self
proc rotateX*(self: Modifier, value: string): Modifier =
  let i = self.indexOf("transform")
  if i != -1:
    self.style[i] &= fmt" rotateX({value})"
  else:
    self.style.add(fmt"transform: rotateX({value})")
  self
proc rotateY*(self: Modifier, value: string): Modifier =
  let i = self.indexOf("transform")
  if i != -1:
    self.style[i] &= fmt" rotateY({value})"
  else:
    self.style.add(fmt"transform: rotateY({value})")
  self
proc rotateZ*(self: Modifier, value: string): Modifier =
  let i = self.indexOf("transform")
  if i != -1:
    self.style[i] &= fmt" rotateY({value})"
  else:
    self.style.add(fmt"transform: rotateZ({value})")
  self


proc translate*(self: Modifier, x, y: string): Modifier =
  let i = self.indexOf("transform")
  if i != -1:
    self.style[i] &= fmt" translate({x} {y})"
  else:
    self.style.add(fmt"transform: translate({x} {y})")
  self
proc translate3d*(self: Modifier, x, y, z: string): Modifier =
  let i = self.indexOf("transform")
  if i != -1:
    self.style[i] &= fmt" translate3d({x} {y} {z})"
  else:
    self.style.add(fmt"transform: translate3d({x} {y} {z})")
  self
proc translateX*(self: Modifier, value: string): Modifier =
  let i = self.indexOf("transform")
  if i != -1:
    self.style[i] &= fmt" translateX({value})"
  else:
    self.style.add(fmt"transform: translateX({value})")
  self
proc translateY*(self: Modifier, value: string): Modifier =
  let i = self.indexOf("transform")
  if i != -1:
    self.style[i] &= fmt" translateY({value})"
  else:
    self.style.add(fmt"transform: translateY({value})")
  self
proc translateZ*(self: Modifier, value: string): Modifier =
  let i = self.indexOf("transform")
  if i != -1:
    self.style[i] &= fmt" translateZ({value})"
  else:
    self.style.add(fmt"transform: translateZ({value})")
  self


proc scale*(self: Modifier, x, y: string): Modifier =
  let i = self.indexOf("transform")
  if i != -1:
    self.style[i] &= fmt" scale({x} {y})"
  else:
    self.style.add(fmt"transform: scale({x} {y})")
  self
proc scale3d*(self: Modifier, x, y, z: string): Modifier =
  let i = self.indexOf("transform")
  if i != -1:
    self.style[i] &= fmt" scale3d({x} {y} {z})"
  else:
    self.style.add(fmt"transform: scale3d({x} {y} {z})")
  self
proc scaleX*(self: Modifier, value: string): Modifier =
  let i = self.indexOf("transform")
  if i != -1:
    self.style[i] &= fmt" scaleX({value})"
  else:
    self.style.add(fmt"transform: scaleX({value})")
  self
proc scaleY*(self: Modifier, value: string): Modifier =
  let i = self.indexOf("transform")
  if i != -1:
    self.style[i] &= fmt" scaleY({value})"
  else:
    self.style.add(fmt"transform: scaleY({value})")
  self
proc scaleZ*(self: Modifier, value: string): Modifier =
  let i = self.indexOf("transform")
  if i != -1:
    self.style[i] &= fmt" scaleZ({value})"
  else:
    self.style.add(fmt"transform: scaleZ({value})")
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