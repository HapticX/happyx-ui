import
  happyx,
  ./core,
  ./base


component Column of Base:
  spacing: string = "0"
  justifyContent: string = "start"
  alignItems: string = "start"

  html:
    tDiv(class = "column", style = self.modifier.build()):
      slot
  
  `style`: """
    div.column {
      display: flex;
      flex-direction: column;
      gap: <self.spacing>;
      justify-content: <self.justifyContent>;
      align-items: <self.alignItems>;
    }
  """
