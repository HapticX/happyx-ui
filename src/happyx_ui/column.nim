import happyx


component Column:
  spacing: string = "0"

  html:
    tDiv(class = "column"):
      slot
  
  `style`: """
    div.column {
      display: flex;
      flex-direction: column;
      gap: <self.spacing>;
    }
  """
