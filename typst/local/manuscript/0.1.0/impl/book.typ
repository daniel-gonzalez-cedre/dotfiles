#import "@local/maths:0.1.0" as maths
#import "@local/tables:0.1.0" as tables
#import "@local/marginalia:0.1.0" as marginalia: marginalis, marginale, apostille, wideblock

#import "src/formatting.typ" as formatting
#import "src/colors.typ" as colors
#import "src/fonts.typ" as fonts

#import "matter/cover.typ" as matter-cover
#import "matter/front.typ" as matter-front

#let book(
  author: "Daniel Gonzalez Cedre",
  title: [The Title],
  shorttitle: none,
  date: datetime.today(),
  publisher: none,
  university: none,
  course: none,
  code: none,
  show_cover: true,
  show_toc: true,
  show_back: true,
  bib: none,
  paper-size: "us-letter",  // 215.9mm x 279.4mm
  paper-color: "pulp",
  font-size: 10pt,
  chapter-zero: false,
  doc
) = {
  show: maths.setup.with(
    body-font: "Palatino Linotype",
    math-font: "New Computer Modern Math"
  )

  if chapter-zero { maths.counters.offset.update(-1) }

  set document(
    title: title,
    author: author,
    date: date,
  )

  set page(
    paper: paper-size,
    fill: if paper-color in ("pulp", "natural") { colors.paper.pulp } else { colors.paper.bleached },
    header: none,
    footer: none,
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

  // LIST MARKERS CYCLE BASED ON INDENTATION LEVEL
  // TODO: FOR MUSICAL NOTE MARKERS, MAKE MARKERS APPEND AS NESTING INCREASES
  // let list_markers = (sym.note.eighth.alt, sym.note.eighth.beamed, sym.note.sixteenth.beamed)
  // let list_markers = (sym.quote.chevron.r.single, sym.quote.chevron.r.double, sym.quote.chevron.r.single + sym.quote.chevron.r.double)
  // // let list_markers = (sym.quote.chevron.r.single, sym.quote.chevron.r.double).map(it => scale(origin: bottom, y: 125%, it))
  // set list(marker: depth => {
  //   // markers => markers.at(calc.rem(depth, markers.len()))
  //   markers => markers.at(if depth >= markers.len() { markers.len() - 1 } else { depth })
  // }(list_markers))

  // set enum(indent: 1.0em, body-indent: 1.0em)
  show enum: set par(justify: true)

  show figure.where(kind: image): set figure(supplement: [Figure], numbering: "1.")
  show figure.where(kind: image): set figure.caption(separator: [ ])

  show: tables.setup
  show figure.where(kind: table): set figure(supplement: [Table], numbering: "1.")
  show figure.where(kind: table): set figure.caption(separator: [ ])

  show figure.where(kind: raw): set figure(supplement: [Algorithm], numbering: "1.")
  show figure.where(kind: raw): set figure.caption(separator: [ ])

  if show_cover {
    show: matter-cover.cover.with(
      title: title,
      author: author,
      date: date,
      publisher: publisher,
      university: university,
      course: course,
      code: code,
    )
  }

  if show_toc {
    show: matter-front.toc
  }

  // show: marginalia.show-frame
  show: marginalia.setup.with(
    paper-size: "us-letter",
    font-size: 10pt,
  )

  counter(page).update(0)

  set heading(
    numbering: (..nums) => (
      nums.pos().slice(0, 1).map(x => x - (if chapter-zero {1} else {0}))
      + nums.pos().slice(1,)
    ).map(str).join(".")
  )

  show heading.where(level: 1): it => {
    set text(size: 22pt, style: "italic", weight: "bold")
    maths.counters.definition.update(0)
    maths.counters.axiom.update(0)
    maths.counters.theorem.update(0)
    maths.counters.lemma.update(0)
    maths.counters.corollary.update(0)
    maths.counters.exercise.update(0)
    maths.counters.algorithm.update(0)
    if it.numbering != none {
      block(below: 28pt)[
        #v(78pt)
        #counter(heading).display()
        #v(1.2em, weak: true)
        #it.body
      ]
    } else {
      block[
        #v(32pt + 48pt)
        #it.body
      ]
    }
  }
  show heading.where(level: 2): it => {
    set text(size: 13pt, style: "italic", weight: "bold")
    block(
      // above: 28pt,
      above: 22pt,
      below: 16pt
    )[#formatting.llap(margin: 13.5pt)[#counter(heading).display()]#it.body]
  }
  show heading.where(level: 3): it => {
    set text(size: 12pt, style: "italic", weight: "bold")
    block(
      // above: 28pt,
      above: 22pt,
      below: 16pt
    )[#it.body]
  }

  // set math.equation(numbering: (..nums) => {
  //   let num = "(" + counter(heading).get().map(str).at(0) + "." + nums.pos().map(str).join(".") + ")"
  //   serif[#num]
  // })

  // show link: set text(luma(50))

  doc

  if bib != none {
    show bibliography: set text(size: 9pt)
    show bibliography: set par(justify: false)
    set bibliography(title: none)
    heading(level: 1, [Bibliography])
    bib
  }
}
