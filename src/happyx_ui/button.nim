import
  happyx,
  ./colors,
  ./core,
  ./events


let style = buildHtml:
  tStyle:
    {fmt("""
      button.hpx-button {
        position: relative;
        overflow: hidden;
        border-radius: 1rem;
        border: 0 solid transparent;
        cursor: pointer;
        background-color: <PRIMARY_COLOR>;
        padding: .5rem 1rem;
        outline: none;
        transition: all;
        transition-duration: .3s;
        color: <BACKGROUND_COLOR>;
        font-weight: 900;
        font-size: 16px;
      }

      button.hpx-button:hover {
        background-color: <PRIMARY_HOVER_COLOR>;
      }

      button.hpx-button:active {
        background-color: <PRIMARY_ACTIVE_COLOR>;
      }
          
      span.hpx-rippleAnimation {
        width: 0;
        height: 0;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.5);
        transform: scale(0);
        position: absolute;
        opacity: 1;
      }
      .hpx-rippleAnimation {
          animation: ripple .3s ease;
      }

      @keyframes ripple {
        100% {
          transform: scale(2);
          opacity: 0;
        }
      }

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


proc Button*(onClick: OnClick = defOnClick, modifier: Modifier = initModifier(),
             class: string = "", stmt: TagRef = nil): TagRef =
  buildHtml:
    tButton(style = modifier.build(), class = "hpx-button " & class):
      if not stmt.isNil:
        stmt
      @click:
        onClick()
      @click:
        let posX = ev.target.offsetLeft
        let posY = ev.target.offsetTop
        var buttonWidth = ev.target.offsetWidth
        var buttonHeight = ev.target.offsetHeight
        let ripple = document.createElement("span")
        ev.target.appendChild(ripple)

        if buttonWidth >= buttonHeight:
          buttonHeight = buttonWidth
        else:
          buttonWidth = buttonHeight
        
        # Get the center of the element
        var x = (ev.MouseEvent.pageX - posX).float - buttonWidth / 2
        var y = (ev.MouseEvent.pageY - posY).float - buttonHeight / 2
      
        ripple.style.width = fmt"{buttonWidth}px"
        ripple.style.height = fmt"{buttonHeight}px"
        ripple.style.top = fmt"{y}px"
        ripple.style.left = fmt"{x}px"
        
        ripple.classList.add("hpx-rippleAnimation")
        
        withVariables ev:
          withTimeout 250, t:
            clearTimeout(t)
            ev.target.removeChild(ripple)

proc OutlineButton*(onClick: OnClick = defOnClick, modifier: Modifier = initModifier(),
                    class: string = "", stmt: TagRef = nil): TagRef =
  buildHtml:
    tButton(style = modifier.build(), class = "hpx-outlined-button " & class):
      if not stmt.isNil:
        stmt
      @click:
        onClick()
