import
  std/strutils,
  happyx,
  ./core


proc Image*(source: string = "", alt: string = "", width: string = "auto", height: string = "auto",
            modifier: Modifier = initModifier(), class: string = ""): TagRef =
  buildHtml:
    if source.endsWith"svg":
      tObject(
        type = "image/svg+xml",
        style = modifier.build(),
        data = source,
        class = class,
        width =
          if width != "auto":
            width
          else:
            "",
        height =
          if height != "auto":
            height
          else:
            "",
      )
    else:
      tImg(
        src = source,
        alt = alt,
        style = modifier.build(),
        class = "hpx-image " & class
      )
    tStyle: {fmt("""
      img.hpx-image {
        width: <width>;
        height: <height>;
      }
    """, '<', '>')}
