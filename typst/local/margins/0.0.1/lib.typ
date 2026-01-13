#import "@local/colors:0.0.1": *
#import "@local/fonts:0.0.1": *

#import "@preview/marge:0.1.0": sidenote

#let page-margin-right = (3.125in, 3.0in, 2.525in).at(1)
#let fullwidth(content) = block(width: 100.0% + (page-margin-right - 1.0125in), content)

#let apostille( ..args ) = {
  set text(size: 11.0pt, style: "italic")
  sidenote(
    dy: 0.0pt,
    side: left,
    numbering: none,
    format: it => {
      set align(right)
      it.default
    },
    ..args
  )
}
#let marginale( ..args ) = {
  set text(size: 11.0pt)
  sidenote(
    dy: 1.0pt,
    side: right,
    numbering: none,
    padding: (
      left: 18.0pt,
      right: page-margin-right - 180.0pt
    ),
    format: it => {
      // set par(leading: 0.65em)
      it.default
    },
    ..args
  )
}
#let marginalis( ..args ) = {
  set text(size: 11.0pt)
  sidenote(
    // dy: 1.0pt,
    side: right,
    numbering: "1",
    padding: (
      left: 18.0pt,
      right: page-margin-right - 180.0pt
    ),
    format: it => {
      // set par(leading: 0.65em)
      it.default
    },
    ..args
  )
}

#let marginfigure( fig, dy: 0.0pt, caption: none ) = {
  marginale(dy: dy)[
    #box( figure( fig, caption: caption ) )
  ]
}
