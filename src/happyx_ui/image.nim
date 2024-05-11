import
  std/strutils,
  happyx,
  ./core,
  ./base


component Image of Base:
  source: string = ""
  alt: string = ""
  width: string = "auto"
  height: string = "auto"

  html:
    if self.source.endsWith"svg":
      tObject(
        type = "image/svg+xml",
        style = self.modifier.build(),
        data = self.source,
        width =
          if self.width != "auto":
            self.width.val
          else:
            "",
        height =
          if self.height != "auto":
            self.height.val
          else:
            "",
      )
    else:
      tImg(src = self.source, alt = self.alt, style = self.modifier.build())
  
  `style`: """
    img {
      width: <self.width>;
      height: <self.height>;
    }
  """
