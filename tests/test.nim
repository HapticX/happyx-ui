import
  happyx,
  happyx_ui


appRoutes "app":
  "/":
    tDiv:
      Column(1.em, "center", "center"):
        Button(
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
            justifyContent = "center",
            alignItems = "center",
            modifier = initModifier()
              .height("100%")
          ):
            "Hello, world!"
