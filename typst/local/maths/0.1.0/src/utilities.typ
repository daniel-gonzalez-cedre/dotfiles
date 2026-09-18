#let pt2float(ell) = float(repr(ell).split("p").at(0))
#let float2pt(eff) = eff * 1.0pt

#let to-string(it) = {
  if type(it) == str {
    return it
  // } else if type(it) == array {
  //   return it.map(to-string).join()
  } else if type(it) != content {
    return str(it)
  } else if it.has("text") {
    return it.text
  } else if it.has("children") {
    return it.children.map(to-string).join()
  } else if it.has("body") {
    return to-string(it.body)
  } else if it == [ ] {
    " "
  } else {
    panic()
  }
}
