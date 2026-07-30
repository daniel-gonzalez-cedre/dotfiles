#import "@preview/cetz:0.5.2" as cetz
#import "styles.typ": default

#let canvas(
  body,
  length: auto,
  padding: 0.1cm,
  font: auto,
  style: (:),
  ..args
) = cetz.canvas(
  // length: length,
  padding: padding,
  ..args.named(),
  {
    cetz.draw.set-style(..(default + style))
    body
  }
)
