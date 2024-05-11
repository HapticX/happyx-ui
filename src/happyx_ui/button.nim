import
  happyx,
  ./colors


type
  ButtonAction* = proc(): void
const defaultButtonAction = proc() = discard


component Button:
  action: ButtonAction = defaultButtonAction

  html:
    tButton:
      slot
      @click:
        self.action()
  
  `style`: """
    button {
      border-radius: .4rem;
      border: 0 solid transparent;
      cursor: pointer;
      background-color: <PRIMARY_COLOR>;
      padding: .5rem 1rem;
      outline: none;
      transition: all;
      transition-duration: .3s;
      color: <BACKGROUND_COLOR>;
      font-weight: 700;
    }

    button:hover {
      background-color: <PRIMARY_HOVER_COLOR>;
    }

    button:active {
      background-color: <PRIMARY_ACTIVE_COLOR>;
    }
  """
