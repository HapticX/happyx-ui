import
  happyx,
  happyx_ui


appRoutes "app":
  "/":
    tDiv:
      Column(1.em):
        Button(
          proc() =
            echo "Hello, world!"
        ):
          "Hello, world!"
