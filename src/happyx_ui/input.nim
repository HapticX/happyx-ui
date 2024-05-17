import
  happyx,
  ./core,
  ./colors,
  ./events


proc Input*(onInput: OnInput = defOnInput, onFocus: OnFocus = defOnFocus,
            state: State[string] = nil, id: string = "", hint: string = "",
            modifier: Modifier = initModifier(), class: string = "",
            stmt: TagRef = nil): TagRef =
  let i = uid()
  buildHtml:
    tDiv(class = fmt"hpx-input-container {class}"):
      tInput(
        class = fmt"hpx-input {class}",
        placeholder = " ",
        id = id,
        value =
          if state.isNil:
            ""
          else:
            state.val
      ):
        @input:
          onInput($ev.target.value)
          if not state.isNil:
            state.set($ev.target.value)
          if ($ev.target.value).len > 0:
            ev.target.Element.parentElement.classList.add("hpx-input-hint-container")
          else:
            ev.target.Element.parentElement.classList.remove("hpx-input-hint-container")
        @focus:
          onFocus(ev.target.Element)
      tLabel(class = fmt"hpx-input-placeholder"):
        if not stmt.isNil:
          stmt
      if hint.len > 0:
        tLabel(class = fmt"hpx-input-hint"):
          {hint}
    tStyle: {fmt("""
      div.hpx-input-container {
        position: relative;
        display: flex;
        align-items: center;
      }
      input.hpx-input {
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
        padding: .1rem .5rem;
      }
      input.hpx-input:hover {
        border-bottom-color: <PRIMARY_HOVER_COLOR>;
      }
      input.hpx-input:focus {
        border-bottom-color: <PRIMARY_ACTIVE_COLOR>;
      }
      label.hpx-input-placeholder {
        position: absolute;
        transition: all;
        transition-duration: .3s;
        opacity: .7;
        pointer-events: none;
        font-size: 16px;
        padding: .1rem .5rem;
      }
      label.hpx-input-hint {
        position: absolute;
        transition: all;
        transition-duration: .3s;
        opacity: 0;
        pointer-events: none;
        font-size: 16px;
        padding: .1rem .5rem;
      }
      input#<id>:focus + label.hpx-input-placeholder {
        transform: scale(75%) translateX(-15%) translateY(-150%);
        opacity: .9;
      }
      div.hpx-input-container:focus-within label.hpx-input-hint {
        opacity: .7;
      }
      div.hpx-input-hint-container:focus-within label.hpx-input-hint {
        opacity: 0;
      }
      input#<id>:not(:placeholder-shown) + label.hpx-input-placeholder {
        transform: scale(75%) translateX(-15%) translateY(-150%);
        opacity: .9;
      }
    """, '<', '>')}


proc OutlineInput*(onInput: OnInput = defOnInput, onFocus: OnFocus = defOnFocus,
            state: State[string] = nil, id: string = "", hint: string = "",
            modifier: Modifier = initModifier(), class: string = "",
            stmt: TagRef = nil): TagRef =
  let i = uid()
  buildHtml:
    tDiv(class = fmt"hpx-input-outline-container {class}"):
      tInput(
        class = fmt"hpx-input-outline {class}",
        placeholder = " ",
        id = id,
        value =
          if state.isNil:
            ""
          else:
            state.val
      ):
        @input:
          onInput($ev.target.value)
          if not state.isNil:
            state.set($ev.target.value)
          if ($ev.target.value).len > 0:
            ev.target.Element.parentElement.classList.add("hpx-input-outline-hint-container")
          else:
            ev.target.Element.parentElement.classList.remove("hpx-input-outline-hint-container")
        @focus:
          onFocus(ev.target.Element)
      tLabel(class = fmt"hpx-input-outline-placeholder"):
        if not stmt.isNil:
          stmt
      if hint.len > 0:
        tLabel(class = fmt"hpx-input-outline-hint"):
          {hint}
    tStyle: {fmt("""
      div.hpx-input-outline-container {
        position: relative;
        display: flex;
        align-items: center;
      }
      input.hpx-input-outline {
        border: .15rem <PRIMARY_COLOR> solid;
        transition: all;
        transition-duration: .3s;
        outline: 0;
        background-color: transparent;
        border-radius: .5rem;
        color: <FOREGROUND_COLOR>;
        font-size: 18px;
        padding: .1rem .5rem;
      }
      input.hpx-input-outline:hover {
        border-color: <PRIMARY_HOVER_COLOR>;
      }
      input.hpx-input-outline:focus {
        border-color: <PRIMARY_ACTIVE_COLOR>;
      }
      label.hpx-input-outline-placeholder {
        position: absolute;
        transition: all;
        transition-duration: .3s;
        opacity: .7;
        pointer-events: none;
        font-size: 16px;
        padding: .1rem .5rem;
      }
      label.hpx-input-outline-hint {
        position: absolute;
        transition: all;
        transition-duration: .3s;
        opacity: 0;
        pointer-events: none;
        font-size: 16px;
        padding: .1rem .5rem;
      }
      input#<id>:focus + label.hpx-input-outline-placeholder {
        transform: scale(75%) translateX(-15%) translateY(-150%);
        opacity: .9;
      }
      div.hpx-input-outline-container:focus-within label.hpx-input-outline-hint {
        opacity: .7;
      }
      div.hpx-input-outline-hint-container:focus-within label.hpx-input-outline-hint {
        opacity: 0;
      }
      input#<id>:not(:placeholder-shown) + label.hpx-input-outline-placeholder {
        transform: scale(75%) translateX(-15%) translateY(-150%);
        opacity: .9;
      }
    """, '<', '>')}


proc Checkbox*(onToggle: OnToggle = defOnToggle, state: State[bool] = nil,
               modifier: Modifier = initModifier(), class: string = "",
               id = "", stmt: TagRef): TagRef =
  let i = uid()
  buildHtml:
    tDiv(class = fmt"hpx-checkbox-container-{i} {class}"):
      if not state.isNil and state.val:
        tDiv(class = fmt"hpx-checkbox-on-{i}"):
          tSvg(width="16px", height="16px", fill="none", viewBox="0 0 24 24"):
            tPath(d="M4 12.6111L8.92308 17.5L20 6.5", stroke=BACKGROUND_COLOR, "stroke-linecap"="round", "stroke-linejoin"="round", "stroke-width"="2")
      else:
        tDiv(class = fmt"hpx-checkbox-off-{i}")
      if not stmt.isNil:
        tLabel(class = fmt"hpx-checkbox-label-{i}"):
          stmt
      @click:
        if not state.isNil and state.val:
          onToggle(false)
          if not state.isNil:
            state.set(false)
        else:
          onToggle(true)
          if not state.isNil:
            state.set(true)
    tStyle: {fmt("""
      div.hpx-checkbox-container-<i> {
        display: flex;
        gap: .3rem;
        align-items: center;
        cursor: pointer;
      }

      div.hpx-checkbox-off-<i> {
        border: 3px <PRIMARY_COLOR> solid;
        border-radius: .5rem;
        width: 16px;
        height: 16px;
        transition: all;
        transition-duration: .3s;
      }
      div.hpx-checkbox-container-<i>:hover div.hpx-checkbox-off-<i> {
        border-color: <PRIMARY_HOVER_COLOR>;
      }
      div.hpx-checkbox-container-<i>:active div.hpx-checkbox-off-<i> {
        border-color: <PRIMARY_ACTIVE_COLOR>;
      }

      div.hpx-checkbox-on-<i> {
        border: 3px <PRIMARY_COLOR> solid;
        background-color: <PRIMARY_COLOR>;
        border-radius: .5rem;
        width: 16px;
        height: 16px;
        transition: all;
        transition-duration: .3s;
      }
      div.hpx-checkbox-container-<i>:hover div.hpx-checkbox-on-<i> {
        background-color: <PRIMARY_HOVER_COLOR>;
        border-color: <PRIMARY_HOVER_COLOR>;
      }
      div.hpx-checkbox-container-<i>:active div.hpx-checkbox-on-<i> {
        background-color: <PRIMARY_ACTIVE_COLOR>;
        border-color: <PRIMARY_ACTIVE_COLOR>;
      }

      label.hpx-checkbox-label-<i> {
        font-size: 18px;
        user-select: none;
        cursor: pointer;
      }
    """, '<', '>')}


proc Switcher*(onToggle: OnToggle = defOnToggle, state: State[bool] = nil,
               modifier: Modifier = initModifier(), class: string = "",
               id = "", stmt: TagRef): TagRef =
  let
    i = uid()
    switchControlClass =
      if not state.isNil and state.val:
        fmt"hpx-switch-control-on-{i} hpx-switch-control-on-anim"
      else:
        fmt"hpx-switch-control-off-{i} hpx-switch-control-off-anim"
    switchClass =
      if not state.isNil and state.val:
        fmt"hpx-switch-on-{i}"
      else:
        fmt"hpx-switch-off-{i}"
  buildHtml:
    tDiv(class = fmt"hpx-switch-container-{i} {class}"):
      tDiv(class = fmt"hpx-switch-{i} {switchClass}"):
        tDiv(class = fmt"hpx-switch-control-{i} {switchControlClass}")
      if not stmt.isNil:
        tLabel(class = fmt"hpx-switch-label-{i}"):
          stmt
      @click:
        if not state.isNil and state.val:
          onToggle(false)
          if not state.isNil:
            state.set(false)
        else:
          onToggle(true)
          if not state.isNil:
            state.set(true)
    tStyle: {fmt("""
      div.hpx-switch-container-<i> {
        display: flex;
        gap: .3rem;
        align-items: center;
        cursor: pointer;
      }

      div.hpx-switch-<i> {
        border-radius: 2rem;
        width: 48px;
        height: 24px;
        transition: all;
        transition-duration: .3s;
        position: relative;
        align-items: center;
        display: flex;
        transition: all;
        transition-duration: .3s;
      }

      div.hpx-switch-on-<i> {
        background-color: <PRIMARY_ACTIVE_COLOR>;
      }

      div.hpx-switch-off-<i> {
        background-color: <PRIMARY_HOVER_COLOR>;
      }

      div.hpx-switch-control-<i> {
        border-radius: 1rem;
        position: absolute;
        transition: all;
        transition-duration: .3s;
        width: 16px;
        height: 16px;
      }

      div.hpx-switch-control-on-<i> {
        right: 4px;
        background-color: <PRIMARY_HOVER_COLOR>;
      }

      div.hpx-switch-control-off-<i> {
        left: 4px;
        background-color: <PRIMARY_ACTIVE_COLOR>;
      }

      label.hpx-switch-label-<i> {
        font-size: 18px;
        user-select: none;
        cursor: pointer;
      }

      .hpx-switch-control-on-anim {
        animation: hpx-switch-control-off .3s;
      }

      .hpx-switch-control-off-anim {
        animation: hpx-switch-control-on .3s;
      }

      @keyframes hpx-switch-control-on {
        0% {
          right: 4px;
          left: 28px;
        }
        100% {
          right: 28px;
          left: 4px;
        }
      }

      @keyframes hpx-switch-control-off {
        0% {
          right: 28px;
          left: 4px;
        }
        100% {
          right: 4px;
          left: 28px;
        }
      }
    """, '<', '>')}
