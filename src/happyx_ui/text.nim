import
  happyx,
  ./core


let style = buildHtml:
  tStyle: """
    p.hpx-title {
      font-size: 24px;
      font-weight: 700;
    }
    p.hpx-text {
      font-size: 16px;
      font-weight: 500;
    }
  """
document.head.appendChild(style.children[0])


proc Title*(text: string = "", modifier: Modifier = initModifier(), class: string = ""): TagRef =
  buildHtml:
    tP(class = "hpx-title " & class, style = modifier.build()):
      {text}


proc Text*(text: string = "", modifier: Modifier = initModifier(), class: string = ""): TagRef =
  buildHtml:
    tP(class = "hpx-text " & class, style = modifier.build()):
      {text}
