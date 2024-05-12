import
  happyx,
  ./core


proc Box*(horizontal: string = "start", vertical: string = "start",
          modifier: Modifier = initModifier(), class: string = "", stmt: TagRef = nil): TagRef =
  if not stmt.isNil:
    for i in stmt.childNodes:
      echo i
      i.style.position = "absolute"
      echo i
  let id = uid()
  buildHtml:
    tDiv(class = fmt"hpx-box-{id} {class}", style = modifier.build()):
      if not stmt.isNil:
        stmt
    tStyle: {fmt("""
      div.hpx-box-<id> {
        display: flex;
        position: relative;
        justify-content: <horizontal>;
        align-items: <vertical>;
      }
    """, '<', '>')}


proc Column*(spacing: string = "0", horizontal: string = "start", vertical: string = "start",
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
        justify-content: <vertical>;
        align-items: <horizontal>;
      }
    """, '<', '>')}


proc Row*(spacing: string = "0", horizontal: string = "start", vertical: string = "start",
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
        justify-content: <horizontal>;
        align-items: <vertical>;
      }
    """, '<', '>')}
