import
  happyx,
  happyx_ui


var
  name = remember ""
  age = remember 0
  isMale = remember true
  amount = remember 35
  stepperCount = remember 5


appRoutes "app":
  "/":
    Surface(initModifier()
      .minWidth(100.vw)
      .minHeight(100.vh)
      .height("100%")
      .backgroundColor(BACKGROUND_COLOR)
      .textColor(FOREGROUND_COLOR)
    ):
      Column():
        Title("Buttons 🧈")
        Row(1.rem):
          tDiv:
            Tooltip(delay = 1):
              Surface(initModifier()
                .borderRadius(0.5.rem)
                .padding(0.2.rem)
                .dropShadow(DropShadow.MD)
                .backgroundColor(BACKGROUND_COLOR)
              ):
                Text("Hello world")
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
                Input(state = name, id = "username", hint = "First name"):
                  # placeholder
                  "Who are you?"
                OutlineInput(id = "username2", hint = "Last name"):
                  # placeholder
                  "What's your last name?"
              Text("There are checkboxes")
              Checkbox(state = isMale):
                "Are you male?"
              Text("Progress bar 👀")
              Progress(state = amount)
          Card():
            Column(1.rem):
              Title("Other Inputs")
              Text("switchers")
              Switcher(state = isMale):
                "Are you male?"
              Text("Stepper")
              Stepper(state = stepperCount, min = 0, max = 10, step = 1)
          Card(modifier = initModifier()
            .padding(0.px)
            .overflowHidden()
          ):
            Image(
              "https://images.kinorium.com/movie/poster/2409863/w1500_52078438.jpg",
              modifier = initModifier()
                .width(200.px)
                .height(240.px)
                .objectCover()
                .objectCenter()
            )
            Column(modifier = initModifier().padding(4.px, 0.px, 4.px, 10.px)):
              Title("Fallout")
              Row(modifier = initModifier().width(190.px).flexWrap()):
                Tag("science fiction")
                Tag("action")
                Tag("drama")
                Tag("adventure")
        Title("Containers 👀")
        Row(2.rem):
          Column():
            Text("Box container")
            Box(
              horizontal = "center", vertical = "center",
              modifier = initModifier()
                .width(256.px)
                .height(256.px)
            ):
              ChildModifier(initModifier().borderRadius(1.rem)):
                Surface(initModifier().width(200.px).height(200.px).backgroundColor(PRIMARY_COLOR))
                Surface(initModifier().width(150.px).height(150.px).backgroundColor(PRIMARY_HOVER_COLOR))
                Surface(initModifier().width(100.px).height(100.px).backgroundColor(PRIMARY_ACTIVE_COLOR))
          Column():
            Text("Row container")
            Row(
              horizontal = "center", vertical = "center",
              modifier = initModifier()
                .width(256.px)
                .height(256.px)
            ):
              ChildModifier(initModifier().borderRadius(1.rem)):
                Surface(initModifier().width(96.px).height(96.px).backgroundColor(PRIMARY_COLOR))
                Surface(initModifier().width(64.px).height(64.px).backgroundColor(PRIMARY_HOVER_COLOR))
                Surface(initModifier().width(32.px).height(32.px).backgroundColor(PRIMARY_ACTIVE_COLOR))
          Column():
            Text("Column container")
            Column(
              horizontal = "center", vertical = "center",
              modifier = initModifier()
                .width(256.px)
                .height(256.px)
            ):
              ChildModifier(initModifier().borderRadius(1.rem)):
                Surface(initModifier().width(96.px).height(96.px).backgroundColor(PRIMARY_COLOR))
                Surface(initModifier().width(64.px).height(64.px).backgroundColor(PRIMARY_HOVER_COLOR))
                Surface(initModifier().width(32.px).height(32.px).backgroundColor(PRIMARY_ACTIVE_COLOR))
          Column():
            Text("Column container")
            Grid(cols = 3):
              ChildModifier(initModifier().borderRadius(1.rem)):
                Surface(initModifier().width("100%").height("100%").colSpan(2).backgroundColor(PRIMARY_COLOR))
                Surface(initModifier().width(64.px).height(64.px).backgroundColor(PRIMARY_HOVER_COLOR))
                Surface(initModifier().width(64.px).height(64.px).backgroundColor(PRIMARY_ACTIVE_COLOR))
                Surface(initModifier().width("100%").height("100%").colSpan(2).backgroundColor(PRIMARY_COLOR))
          Tooltip:
            "Hello"

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
