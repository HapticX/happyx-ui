import
  happyx,
  ./core


proc Column*(spacing: string = "0", justifyContent: string = "start", alignItems: string = "start",
             modifier: Modifier = initModifier(), class: string = "", stmt: TagRef = nil): TagRef =
  let id = uid()
  buildHtml:
    tDiv(class = fmt"hpx-column-{id} {class}", style = modifier.build()):
      if not stmt.isNil:
        stmt
    tStyle: {fmt("""
      div.hpx-column-<id> {
        display: flex;
        flex-direction: column;
        gap: <spacing>;
        justify-content: <justifyContent>;
        align-items: <alignItems>;
      }
    """, '<', '>')}
