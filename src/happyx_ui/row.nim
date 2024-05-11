import happyx


component Row:
  spacing: string = "0"
  justify_content: string = "start"
  align_items: string = "start"

  html:
    tDiv(class = "row"):
      slot
  
  `style`: """
    div.row {
      display: flex;
      gap: <self.spacing>;
      justify-content: <self.justify_content>;
      align-items: <self.align_items>;
    }
  """
