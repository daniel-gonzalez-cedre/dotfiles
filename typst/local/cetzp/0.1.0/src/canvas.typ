#import "@preview/cetz:0.5.2" as cetz
#import "styles.typ": default

// TODO: support different font choices for content objects
#let canvas(
  body,
  padding: 0.1cm,
  style: (:),
  ..args
) = cetz.canvas(
  padding: padding,
  ..args.named(),
  {
    cetz.draw.set-style(..(default + style))
    body
  }
)

// TODO: support different font choices for content objects
#let inline(
  body,
  padding:  (x: 0.05cm, y: 0.00cm),
  baseline: (x: 0.00cm, y: 0.00cm),
  lift:     0.00cm,
  style: (:),
  ..args
) = cetz.canvas(
  padding: padding,
  baseline: (x: baseline.x, y: baseline.y - lift),
  ..args.named(),
  {
    cetz.draw.set-style(..(default + style))
    body
  }
)
