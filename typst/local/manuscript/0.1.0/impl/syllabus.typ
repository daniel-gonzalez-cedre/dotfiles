#import "@local/maths:0.1.0" as maths
#import "@local/tables:0.1.0" as tables
#import "@local/marginalia:0.1.0" as marginalia: marginalis, marginale, apostille, fullblock, wideblock

#import "src/formatting.typ" as formatting
#import "src/colors.typ" as colors
#import "src/fonts.typ" as fonts

#let syllabus(
  author: "Daniel Gonzalez Cedre",
  title: "Syllabus",
  shorttitle: none,
  date: datetime.today(),
  semester: none,
  publisher: none,
  university: none,
  course: none,
  code: none,
  abstract: [],
  paper-size: "us-letter",
  paper-color: "natural",
  font-size: 10pt,
  doc
) = {
  show: maths.setup.with(
    body-font: "Palatino Linotype",
    math-font: "New Computer Modern Math"
  )  // @local/maths

  set document(
    title: title,
    author: author,
    date: date,
  )

  set page(
    paper: paper-size,
    fill: if paper-color in ("pulp", "natural") { colors.paper.pulp } else { colors.paper.bleached },
    header: context {
      if counter(page).get().at(0) == 1 {
        fullblock[
          #emph[#formatting.display-date(long: true, date)]
          #h(1fr)
          #box(baseline: 1em, image(height: 15pt, "assets/illinois.pdf"))
        ]
      } else {
        fullblock[
          #emph[#formatting.display-date(long: true, date)]
          #h(1fr)
          #smallcaps[Syllabus]
          #v(1em)
        ]
      }
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

  // set list(indent: 1.0em, body-indent: 1.0em)
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

  // set enum(indent: 1.0em, body-indent: 1.0em)
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

  // set heading(numbering: "1.1")
  set heading(
    numbering: (..nums) => (
      nums.pos().slice(0, 1).map(x => x)
      + nums.pos().slice(1,)
    ).map(str).join(".")
  )

  show heading.where(level: 1): it => {
    set text(size: 13pt, style: "italic", weight: "bold")
    block(
      above: 28pt,
      below: 16pt
    )[#formatting.llap[#counter(heading).display() #h(11pt)]#it.body]
  }
  show heading.where(level: 2): it => {
    set text(size: 12pt, style: "italic", weight: "regular")
    block(
      above: 22pt,
      below: 16pt,
      it.body
    )
  }
  show heading.where(level: 3): it => {
    set text(size: 11pt, style: "italic", weight: "regular")
    block(
      above: 28pt,
      below: 16pt,
      it.body
    )
  }

  [
    #set text(style: "italic", weight: "regular")
    #text(size: 15pt)[#title]
    #v(-6pt)
    #text(size: 12pt)[#course]
    #v(-4pt)
    #text(size: 12pt)[#semester]
  ]

  fullblock(
    pad(16pt)[
      #set text(style: "italic", weight: "regular")
      #abstract
    ]
  )

  doc
}
