import
  std/strformat,
  std/strutils,
  happyx


proc px*(val: SomeNumber): string = $val.float & "px"
proc em*(val: SomeNumber): string = $val.float & "em"
proc rem*(val: SomeNumber): string = $val.float & "rem"
proc vw*(val: int): string = $val & "vw"
proc vh*(val: int): string = $val & "vh"


type
  Modifier* = ref object
    style*: seq[string]


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
proc bacgkroundColor*(self: Modifier, value: string): Modifier =
  self.style.add(fmt"bacgkround-color: {value}")
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


proc build*(self: Modifier): string =
  self.style.join(";")
proc build*(self: State[Modifier]): string =
  self.val.style.join(";")
