import
  happyx,
  ./core,
  ./base


component Row of Base:
  spacing: string = "0"
  justifyContent: string = "start"
  alignItems: string = "start"

  html:
    tDiv(class = "row", style = self.modifier.build()):
      slot
  
  `style`: """
    div.row {
      display: flex;
      gap: <self.spacing>;
      justify-content: <self.justifyContent>;
      align-items: <self.alignItems>;
    }
  """
