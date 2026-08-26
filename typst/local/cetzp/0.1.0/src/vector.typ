#import "@preview/cetz:0.5.2" as cetz

#let len = cetz.vector.len
#let norm = cetz.vector.norm

#let add = cetz.vector.add
#let sub = cetz.vector.sub

#let scale = cetz.vector.scale
#let div = cetz.vector.div

#let direction(u, v) = cetz.vector.norm(cetz.vector.sub(v, u))

// #let resolve(coord) = cetz.draw.get-ctx(ctx => {

// })
