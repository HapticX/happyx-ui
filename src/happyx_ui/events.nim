import
  std/dom

type
  OnInput* = proc(text: string): void
  OnFocus* = proc(el: Element): void
  OnBlur* = proc(el: Element): void
  OnClick* = proc(): void


const
  defOnInput* = proc(text: string) = discard
  defOnFocus* = proc(el: Element) = discard
  defOnBlur* = proc(el: Element) = discard
  defOnClick* = proc() = discard
