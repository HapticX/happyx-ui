import happyx


component Column:
  spacing: string = "0"
  justify_content: string = "start"
  align_items: string = "start"

  html:
    tDiv(class = "column"):
      slot
  
  `style`: """
    div.column {
      display: flex;
      flex-direction: column;
      gap: <self.spacing>;
      justify-content: <self.justify_content>;
      align-items: <self.align_items>;
    }
  """
