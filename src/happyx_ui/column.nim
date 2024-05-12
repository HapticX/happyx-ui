import
  happyx,
  ./core


proc Column*(spacing: string = "0", justifyContent: string = "start", alignItems: string = "start",
             modifier: Modifier = initModifier(), class: string = "", stmt: TagRef = nil): TagRef =
  buildHtml:
    tDiv(class = "hpx-column " & class, style = modifier.build()):
      if not stmt.isNil:
        stmt
    tStyle: {fmt("""
      div.hpx-column {
        display: flex;
        flex-direction: column;
        gap: <spacing>;
        justify-content: <justifyContent>;
        align-items: <alignItems>;
      }
    """, '<', '>')}
