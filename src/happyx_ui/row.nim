import
  happyx,
  ./core


proc Row*(spacing: string = "0", justifyContent: string = "start", alignItems: string = "start",
          modifier: Modifier = initModifier(), class: string = "", stmt: TagRef = nil): TagRef =
  buildHtml:
    tDiv(class = "hpx-row " & class, style = modifier.build()):
      if not stmt.isNil:
        stmt
    tStyle: {fmt("""
      div.hpx-row {
        display: flex;
        gap: <spacing>;
        justify-content: <justifyContent>;
        align-items: <alignItems>;
      }
    """, '<', '>')}
