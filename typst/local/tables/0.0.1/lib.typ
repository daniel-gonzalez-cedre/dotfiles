#import "@local/colors:0.0.1": *
#import "@local/fonts:0.0.1": *

#import "@local/margins:0.0.1": sidenote

#let tables(
  doc
) = {
  set table(align: (x, y) => { if y == 0 { horizon + center } else { horizon + left } })

  show table: set text(size: 9.0pt)

  show figure.where(kind: table): set figure(supplement: [Table], numbering: "1.")
  show figure.where(kind: table): set block(above: 0.0pt, below: 0.0pt)
  show figure.where(kind: table): set table.hline(stroke: (thickness: 0.375pt, cap: "round"))
  show figure.where(kind: table): set table(stroke: (x, y) => (
    left: none,
    right: none,
    top: if y == 0 {
      stroke(
        paint: color.off.black,
        thickness: 0.8pt,
        cap: "round"
      )
    } else { 0.0pt },
    bottom: stroke(
      paint: color.off.black,
      thickness: 0.8pt,
      cap: "round"
    )
  ))

  show figure.where(kind: table): set figure.caption(position: top)
  show figure.caption.where(kind: table): it => {
    sidenote(
      dy: 2.0em,
      side: right,
      numbering: none,
      padding: (
        left: 2.0em,
        right: 5.0em
      )
    )[
      #it.supplement
      #context it.counter.display(it.numbering)
      #it.body
    ]
  }

  doc
}

#let tablet( ..args ) = {
  show table.cell: it => { if it.y == 0 { smallcaps(it) } else { it } }
  set table(stroke: (x, y) => (
    left: none,
    right: none,
    top: if y == 1 { none } else { 0.0pt },
    bottom: stroke(
      paint: color.off.black,
      thickness: 0.8pt,
      cap: "round"
    )
  ))
  table( ..args )
}

// #let table-header( sc: true, ..headers ) = {
//   set table(stroke: (x, y) => {
//     if y == 0 {(
//       top: 0.0pt,
//       bottom: stroke(
//         paint: color.red,
//         thickness: 0.8pt,
//         cap: "round"
//       )
//     )}
//   })
//   if sc {
//     return table.header( ..headers.pos().map(smallcaps) )
//   } else {
//     return table.header( ..headers.pos().map(x => x) )
//   }
// }
