import
  happyx,
  happyx_ui


appRoutes "app":
  "/":
    Surface(initModifier()
      .width(100.vw)
      .height(100.vh)
      .backgroundColor(BACKGROUND_COLOR)
      .textColor(FOREGROUND_COLOR)
    ):
      Column(0.5.rem):
        Title("Buttons")
        Row(1.rem):
          Button(proc() =
            echo "default button was clicked"
          ):
            "default button"
          OutlineButton(proc() =
            echo "outline button was clicked"
          ):
            "outline button"
        Title("Cards")
        Row(1.rem):
          Card():
            Column():
              Title("Hello, world!")
              Text("Lorem Ipsum")
  # "/testing":
  #   tDiv:
  #     Column(1.em):
  #       Row(2.rem):
  #         Button(
  #           proc() =
  #             echo "Hello, world!"
  #         ):
  #           "Hello, world!"
  #         OutlineButton(
  #           proc() =
  #             echo "Hello, world!"
  #         ):
  #           "Hello, world!"
        
  #       # Will be insert as <object>
  #       Image(
  #         "https://www.svgrepo.com/show/530485/the-internet.svg",
  #         width = 256.px, height = 125.px
  #       )
  #       # Will be insert as <img>
  #       Image(
  #         "https://i.pinimg.com/originals/9c/f0/62/9cf062842a21964001796f28d3ba8c22.png",
  #         width = 256.px, height = 125.px
  #       )

  #       # Test modifiers
  #       Surface(
  #         initModifier()
  #           .padding(1.rem, 2.rem)
  #           .background(FOREGROUND_COLOR)
  #           .width(128.px)
  #           .height(128.px)
  #           .borderRadius(1.rem)
  #           .borderStyle("solid")
  #           .borderColor(BACKGROUND_COLOR)
  #           .borderWidth(8.px)
  #           .textColor(BACKGROUND_COLOR)
  #       ):
  #         Column(
  #           justifyContent = "center",
  #           alignItems = "center",
  #           modifier = initModifier()
  #             .height("100%")
  #         ):
  #           "Hello, world!"
