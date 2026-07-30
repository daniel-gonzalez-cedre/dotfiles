#import "@local/cetzp:0.1.0" as cetzp: cetz, canvas, inks

#set page(
  fill: none,
  width: auto,
  height: auto,
  margin: 0.0pt
)

#canvas({
  import cetzp: draw, elements
  import elements: point, arc, arc-through, line, edge, path, region

  let A = (0, 0)
  let B = (1, 0)
  let C = (0, 1)
  let D = (1, 1)


  edge(A, B)

  arc-through(A, C, D)

  // region(A, B, C, fill: inks.off.black.transparentize(50.0%))

  point(A, fill: inks.blue)
  point(B, fill: inks.red)
  point(C, fill: inks.orange)
  point(D, fill: inks.green)


})
