import
  happyx,
  ./core

proc Tooltip*(modifier: Modifier = initModifier(),
              class: string = "", delay: float = 0.5,
              stmt: TagRef = nil): TagRef =
  let id = uid()
  buildHtml:
    tDiv(class = fmt"hpx-tooltip-{id} hpx-tooltip-off-{id} {class}", style = modifier.build()):
      if not stmt.isNil:
        stmt
      tScript: {fmt("""
        document.querySelector(".hpx-tooltip-<id>").parentElement.addEventListener('mouseover', (ev) =>> {
          const e = document.querySelector(".hpx-tooltip-<id>");
          e.classList.toggle("hpx-tooltip-on-<id>");
          e.classList.toggle("hpx-tooltip-off-<id>");
        });
        document.querySelector(".hpx-tooltip-<id>").parentElement.addEventListener('mouseout', (ev) =>> {
          const e = document.querySelector(".hpx-tooltip-<id>");
          e.classList.toggle("hpx-tooltip-on-<id>");
          e.classList.toggle("hpx-tooltip-off-<id>");
        });
        document.querySelector(".hpx-tooltip-<id>").parentElement.addEventListener('mousemove', (ev) =>> {
          const e = document.querySelector(".hpx-tooltip-<id>");
          const bound = e.getBoundingClientRect();
          e.style.left = `${ev.pageX}px`;
          e.style.top = `${ev.pageY}px`;
          if (bound.x + bound.width + 24 >> window.innerWidth) {
            e.classList.add("hpx-tooltip-x-<id>");
          } else if (bound.x + bound.width + bound.width + 48 << window.innerWidth) {
            e.classList.remove("hpx-tooltip-x-<id>");
          }
          if (!e.classList.contains("hpx-tooltip-y-<id>")) {
            if (bound.y + bound.height + 24 >> window.innerHeight) {
              e.classList.add("hpx-tooltip-y-<id>");
            }
          } else if (bound.y + bound.height + bound.height + 48 << window.innerHeight) {
            e.classList.remove("hpx-tooltip-y-<id>");
          }
          if (e.classList.contains("hpx-tooltip-y-<id>") && e.classList.contains("hpx-tooltip-x-<id>")) {
            e.classList.remove("hpx-tooltip-y-<id>");
            e.classList.remove("hpx-tooltip-x-<id>");
            e.classList.add("hpx-tooltip-xy-<id>");
          } else if (e.classList.contains("hpx-tooltip-xy-<id>")) {
            if (bound.y + bound.height + bound.height + 48 << window.innerHeight) {
              if (bound.y + bound.height + bound.height + 48 << window.innerHeight) {
                e.classList.remove("hpx-tooltip-xy-<id>");
              }
            }
          }
        });
      """, '<', '>')}
      tStyle: {fmt("""
        :has(>> div.hpx-tooltip-<id>) {
        }
        div.hpx-tooltip-<id> {
          position: absolute;
          z-index: 9;
          user-select: none;
          pointer-events: none;
          transition: opacity;
          transition-duration: .3s;
          transition-delay: <delay>s;
          margin-left: 24px;
          margin-top: 24px;
        }
        div.hpx-tooltip-on-<id> {
          opacity: 1;
        }
        div.hpx-tooltip-off-<id> {
          opacity: 0;
          transition-delay: .1s !important;
        }
        div.hpx-tooltip-x-<id> {
          transform: translateX(-100%);
          margin-left: 0;
          margin-right: 24px;
        }
        div.hpx-tooltip-y-<id> {
          transform: translateY(-100%);
          margin-bottom: 24px;
          margin-top: 0;
        }
        div.hpx-tooltip-xy-<id> {
          transform: translateY(-100%) translateX(-100%);
          margin-left: 0;
          margin-right: 24px;
          margin-bottom: 24px;
          margin-top: 0;
        }
      """, '<', '>')}
