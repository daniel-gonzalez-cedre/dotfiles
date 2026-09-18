#let setup(
  doc
) = {
  set table(align: (x, y) => { if y == 0 { horizon + center } else { horizon + left } })

  // show table: set text(size: 0.85em)

  show figure.where(kind: table): set figure(supplement: [Table], numbering: "1.")
  // show figure.where(kind: table): set block(above: 0.0pt, below: 0.0pt)
  show figure.where(kind: table): set table.hline(stroke: (thickness: 0.375pt, cap: "butt"))
  show figure.where(kind: table): set table.vline(stroke: (thickness: 0.375pt, cap: "butt"))
  show figure.where(kind: table): set table(stroke: (x, y) => (
    left: none,
    right: none,
    top: if y == 0 {
      stroke(
        // paint: color.off.black,
        thickness: 0.8pt,
        cap: "butt"
      )
    } else { 0.0pt },
    bottom: stroke(
      // paint: color.off.black,
      thickness: 0.8pt,
      cap: "butt"
    )
  ))

  show figure.where(kind: table): set figure.caption(position: top, separator: [ ])

  show table.cell: text.with(top-edge: "ascender", bottom-edge: "descender")

  doc
}

#let tablet( caps: true, cap: "butt", ..args ) = {
  show table.cell: it => {
    if it.y == 0 and caps {
      smallcaps(text(top-edge: "ascender", bottom-edge: "descender")[#it])
    } else {
      text(top-edge: "ascender", bottom-edge: "descender")[#it]
    }
  }
  set table.hline(stroke: (thickness: 0.375pt, cap: cap))
  set table.vline(stroke: (thickness: 0.375pt, cap: cap))
  set table(stroke: (x, y) => (
    left: none,
    right: none,
    top: if y == 1 { none } else { 0.0pt },
    bottom: stroke(
      // paint: color.off.black,
      thickness: 0.8pt,
      cap: cap
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
