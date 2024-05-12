import
  happyx,
  ./core,
  ./colors,
  ./events


proc Input*(onInput: OnInput = defOnInput, onFocus: OnFocus = defOnFocus,
            modifier: Modifier = initModifier(), class: string = "",
            stmt: TagRef = nil): TagRef =
  let id = uid()
  buildHtml:
    tDiv(class = fmt"hpx-input-container-{id} {class}"):
      tInput(class = fmt"hpx-input-{id} {class}", placeholder = " "):
        @input:
          onInput($ev.target.value)
        @focus:
          onFocus(ev.target.Element)
      tLabel(class = fmt"hpx-input-placeholder-{id}"):
        if not stmt.isNil:
          stmt
    tStyle: {fmt("""
      div.hpx-input-container-<id> {
        position: relative;
        display: flex;
        align-items: center;
      }
      input.hpx-input-<id> {
        border: 0;
        border-bottom-width: .15rem;
        border-bottom-color: <PRIMARY_COLOR>;
        border-bottom-style: solid;
        transition: all;
        transition-duration: .3s;
        outline: 0;
        background-color: transparent;
        color: <FOREGROUND_COLOR>;
        font-size: 18px;
      }
      input.hpx-input-<id>:hover {
        border-bottom-color: <PRIMARY_HOVER_COLOR>;
      }
      input.hpx-input-<id>:focus {
        border-bottom-color: <PRIMARY_ACTIVE_COLOR>;
      }
      label.hpx-input-placeholder-<id> {
        position: absolute;
        transition: all;
        transition-duration: .3s;
        opacity: .7;
        pointer-events: none;
        font-size: 16px;
      }
      input.hpx-input-<id>:focus + label.hpx-input-placeholder-<id> {
        transform: scale(75%) translateX(-15%) translateY(-150%);
        opacity: .9;
      }
      input.hpx-input-<id>:not(:placeholder-shown) + label.hpx-input-placeholder-<id> {
        transform: scale(75%) translateX(-15%) translateY(-150%);
        opacity: .9;
      }
    """, '<', '>')}
