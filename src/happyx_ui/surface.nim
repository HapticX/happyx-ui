import
  happyx,
  ./core,
  ./base


component Surface of Base:
  html:
    tDiv(style = self.modifier.build()):
      slot
