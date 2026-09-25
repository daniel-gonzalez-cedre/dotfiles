#import "src/environments.typ" as environments: equation, fragment, case, case-basis, case-inductive
#import "src/theorems.typ" as theorems: definition, axiom, theorem, lemma, corollary, exercise, algorithm
#import "src/proofs.typ" as proofs: proof

#import "src/definitions.typ" as definitions

#import "src/formatting.typ" as formatting: math-text, text-math, under

#import "src/counters.typ" as counters

#import "src/fonts.typ" as fonts

#let setup(doc, offset: 0, body-font: auto, math-font: auto) = {
  counters.offset.update(offset)

  if body-font != auto { fonts._body-font.update(body-font) }

  let math-fonts = ("New Computer Modern Math", "TeX Gyre Pagella Math", "Concrete Math", "Euler Math")
  assert(math-font == auto or math-font in math-fonts)

  if math-font != auto { fonts._math-font.update(math-font) }

  show ref: it => {
    if it.element != none and it.element.func() == metadata and type(it.element.value) == dictionary and it.element.value.at("kind", default: none) == "theorem" {
      link(it.target)[#text(style: "italic", weight: "regular")[#it.element.value.supplement~#it.element.value.number]]
      // link(it.target)[#it.element.value.supplement~#it.element.value.number]
    } else {
      it
    }
  }

  show math.equation: set text(
    font: if math-font == auto { "New Computer Modern Math" } else { math-font },
    number-type: "lining",
  )

  show math.equation: set block(breakable: true)

  show math.equation.where(block: false): set math.lr(size: 100%)
  show math.equation.where(block: true): set math.lr(size: 100% + 2pt)
  // show math.equation: set text(font: if math-font == auto { "Concrete Math" } else { math-font })
  // show math.text: set text(
  //   font: "Palatino Linotype",
  //   number-type: "old-style",
  // )
  // show math.op: set text(font: if math-font == auto { "New Computer Modern Math" } else { math-font })

  // show math.text: it => {
  //   let tostr(it) = if type(it) == str {it}
  //   else if type(it) != content {str(it)}
  //   else if it.has("text") {it.text}
  //   else if it.has("children") {it.children.map(tostr).join()}
  //   else if it.has("body") {tostr(it.body)}
  //   else if it == [ ] {" "}
  //   if tostr(it).match(regex("[0-9]")) != none {
  //     text(font: math-font, it)
  //   }
  //   else {
  //     text(font: text-font, it)
  //   }
  // }

  show math.models: math.class("relation", math.tack.rr)

  show math.and: math.class("relation", math.and)
  show math.or: math.class("relation", math.or)

  show math.gt.eq: math.gt.eq.slant
  show math.lt.eq: math.lt.eq.slant

  show math.nothing: math.diameter
  show math.emptyset: math.diameter

  show math.subset: math.subset.eq
  show math.subset.not: math.subset.eq.not

  let diacritic = (
    grave: (
      single: x => x + "\u{300}",
      double: x => x + "\u{30F}"  // NOT SUPPORTED
    ),
    acute: (
      single: x => x + "\u{301}",
      double: x => x + "\u{30B}"
    ),
    dot: (
      over:   x => x + "\u{307}",
      double: x => x + "\u{308}",
      under:  x => x + "\u{323}"
    ),
    umlaut:   x => x + "\u{308}",
    diaresis: x => x + "\u{308}",
    tilde: x => x + "\u{303}",
    circumflex: x => x + "\u{302}",
    caron: x => x + "\u{30C}",  // NOT SUPPORTED
  )

  show "Erdos": [Erd#(diacritic.acute.double)[o]s]
  show "Godel": [G#(diacritic.umlaut)[o]del]
  show "Lindstrom": [Lindstr#(diacritic.umlaut)[o]m]
  show "Schroder": [Schr#(diacritic.umlaut)[o]der]

  doc
}
