import
  happyx,
  ./core


proc Box*(horizontal: string = "start", vertical: string = "start",
          modifier: Modifier = initModifier(), class: string = "", stmt: TagRef = nil): TagRef =
  if not stmt.isNil:
    for i in stmt.childNodes:
      i.style.position = "absolute"
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


proc Column*(spacing: string = "4px", horizontal: string = "start", vertical: string = "start",
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


proc Row*(spacing: string = "4px", horizontal: string = "start", vertical: string = "start",
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


proc Grid*(hSpacing: string = "4px", vSpacing: string = "4px", horizontal: string = "start",
           vertical: string = "start", cols: int = -1, rows: int = -1,
           modifier: Modifier = initModifier(), class: string = "",
           stmt: TagRef = nil): TagRef =
  let
    id = uid()
    colsCss =
      if cols != -1:
        fmt"grid-template-columns: repeat({cols}, minmax(0, 1fr));"
      else:
        ""
    rowsCss =
      if cols != -1:
        fmt"grid-template-rows: repeat({rows}, minmax(0, 1fr));"
      else:
        ""
  buildHtml:
    tDiv(class = fmt"hpx-grid-{id} {class}", style = modifier.build()):
      if not stmt.isNil:
        stmt
    tStyle: {fmt("""
      div.hpx-grid-<id> {
        display: grid;
        <colsCss>
        <rowsCss>
        column-gap: <hSpacing>;
        row-gap: <vSpacing>;
        justify-content: <horizontal>;
        align-items: <vertical>;
      }
    """, '<', '>')}


proc ChildModifier*(modifier: Modifier, stmt: TagRef): TagRef =
  let style: cstring = cstring(modifier.build())
  for i in stmt.childNodes:
    {.emit: "`i`.style.cssText += `style`".}
  stmt
