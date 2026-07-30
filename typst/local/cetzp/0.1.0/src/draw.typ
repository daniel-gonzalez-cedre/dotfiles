#import "@preview/cetz:0.5.2" as cetz
#import "vector.typ" as vector

#import "colors.typ": inks
#import "styles.typ": *

#let point(
  P,
  name: none,
  label: none,
  diameter: auto,
  ..args
) = cetz.draw.get-ctx(ctx => {
  let style = cetz.styles.resolve(
    ctx.style,
    merge: args.named(),
    base: default-point,
    root: "point"
  )

  return cetz.draw.group(name: name, {
    cetz.draw.circle(
      P,
      radius: if diameter == auto { style.radius } else { diameter/2 },
      stroke: style.stroke,
      fill: style.fill,
    )

    if label != none {
      cetz.draw.content(
        P,
        padding: style.padding,
        anchor: style.anchor,
        wrap: text.with(
          font: style.label-font,
          fill: style.label-fill,
          style: style.label-style,
          weight: style.label-weight,
        )
      )[#label]
    }
  })
})


#let arc         = cetz.draw.arc
#let arc-through = cetz.draw.arc-through
#let arc-between(
  origin,
  start,
  end,
  ..args
) = cetz.draw.get-ctx(ctx => {
  let style = cetz.styles.resolve(
    ctx.style,
    merge: args.named(),
    base: default-arc-between,
    root: "arc-between"
  )
  return cetz.angle.angle(
    origin, start, end,
    radius: style.radius,
    stroke: (
      thickness: style.thickness,
      paint:     style.paint,
      dash:      style.dash,
      cap:       style.cap,
    ),
    fill: style.fill,
  )
})
#let sector = arc-between.with(thickness: 0.0cm)

#let circle         = cetz.draw.circle
#let circle-through = cetz.draw.circle-through

#let line = cetz.draw.line

#let edge(
  u, v,
  name: none,
  pad: auto,
  pre: auto,
  post: auto,
  directed: false,
  bidirected: false,
  // mark-thickness: ??? make this depend on thickness ???
  ..args
) = cetz.draw.get-ctx(ctx => {
  let style = cetz.styles.resolve(
    ctx.style,
    merge: args.named(),
    base: default-edge,
    root: "edge"
  )

  let prepad  = if pad != auto { pad } else if pre  != auto { pre }  else { 0.0 }
  let postpad = if pad != auto { pad } else if post != auto { post } else { 0.0 }

  return cetz.draw.line(
    vector.sub(u, vector.scale(vector.direction(u, v), prepad)),
    vector.add(v, vector.scale(vector.direction(u, v), postpad)),
    name: name,
    mark: (
      symbol: if (bidirected or directed) { style.mark-symbol } else { none },
      scale: style.mark-scale,
      stroke: (
        thickness: style.mark-thickness,
        paint:     style.mark-paint,
      ),
    ),
    stroke: (
      thickness: style.thickness,
      paint: style.paint,
      dash: style.dash,
      cap: style.cap,
    ),
    fill: style.fill,
    close: false,
  )
})

#let path(
  ..args,
  name: none,
  pad: auto,
  pre: auto,
  post: auto,
) = cetz.draw.get-ctx(ctx => {
  let style = cetz.styles.resolve(
    ctx.style,
    merge: args.named(),
    base: default-path,
    root: "path"
  )

  let (ctx, ..pts) = cetz.coordinate.resolve(ctx, ..args.pos())
  assert(pts.len() >= 2)  // NEED AT LEAST TWO POINTS ON THE PATH

  let prepad  = if pad != auto { pad } else if pre  != auto { pre }  else { 0.0 }
  let postpad = if pad != auto { pad } else if post != auto { post } else { 0.0 }

  pts.at(0) = vector.sub(
    pts.at(0),
    vector.scale(vector.direction(pts.at(0), pts.at(1)), prepad)
  )

  pts.at(-1) = vector.add(
    pts.at(-1),
    vector.scale(vector.direction(pts.at(-2), pts.at(-1)), postpad)
  )

  return cetz.draw.line(
    ..pts,
    name: name,
    mark: (
      symbol: style.mark-symbol,
      scale: style.mark-scale,
      stroke: (
        thickness: style.mark-thickness,
        paint: style.mark-paint,
      ),
    ),
    stroke: (
      thickness: style.thickness,
      paint: style.paint,
      dash: style.dash,
      join: style.join,
      cap: style.cap,
    ),
    fill: style.fill,
    close: style.close,
  )
})

#let region(
  ..args,
  name: none,
) = cetz.draw.get-ctx(ctx => {
  let style = cetz.styles.resolve(
    ctx.style,
    merge: args.named(),
    base: default-region,
    root: "region"
  )
  return path(
    ..args.pos(),
    name: name,
    pad: 0.0,
    pre: 0.0,
    post: 0.0,
    ..style,
  )
})
