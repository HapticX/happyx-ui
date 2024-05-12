import
  happyx,
  ./core


proc Row*(spacing: string = "0", justifyContent: string = "start", alignItems: string = "start",
          modifier: Modifier = initModifier(), class: string = "", stmt: TagRef = nil): TagRef =
  let id = uid()
  buildHtml:
    tDiv(class = fmt"hpx-row-{id} {class}", style = modifier.build()):
      if not stmt.isNil:
        stmt
    tStyle: {fmt("""
      div.hpx-row-<id> {
        display: flex;
        gap: <spacing>;
        justify-content: <justifyContent>;
        align-items: <alignItems>;
      }
    """, '<', '>')}
