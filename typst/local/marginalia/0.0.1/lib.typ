// #import "@local/colors:0.0.1": *
// #import "@local/fonts:0.0.1": *

#import "@preview/marginalia:0.3.1" as marginalia: show-frame, note, notefigure, wideblock

// #let page-margin-right = (3.125in, 3.0in, 2.525in).at(1)
// #let fullwidth(content) = block(width: 100.0% + (page-margin-right - 1.0125in), content)

#let _paper_size = state("_paper_size")
#let _font_size = state("_font_size")

#let setup_defaults = (  // A4 paper size, 11.0pt font
  alternate: false,  // whether to alternate inner/outer on every page
  inner: (  // inner (usually left) margin
    sep: 5.0mm,  // padding between inner column and main body
    width: 15.0mm,  // width of inner column
    far: 5.0mm,  // padding between inner column and page border
  ),
  outer: (  // outer (usually right) margin
    sep: 5.0mm,  // padding between outer column and main body
    width: 15.0mm,  // width of outer column
    far: 5.0mm,  // padding between outer column and page border
  ),
  top: 25.0mm,  // top margin
  bottom: 25.0mm,  // bottom margin
  clearance: 12.0pt,  // padding between adjacent notes
  text-style: (  // text-tyle parameter for notes
    size: 9.35pt,
    style: "normal",
    weight: "regular"
  )
)

#let setup_a4 = setup_defaults

#let setup_us-letter = (  // 8.5in × 11.0in US paper size, 10.0pt font
  alternate: false,  // whether to alternate inner/outer on every page
  inner: (  // inner (usually left) margin
    far: 5.7mm,  // 5.0mm
    width: 15.0mm,  // 15.0mm
    sep: 5.0mm,  // 5.0mm
  ),
  outer: (  // outer (usually right) margin
    far: 5.7mm,  // 5.0mm
    width: 50.0mm,  // 15.0mm
    sep: 5.0mm,  // 5.0mm
  ),
  top: 25.7mm,  // top margin
  bottom: 25.7mm,  // bottom margin
  clearance: 12.0pt,  // padding between adjacent notes
  text-style: (  // text-tyle parameter for notes
    size: 8.5pt,
    style: "normal",
    weight: "regular"
  )
)

#let setup(
  paper_size: "us-letter",
  font_size: 10.0pt,
  alternate: false,
  inner: auto,
  outer: auto,
  vertical: auto,
  clearance: 12.0pt,
  text-style: auto,
  doc
) = {
  _paper_size.update(lower(paper_size))
  _font_size.update(font_size)
  if lower(paper_size) == "us-letter" {
    inner = (
      far: 5.7mm,
      width: 15.0mm,
      sep: 5.0mm
    )
    outer = (
      far: 5.7mm,
      width: 50.0mm,
      sep: 5.0mm
    )
    vertical = 25.7mm
  } else if lower(paper_size) == "a4" {
    inner = (
      far: 5.0mm,
      width: 15.0mm,
      sep: 5.0mm
    )
    outer = (
      far: 5.0mm,
      width: 50.0mm,
      sep: 5.0mm
    )
    vertical = 25.0mm
  } else {
    panic("unsupported paper size: " + _paper_size.get())
  }

  show: marginalia.setup.with(
    alternate: alternate,
    inner: inner,
    outer: outer,
    top: vertical,
    bottom: vertical,
    clearance: clearance
  )

  set figure(gap: 0.0pt)

  show figure.where(kind: image): set figure.caption(position: top)
  show figure.caption.where(kind: image): marginalia.note.with(
    alignment: "top",
    counter: none,
    shift: "avoid",
    keep-order: true,
    text-style: (
      size: 0.85 * font_size,
      style: "normal",
      weight: "regular"
    )
  )

  show figure.where(kind: table): set figure.caption(position: top)
  show figure.caption.where(kind: table): marginalia.note.with(
    alignment: "top",
    counter: none,
    shift: "avoid",
    keep-order: true,
    text-style: (
      size: 0.85 * font_size,
      style: "normal",
      weight: "regular"
    )
  )

  show figure.where(kind: raw): set figure.caption(position: bottom)

  doc
}

// NOTE IN OUTER MARGIN WITH NUMBERING
// USAGE: #marginalis( ... )[my note here]
#let marginalis( ..args ) = {
  context marginalia.note(
    side: "outer",
    alignment: "baseline",
    numbering: (..i) => super(numbering("1", ..i)),
    link-anchor: true,
    text-style: (
      size: 0.85 * _font_size.get(),
      style: "normal",
      weight: "regular",
    ),
    ..args
  )
}

// NOTE IN OUTER MARGIN WITHOUT NUMBERING
// USAGE: #marginale( ... )[my note here]
#let marginale( ..args ) = {
  context marginalia.note(
    side: "outer",
    alignment: "baseline",
    counter: none,
    numbering: none,
    anchor-numbering: none,
    text-style: (
      size: 0.85 * _font_size.get(),
      style: "normal",
      weight: "regular"
    ),
    ..args
  )
}

#let apostille( ..args ) = {
  context marginalia.note(
    side: "inner",
    alignment: "baseline",
    counter: none,
    numbering: none,
    anchor-numbering: none,
    text-style: (
      size: 0.85 * _font_size.get(),
      style: "italic",
      weight: "regular"
    ),
    ..args
  )
}
// #let apostille = marginalia.note.with(
//   side: "inner",
//   alignment: "baseline",
//   counter: none,
//   numbering: none,
//   anchor-numbering: none,
//   text-style: (
//     size: 8.5pt,  // 0.85 * <body_font_size:pt>
//     style: "italic",
//     weight: "regular",
//   )
// )

// SMALL FIGURE IN OUTER MARGIN
// USAGE: #illumination( image( ... ), caption: "my caption here" )
#let illumination(..args) = {
  show figure.where(kind: image): set figure.caption(position: bottom)
  context marginalia.notefigure(
    side: "outer",
    alignment: "caption-top",
    text-style: (
      size: 0.85 * _font_size.get(),
      style: "normal",
      weight: "regular"
    ),
    ..args
  )
}
// #let illumination = marginalia.notefigure.with(alignment: "caption-top")

// #let apostille( ..args ) = {
//   set text(size: 10.0pt, style: "italic")
//   sidenote(
//     dy: 0.0pt,
//     gap: 0.0em,
//     side: left,
//     numbering: none,
//     format: it => {
//       // set align(right)
//       it.default
//     },
//     ..args
//   )
// }
// #let marginale( ..args ) = {
//   set text(size: 10.0pt)
//   sidenote(
//     dy: 0.0pt,
//     gap: 0.0em,
//     side: right,
//     numbering: none,
//     padding: (
//       left: 18.0pt,
//       right: page-margin-right - 180.0pt
//     ),
//     format: it => {
//       // set par(leading: 0.65em)
//       it.default
//     },
//     ..args
//   )
// }
// #let marginalis( ..args ) = {
//   set text(size: 10.0pt)
//   sidenote(
//     dy: 0.0pt,
//     gap: 0.0em,
//     side: right,
//     numbering: "1",
//     padding: (
//       left: 18.0pt,
//       right: page-margin-right - 180.0pt
//     ),
//     format: it => {
//       // set par(leading: 0.65em)
//       it.default
//     },
//     ..args
//   )
// }

// #let marginfigure( fig, dy: 0.0pt, caption: none ) = {
//   marginale(dy: dy)[
//     #box( figure( fig, caption: caption ) )
//   ]
// }
