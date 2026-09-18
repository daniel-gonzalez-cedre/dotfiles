#import "@local/maths:0.1.0" as maths
#import "@local/tables:0.1.0" as tables
#import "@local/marginalia:0.1.0" as marginalia: marginalis, marginale, apostille, fullblock, wideblock

#import "src/formatting.typ" as formatting
#import "src/colors.typ" as colors
#import "src/fonts.typ" as fonts

#let article(
  author: "Daniel Gonzalez Cedre",
  doctype: none,
  title: [The Title],
  shorttitle: none,
  number: none,
  date: datetime.today(),
  publisher: none,
  university: none,
  course: none,
  code: none,
  bib: none,
  paper-size: "us-letter",  // 215.9mm x 279.4mm
  paper-color: "pulp",
  font-size: 10pt,
  doc
) = {
  show: maths.setup.with(
    body-font: "Palatino Linotype",
    math-font: "New Computer Modern Math",
    offset: if number != none and number != 0 { number - 1 } else { -1 }
  )

  set document(
    title: title,
    author: author,
    date: date,
  )

  set page(
    paper: paper-size,
    fill: if paper-color in ("pulp", "natural") { colors.paper.pulp } else { colors.paper.bleached },
    header: context {
      let doctype = if doctype == none { "" } else { smallcaps(str(doctype)) }
      let number  = if number  == none { "" } else { number }
      wideblock[
        #emph(formatting.display-date(long: true, date))
        #h(1fr)#doctype #number#h(2cm)
        #v(1em)
      ]
    },
    footer: context {
      // set text(size: 0.85*font-size)
      // fullblock(
      //   align(center)[
      //     $frac(#text( ..fonts.select("Palatino Linotype") )[#counter(page).display()], #text( ..fonts.select("Palatino Linotype") )[#counter(page).final().first()], style: "skewed")$
      //   ]
      // )
      fullblock(align(center)[#counter(page).display()])
    },
  )

  set par(justify: true)

  set text(
    ..fonts.select("Palatino Linotype"),
    fill: colors.ink,
    size: font-size
  )

  show raw: set text( ..fonts.select("TX-02"), size: 1em )
  show raw.where(block: true): set text( ..fonts.select("TX-02"), size: 1em/0.8 )

  set smallcaps(all: true)

  set underline(
    offset: 2pt,
    stroke: (
      cap: "round",
      dash: "dotted",
    )
  )

  show quote.where(block: false, quotes: true): text.with(..fonts.select("Palatino Linotype"), style: "italic")
  show quote.where(block: false, quotes: auto): text.with(..fonts.select("Palatino Linotype"), style: "italic")
  show quote.where(block: false, quotes: false): text.with(..fonts.select("Palatino Linotype"), style: "normal")

  let symbol_repeater(depth, symbol, tight: false) = {
    assert(depth >= 0)
    if depth == 0 {
      return symbol
    } else {
      if tight {
        return symbol_repeater(depth - 1, symbol, tight: tight) + h(-1pt) + symbol
      } else {
        return symbol_repeater(depth - 1, symbol, tight: tight) + symbol
      }
    }
  }

  show list: set par(justify: true)
  set list(marker: depth => symbol_repeater(depth, sym.quote.chevron.r.single, tight: true))
  // set list(marker: depth => {
  //   let char = sym.quote.chevron.r.single
  //   let mark = ""
  //   for i in range(depth) {
  //     mark = mark + char
  //   }
  //   return mark
  // })

  show enum: set par(justify: true)

  show figure.where(kind: image): set figure(supplement: [Figure], numbering: "1.")
  show figure.where(kind: image): set figure.caption(separator: [ ])

  show: tables.setup  // @local/tables
  show figure.where(kind: table): set figure(supplement: [Table], numbering: "1.")
  show figure.where(kind: table): set figure.caption(separator: [ ])

  show figure.where(kind: raw): set figure(supplement: [Algorithm], numbering: "1.")
  show figure.where(kind: raw): set figure.caption(separator: [ ])

  // show: marginalia.show-frame
  show: marginalia.setup.with(
    paper-size: "us-letter",
    font-size: 10pt,
  )

  if number not in (none, 0) { counter(heading).update(number - 1) }

  set heading(
    numbering: (..nums) => (
      nums.pos().slice(0, 1).map(x => x - (if number == 0 {1} else {0}))
      + nums.pos().slice(1,)
    ).map(str).join(".")
  )

  show heading.where(level: 1): it => {
    set text(size: 18pt, style: "italic", weight: "bold")
    maths.counters.definition.update(0)
    maths.counters.axiom.update(0)
    maths.counters.theorem.update(0)
    maths.counters.lemma.update(0)
    maths.counters.corollary.update(0)
    maths.counters.exercise.update(0)
    maths.counters.algorithm.update(0)
    if number == none {
      block(
        above: 22pt,
        below: 16pt
      )[#it.body]
    } else {
      block(
        above: 22pt,
        below: 16pt
      )[#formatting.llap(margin: 13.5pt)[#counter(heading).display()]#it.body]
    }
  }
  show heading.where(level: 2): it => {
    set text(size: 14pt, style: "italic", weight: "bold")
    block(
      above: 22pt,
      below: 16pt
    )[#formatting.llap(margin: 13.5pt)[#counter(heading).display()]#it.body]
  }
  show heading.where(level: 3): it => {
    set text(size: 12pt, style: "italic", weight: "bold")
    block(
      above: 22pt,
      below: 16pt
      // formatting.llap[ #counter(heading).display() #h(11pt) ]
      // + it.body
    )[#it.body]
  }

  // set math.equation(numbering: (..nums) => {
  //   let num = "(" + counter(heading).get().map(str).at(0) + "." + nums.pos().map(str).join(".") + ")"
  //   serif[#num]
  // })

  // show link: set text(style: "italic", weight: "bold", fill: colors.fg.transparentize(25%))

  doc

  if bib != none {
    show bibliography: set text(size: 9pt)
    show bibliography: set par(justify: false)
    set bibliography(title: none)
    heading(level: 1, [Bibliography])
    bib
  }
}
