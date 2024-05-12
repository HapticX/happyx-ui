import
  happyx,
  ./core,
  ./colors


proc Progress*(modifier: Modifier = initModifier(), class: string = "",
               state: State[int] = nil, maxVal: int = 100, stmt: TagRef = nil): TagRef =
  let w =
    if not state.isNil:
      state.val / maxVal
    else:
      0.0
  buildHtml:
    tDiv(class = fmt"hpx-progress-back {class}"):
      tDiv(class = fmt"hpx-progress {class}")
    tStyle: {fmt("""
      div.hpx-progress {
        position: absolute;
        width: <w * 100.0>%;
        height: 100%;
        background-color: <PRIMARY_HOVER_COLOR>;
      }
      div.hpx-progress-back {
        position: relative;
        background-color: <PRIMARY_ACTIVE_COLOR>;
        width: 256px;
        height: 6px;
        overflow: hidden;
        border-radius: 1rem;
      }
    """, '<', '>')}
