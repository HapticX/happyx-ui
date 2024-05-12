import
  happyx,
  happyx_ui


var
  name = remember ""
  age = remember 0
  isMale = remember true
  amount = remember 35


appRoutes "app":
  "/":
    Surface(initModifier()
      .minWidth(100.vw)
      .minHeight(100.vh)
      .height("100%")
      .backgroundColor(BACKGROUND_COLOR)
      .textColor(FOREGROUND_COLOR)
    ):
      Column(0.5.rem):
        Title("Buttons 🧈")
        Row(1.rem):
          Button(proc() =
            echo "default button was clicked"
          ):
            "default button"
          OutlineButton(proc() =
            echo "outline button was clicked"
          ):
            "outline button"
        Title("Cards 🎴")
        Row(1.rem):
          Card():
            Column(1.rem):
              Title("Hello, world!")
              Text("There are input elements")
              Row(1.rem):
                Input(state = name, id = "username"):
                  # placeholder
                  "Who are you?"
                OutlineInput(state = name, id = "username2"):
                  # placeholder
                  "Who are you?"
              Text("There are checkboxes")
              Checkbox(state = isMale):
                "Are you male?"
              Progress(state = amount)
        Title("Box Container 👀")
        Box(
          horizontal = "center", vertical = "center",
          modifier = initModifier()
            .width(256.px)
            .height(256.px)
        ):
          Surface(initModifier().width(200.px).height(200.px).backgroundColor(PRIMARY_COLOR))
          Surface(initModifier().width(150.px).height(150.px).backgroundColor(PRIMARY_HOVER_COLOR))
          Surface(initModifier().width(100.px).height(100.px).backgroundColor(PRIMARY_ACTIVE_COLOR))

  "/testing":
    tDiv:
      Column(1.em):
        Row(2.rem):
          Button(
            proc() =
              echo "Hello, world!"
          ):
            "Hello, world!"
          OutlineButton(
            proc() =
              echo "Hello, world!"
          ):
            "Hello, world!"
        
        # Will be insert as <object>
        Image(
          "https://www.svgrepo.com/show/530485/the-internet.svg",
          width = 256.px, height = 125.px
        )
        # Will be insert as <img>
        Image(
          "https://i.pinimg.com/originals/9c/f0/62/9cf062842a21964001796f28d3ba8c22.png",
          width = 256.px, height = 125.px
        )

        # Test modifiers
        Surface(
          initModifier()
            .padding(1.rem, 2.rem)
            .background(FOREGROUND_COLOR)
            .width(128.px)
            .height(128.px)
            .borderRadius(1.rem)
            .borderStyle("solid")
            .borderColor(BACKGROUND_COLOR)
            .borderWidth(8.px)
            .textColor(BACKGROUND_COLOR)
        ):
          Column(
            horizontal = "center",
            vertical = "center",
            modifier = initModifier()
              .height("100%")
          ):
            "Hello, world!"
