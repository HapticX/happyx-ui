import
  happyx,
  ./core,
  ./colors


let style = buildHtml:
  tStyle: {fmt("""
    .hpx-tag {
      display: flex;
      border-radius: .3rem;
      border: 2px <PRIMARY_COLOR> solid;
      background-color: <PRIMARY_COLOR>70;
      color: <FOREGROUND_COLOR>;
      transition: all;
      transition-duration: .3s;
      white-space: nowrap;
      padding: .05rem .1rem;
      cursor: default;
    }
    .hpx-tag:hover {
      border-color: <PRIMARY_HOVER_COLOR>;
      background-color: <PRIMARY_HOVER_COLOR>70;
    }
    .hpx-tag:active {
      border-color: <PRIMARY_ACTIVE_COLOR>;
      background-color: <PRIMARY_ACTIVE_COLOR>70;
    }
  """, '<', '>')}
document.head.appendChild(style.children[0])


proc Tag*(text: string = "", modifier: Modifier = initModifier(),
          class: string = "", stmt: TagRef = nil): TagRef =
  buildHtml:
    tDiv(class = "hpx-tag {class}"):
      if text.len > 0:
        {text}
      elif not stmt.isNil:
        stmt
