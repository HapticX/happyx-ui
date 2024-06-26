import
  std/dom

type
  OnInput* = proc(text: string): void
  OnFocus* = proc(el: Element): void
  OnBlur* = proc(el: Element): void
  OnClick* = proc(): void
  OnToggle* = proc(value: bool): void
  OnSelect* = proc(value: int): void


const
  defOnInput* = proc(text: string) = discard
  defOnFocus* = proc(el: Element) = discard
  defOnBlur* = proc(el: Element) = discard
  defOnToggle* = proc(value: bool) = discard
  defOnSelect* = proc(value: int) = discard
  defOnClick* = proc() = discard
