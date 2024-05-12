import
  happyx,
  ./core


proc Surface*(modifier: Modifier = initModifier(), class: string = "", stmt: TagRef = nil): TagRef =
  buildHtml:
    tDiv(style = modifier.build(), class = class):
      if not stmt.isNil:
        stmt


# component Surface:
#   modifier: Modifier = initModifier()
#   class: string = ""
#   html:
#     tDiv(style = self.modifier.build(), class = self.class):
#       slot
