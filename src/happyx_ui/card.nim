import
  happyx,
  ./core,
  ./colors


let style = buildHtml:
  tStyle:
    {fmt("""
    div.hpx-card {
      border-radius: 1.5rem;
      filter: drop-shadow(0 25px 25px rgb(0 0 0 / 0.15));
      background-color: <BACKGROUND_COLOR>;
      transition: all;
      transition-duration: .3s;
      padding: 2rem;
    }
  """, '<', '>')}
document.head.appendChild(style.children[0])


proc Card*(modifier: Modifier = initModifier(), class: string = "", stmt: TagRef): TagRef =
  buildHtml:
    tDiv(class = "hpx-card " & class, style = modifier.build()):
      stmt
