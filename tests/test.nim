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
          width = 512.px, height = 250.px
        )
        # Will be insert as <img>
        Image(
          "https://i.pinimg.com/originals/9c/f0/62/9cf062842a21964001796f28d3ba8c22.png",
          width = 500.px, height = 250.px
        )
