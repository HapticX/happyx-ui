import
  happyx,
  ./core,
  ./colors


let style = buildHtml:
  tStyle:
    {fmt("""
    div.hpx-card {
      border-radius: 1rem;
      filter: drop-shadow(0 0 .5rem #00000090);
      background-color: <BACKGROUND_COLOR>;
      transition: all;
      transition-duration: .3s;
      padding: 1rem;
    }
    div.hpx-card:hover {
      transform: scale(105%);
      background-color: <BACKGROUND_HOVER_COLOR>;
    }
  """, '<', '>')}
document.head.appendChild(style.children[0])


proc Card*(modifier: Modifier = initModifier(), class: string = "", stmt: TagRef): TagRef =
  buildHtml:
    tDiv(class = "hpx-card " & class, style = modifier.build()):
      stmt
