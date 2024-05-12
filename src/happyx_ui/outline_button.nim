import
  happyx,
  ./colors,
  ./core,
  ./events


let style = buildHtml:
  tStyle: {fmt("""
    button.hpx-outlined-button {
      border-radius: 1rem;
      border: .2rem solid <PRIMARY_COLOR>;
      cursor: pointer;
      background-color: transparent;
      padding: .3rem .8rem;
      outline: none;
      transition: all;
      transition-duration: .3s;
      color: <PRIMARY_COLOR>;
      font-weight: 700;
      font-size: 16px;
    }

    button.hpx-outlined-button:hover {
      border-color: <PRIMARY_HOVER_COLOR>;
      color: <PRIMARY_HOVER_COLOR>;
    }

    button.hpx-outlined-button:active {
      border-color: <PRIMARY_ACTIVE_COLOR>;
      color: <PRIMARY_ACTIVE_COLOR>;
    }
  """, '<', '>')}
document.head.appendChild(style.children[0])


proc OutlineButton*(onClick: OnClick = defOnClick, modifier: Modifier = initModifier(),
                    class: string = "", stmt: TagRef = nil): TagRef =
  buildHtml:
    tButton(style = modifier.build(), class = "hpx-outlined-button " & class):
      if not stmt.isNil:
        stmt
      @click:
        onClick()
