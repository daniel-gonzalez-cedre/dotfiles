#import "@local/colors:0.0.1": *
#import "@local/fonts:0.0.1": *
#import "@local/defs:0.0.1": *

#let maths(doc) = {
  show math.and: math.class("relation", math.and)
  show math.or: math.class("relation", math.or)

  show math.gt.eq: math.gt.eq.slant
  show math.lt.eq: math.lt.eq.slant

  show math.nothing: math.diameter
  show math.emptyset: math.diameter

  show math.subset: math.subset.eq
  show math.subset.not: math.subset.eq.not

  show "wff ": text(style: "italic", "wff ")
  show "iff ": text(style: "italic", "iff ")

  show "i.e.,": text(style: "italic", "i.e.,")
  show "e.g.,": text(style: "italic", "e.g.,")

  show "Erdos": [Erd#(diacritic.acute.double)[o]s]
  show "Godel": [G#(diacritic.umlaut)[o]del]
  show "Schroder": [Schr#(diacritic.umlaut)[o]der]

  // show math.equation: set text(font: "Euler Math")
  show math.equation: set text(font: "TeX Gyre Pagella Math")

  doc
}

#let sum = {
  set text(font: "New Computer Modern Math")
  $sum$
}
#let product = {
  set text(font: "New Computer Modern Math")
  $product$
}

#let cal = term => {
  set text(font: "New Computer Modern Math")
  $cal(term)$
}
#let scr = term => {
  set text(font: "New Computer Modern Math")
  $scr(term)$
}

#let equation = math.equation.with(block: true, numbering: (..nums) => {
  let num = "(" + counter(heading).get().map(str).at(0) + "." + nums.pos().map(str).join(".") + ")"
  serif[#num]
})

#let even(x) = $#x$ + " is even"
#let odd(x) = $#x$ + " is odd"
#let prime(x) = $#x$ + " is prime"
#let composite(x) = $#x$ + " is composite"

#let cardinality(x) = math.abs(x)
#let card(x) = math.abs(x)
#let norm(x) = math.bar.v.double + x + math.bar.v.double
// #let suc(n) = $op(frak("s"))(#n)$
#let suc(n) = $op(frak("suc"))(#n)$
#let pre(n) = $op(frak("pre"))(#n)$
#let nat(n) = math.lr(sym.bracket.l.stroked) + n + math.lr(sym.bracket.r.stroked)

#let walk(p) = $#p$ + " is a walk"
#let path(p) = $#p$ + " is a path"
#let circuit(p) = $#p$ + " is a circuit"
#let cycle(p) = $#p$ + " is a cycle"

#let deg(G, ..v) = {
  if v.pos().len() == 0 {
    $mono("deg")_(#G)$
  } else {
    $mono("deg")_(#G)(#v.pos().at(0))$
  }
}
// #let degree(G, v) = $mono(deg)_(G)(v)$

// #let domain(f)   = $op(frak("dom"))(#f)$
// #let codomain(f) = $op(frak("cod"))(#f)$

#let dom(f)      = $op(frak("dom"))(#f)$
#let cod(f)      = $op(frak("cod"))(#f)$
#let ran(f)      = $op(frak("ran"))(#f)$

#let fib = math.class("normal", cal("F"))

#let id = math.class("normal", mono("id"))

#let max = mono("max")
#let min = mono("min")

#let symdif = math.class("binary", math.triangle)
#let setminus = math.class("binary", math.without)
#let unions = math.class("unary", math.union)
#let inters = math.class("unary", math.inter)

// #let math.union.over = math.class("unary", math.union)
// #show sym.union.over: sym.gt.eq.slant
#let sets = (
  union: math.class("unary", math.union),
  inter: math.class("unary", math.inter),
  minus: math.class("binary", math.without),
  without: math.class("binary", math.without),
)

// #let intersection = math.inter

#let string(finite: true, content) = {
  let ellipsis = if finite {
    ""
  } else {
    "..."
  }
  mono("\"") + mono(content) + ellipsis + mono("\"")
}
#let striing = string.with(finite: false)
#let len = $mono(weight: "medium", "len")$

#let st = math.mid(math.bar.v)
#let to = math.arrow.r
#let inj = math.arrow.hook
#let sur = math.arrow.twohead
#let monic = math.arrow.hook
#let epic = math.arrow.twohead
#let contradiction = text(
  stroke: (
    paint: color.off.black,
    thickness: 0.4pt,
    join: "round",
  ),
  "↯"
)
// #let contradiction = text(
//   stroke: (
//     paint: color.off.black,
//     thickness: 0.375pt,
//     join: "round",
//   )
// )[$arrow.zigzag$]

#let implies = context {
  if query(selector(math.equation).before(here())).last().block {
    h(0.75em, weak: true) + math.arrow.r.double + h(0.75em, weak: true)
  } else {
    math.space + math.arrow.r.double + math.space
  }
}

#let iff = context {
  if query(selector(math.equation).before(here())).last().block {
    h(0.75em, weak: true) + math.arrow.l.r.double + h(0.75em, weak: true)
  } else {
    math.space + math.arrow.l.r.double + math.space
  }
}

#let deff = context {
  if query(selector(math.equation).before(here())).last().block {
    h(0.75em, weak: true) + sym.colon + math.arrow.l.r.double + h(0.75em, weak: true)
  } else {
    math.space + sym.colon + math.arrow.l.r.double + math.space
  }
}

#let proves = context {
  if query(selector(math.equation).before(here())).last().block {
    h(0.75em, weak: true) + math.tack.r + h(0.75em, weak: true)
  } else {
    // math.tack.r
    h(0.5em, weak: true) + math.tack.r + h(0.5em, weak: true)
  }
}

#let notproves = context {
  if query(selector(math.equation).before(here())).last().block {
    h(0.75em, weak: true) + math.tack.r.not + h(0.75em, weak: true)
  } else {
    // math.tack.r
    h(0.5em, weak: true) + math.tack.r.not + h(0.5em, weak: true)
  }
}

#let entails = context {
  if query(selector(math.equation).before(here())).last().block {
    h(0.75em, weak: true) + math.tack.r.double + h(0.75em, weak: true)
  } else {
    // math.tack.r.double
    h(0.5em, weak: true) + math.tack.r.double + h(0.5em, weak: true)
  }
}

#let notentails = context {
  if query(selector(math.equation).before(here())).last().block {
    h(0.75em, weak: true) + math.tack.r.double.not + h(0.75em, weak: true)
  } else {
    // math.tack.r.double
    h(0.5em, weak: true) + math.tack.r.double.not + h(0.5em, weak: true)
  }
}

#let def = (
  iff: (
    () => context {
      if query(selector(math.equation).before(here())).last().block {
        h(0.75em, weak: true) + math.colon + math.arrow.l.r.double + h(0.75em, weak: true)
      } else {
        math.class("relation", math.colon + math.arrow.l.r.double)
      }
    }
  )(),
  eq: math.class("relation", $:=$),
)


#let counter-fragment = counter("fragment")
#let counter-case = counter("case")
#let counter-definition = counter("definition")
#let counter-axiom = counter("axiom")
#let counter-theorem = counter("theorem")
#let counter-lemma = counter("lemma")
#let counter-corollary = counter("corollary")
#let counter-exercise = counter("exercise")
#let counter-algorithm = counter("algorithm")

#let _offset = state("_offset", 0)
#let offset_theorems(value) = _offset.update(value)

#let fragment(
  content,
  title: "Fragment",
  name: none,
  numbering: true,
  reset: false,
  weight: "regular"
) = {
  counter-case.update(0)
  if reset and numbering { counter-fragment.update(0) }
  if numbering { counter-fragment.step() }
  context {
    let number = if numbering {
      " " + counter-fragment.display()
    } else {
      ""
    }
    let subtitle = if name == none {
      ""
    } else {
      " " + name + "."
    }
    let head = title + number + ":" + subtitle
    block(
      inset: (x: 1.0em),
      text(weight: weight, style: "italic", head) + linebreak() + content
    )
  }
}

#let case(
  content,
  title: "Case",
  name: none,
  numbering: true,
  number: none,
  reset: false,
  weight: "regular",
  size: fonts.sizes.cases
) = {
  if reset and numbering { counter-case.update(0) }
  if numbering { counter-case.step() }
  context {
    let number = if number != none {
      " " + str(number)
    } else if numbering {
      " " + counter-case.display()
    } else {
      ""
    }
    let subtitle = if name == none {
      ""
    } else {
      " " + name
    }
    let head = title + number + ":" + subtitle
    // set text(size: size)
    block(
      width: 100.0%,
      inset: (x: 1.0em),
      text(weight: weight, style: "italic", head) + linebreak() + content
    )
  }
}

#let case-basis(content) = case(content, title: "Basis Step", numbering: false, weight: "regular")
#let case-inductive(content) = case(content, title: "Inductive Step", numbering: false, weight: "regular")

// #figure(kind: "definition", supplement: "Def.")[A.1] <0.9Case>
#let definition(
  content,
  numbering: true,
  section: true,
  level: 1,
  offset: auto,
  title: "Definition",
  name: "",
  punctuation: ".",
  headbreak: true
) = {
  if numbering { counter-definition.step() }
  name = if name != "" { ": " + name }
  context {
    let offset = if offset == auto { _offset.get() } else { offset }
    let number = if numbering and section {
      " " + counter(heading.where(level: level)).get().map(x => str(x + offset)).join() + "." + counter-definition.display()
    } else if numbering {
      " " + counter-definition.display()
    } else {
      ""
    }
    let headline = if headbreak {
      text(size: fonts.sizes.titles, style: "italic", weight: "bold", title + number + name + punctuation) + h(1.0fr) + v(- 0.6em)
    } else {
      text(size: fonts.sizes.titles, style: "italic", weight: "bold", title + number + name + punctuation)
    }
    block( headline + content )
  }
}

#let axiom(
  content,
  numbering: true,
  number: none,
  section: false,
  level: 1,
  offset: auto,
  title: "Axiom",
  name: "",
  punctuation: ".",
  headbreak: true
) = {
  if numbering and number == none {
    counter-axiom.step()
  }
  // if numbering {
  //   counter-axiom.update(0)
  // } else if numbering {
  //   counter-axiom.step()
  // }
  // if numbering { counter-axiom.step() }
  name = if name != "" { ": " + name }
  context {
    let offset = if offset == auto { _offset.get() } else { offset }
    let num = if numbering and section {
      " " + counter(heading.where(level: level)).get().map(x => str(x + offset)).at(0) + "." + counter-axiom.display()
    } else if number != none {
      " " + str(number)
    } else if numbering {
      " " + counter-axiom.display()
    } else {
      ""
    }
    let headline = if headbreak {
      text(size: fonts.sizes.titles, style: "italic", weight: "bold", title + num + name + punctuation) + h(1.0fr) + v(- 0.6em)
    } else {
      text(size: fonts.sizes.titles, style: "italic", weight: "bold", title + num + name + punctuation)
    }
    block( breakable: false, headline + content )
  }
}

#let theorem(
  content,
  numbering: true,
  section: true,
  level: 1,
  offset: auto,
  title: "Theorem",
  name: "",
  punctuation: ".",
  headbreak: true
) = {
  if numbering { counter-theorem.step() }
  name = if name != "" { ": " + name }
  context {
    let offset = if offset == auto { _offset.get() } else { offset }
    let number = if numbering and section {
      " " + counter(heading.where(level: level)).get().map(x => str(x + offset)).at(0) + "." + counter-theorem.display()
    } else if numbering {
      " " + counter-theorem.display()
    } else {
      ""
    }
    let headline = if headbreak {
      text(size: fonts.sizes.titles, style: "italic", weight: "bold", title + number + name + punctuation) + h(1.0fr) + v(- 0.6em)
    } else {
      text(size: fonts.sizes.titles, style: "italic", weight: "bold", title + number + name + punctuation)
    }
    block( headline + content )
  }
}

#let lemma(
  content,
  numbering: true,
  section: true,
  level: 1,
  offset: auto,
  title: "Lemma",
  name: "",
  punctuation: ".",
  headbreak: true
) = {
  if numbering { counter-lemma.step() }
  name = if name != "" { ": " + name }
  context {
    let offset = if offset == auto { _offset.get() } else { offset }
    let number = if numbering and section {
      " " + counter(heading.where(level: level)).get().map(x => str(x + offset)).at(0) + "." + counter-lemma.display()
    } else if numbering {
      " " + counter-lemma.display()
    } else {
      ""
    }
    let headline = if headbreak {
      text(size: fonts.sizes.titles, style: "italic", weight: "bold", title + number + name + punctuation) + v(- 0.6em)
    } else {
      text(size: fonts.sizes.titles, style: "italic", weight: "bold", title + number + name + punctuation)
    }
    block( headline + content )
  }
}

#let corollary(
  content,
  numbering: true,
  section: true,
  level: 1,
  offset: auto,
  title: "Corollary",
  name: "",
  punctuation: ".",
  headbreak: true
) = {
  if numbering { counter-corollary.step() }
  name = if name != "" { ": " + name }
  context {
    let offset = if offset == auto { _offset.get() } else { offset }
    let number = if numbering and section {
      " " + counter(heading.where(level: level)).get().map(x => str(x + offset)).at(0) + "." + counter-corollary.display()
    } else if numbering {
      " " + counter-corollary.display()
    } else {
      ""
    }
    let headline = if headbreak {
      text(size: fonts.sizes.titles, style: "italic", weight: "bold", title + number + name + punctuation) + h(1.0fr) + v(- 0.6em)
    } else {
      text(size: fonts.sizes.titles, style: "italic", weight: "bold", title + number + name + punctuation)
    }
    block( headline + content )
  }
}

#let exercise(
  content,
  numbering: true,
  section: true,
  level: 1,
  offset: auto,
  title: "Exercise",
  name: "",
  punctuation: ".",
  headbreak: false
) = {
  if numbering { counter-exercise.step() }
  name = if name != "" { ": " + name }
  context {
    let offset = if offset == auto { _offset.get() } else { offset }
    let number = if numbering and section {
      " " + counter(heading.where(level: level)).get().map(x => str(x + offset)).at(0) + "." + counter-exercise.display()
    } else if numbering {
      " " + counter-exercise.display()
    } else {
      ""
    }
    let headline = if headbreak {
      // text(size: fonts.sizes.titles, style: "italic", weight: "bold", number + title + name + punctuation) + h(1.0fr) + v(- 0.6em)
      text(size: fonts.sizes.titles, style: "italic", weight: "bold", title + number + name + punctuation) + h(1.0fr) + v(- 0.6em)
    } else {
      // text(size: fonts.sizes.titles, style: "italic", weight: "bold", number + title + name + punctuation)
      text(size: fonts.sizes.titles, style: "italic", weight: "bold", title + number + name + punctuation)
    }
    block(
      // stroke: 1.0pt + color.light.blackish,
      // // fill: color.misc.clarified,
      // radius: 2.0pt,
      // outset: (x: 0.5em, y: 0.5em),
      // inset: 0.0em,
      headline + content
    )
  }
}

#let algorithm(
  content,
  numbering: true,
  section: true,
  level: 1,
  offset: auto,
  title: "Algorithm",
  name: "",
  punctuation: ".",
  headbreak: true
) = {
  if numbering { counter-algorithm.step() }
  name = if name != "" { ": " + name }
  context {
    let offset = if offset == auto { _offset.get() } else { offset }
    let number = if numbering and section {
      " " + counter(heading.where(level: level)).get().map(x => str(x + offset)).at(0) + "." + counter-algorithm.display()
    } else if numbering {
      " " + counter-algorithm.display()
    } else {
      ""
    }
    let headline = if headbreak {
      text(size: fonts.sizes.titles, style: "italic", weight: "bold", title + number + name + punctuation) + h(1.0fr) + v(- 0.6em)
    } else {
      text(size: fonts.sizes.titles, style: "italic", weight: "bold", title + number + name + punctuation)
    }
    block( headline + content )
  }
}

#let proof(
  content,
  title: "Proof",
  number: none,
  name: none,
  punctuation: ".",
  weight: "bold",
  headbreak: false,
  qedbreak: true,
  qed: none,
  exercise: false,
) = {
  // set page(fill: color.misc.cream)
  if exercise {
    qedbreak = false
    qed = sym.square
  }
  if number != none {
    number = " " + str(number)
  } else {
    number = ""
  }
  if name != none {
    name = ": " + name
  } else {
    name = ""
  }
  counter-case.update(0)
  counter-fragment.update(0)
  let headline = if headbreak {
    title + number + name + punctuation + v(- 0.6em)
  } else {
    title + number + name + punctuation + " "
  }
  // if qed == none { qed = text(size: 9.0pt, style: "italic", weight: "bold", "quod erat demonstrandum") }
  if qed == none { qed = smallcaps(lower("QED")) }
  let qedline = if qedbreak {
    v(- 0.6em) + h(1.0fr) + qed
  } else {
    h(1.0fr) + qed
  }
  block(
    // above: 1.0em,
    text(size: fonts.sizes.titles, style: "italic", weight: weight, headline)
    + content
    + text(size: fonts.sizes.titles, style: "normal", weight: "regular", qedline)
  )
}

// #let counter-axiom = counter("axiom")
// #let axiom(content, numbering: true, section: false, title: "Axiom", name: "", punctuation: ".", headbreak: true) = {
//   if numbering { counter-axiom.step() }
//   name = if name != "" { ": " + name }
//   context {
//     let number = if numbering and section {
//       " " + counter(heading).get().map(str).at(0) + "." + counter-axiom.display()
//     } else if numbering {
//       " " + counter-axiom.display()
//     } else {
//       ""
//     }
//     let headline = if headbreak {
//       text(size: fonts.sizes.titles, style: "italic", weight: "bold", title + number + name + punctuation) + h(1.0fr) + v(- 0.6em)
//     } else {
//       text(size: fonts.sizes.titles, style: "italic", weight: "bold", title + number + name + punctuation)
//     }
//     block( headline + content )
//   }
// }
