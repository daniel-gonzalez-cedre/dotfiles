// #import "@local/colors:0.0.1": *
// #import "@local/fonts:0.0.1": *

#import "@local/tables:0.0.1": *

#import "@local/maths:0.1.0" as maths
#import maths.definitions: *
#import maths.environments: *
#import maths.theorems: *
#import maths.proofs: *

#import "src/formatting.typ": sc, ca, BC, AD
#import "src/formatting.typ": llap

#import "src/colors.typ" as colors

#import "src/fonts.typ" as fonts

// #import "matter/cover.typ" as cover
#import "matter.typ" as matter

// #import "@local/margins:0.0.1": *

// #import "@preview/marginalia:0.3.1" as marginalia: note, notefigure, wideblock
#import "@local/marginalia:0.0.1" as marginalia: marginalis, marginale, apostille

#let red    = colors.blind.red
#let orange = colors.blind.orange
#let yellow = colors.blind.yellow
#let green  = colors.blind.green
#let blue   = colors.blind.blue
#let violet = colors.blind.violet

#let hyperlink( ..args ) = text(
  ..fonts.select("Palatino Linotype"),
  style: "italic",
  fill: green,
  link( ..args )
)

#let url( ..args ) = text(
  ..fonts.select("TX-02"),
  fill: green,
  size: (9 / 10) * 1.0em,
  link( ..args )
)

#let part(weight: "bold", title) = {
  show heading.where(level: 1): it => {
    set text( ..fonts.select("Palatino Linotype"), size: 22.0pt, style: "italic", weight: weight )
    block(it.body)
  }
  page(header: none, footer: none)[
    #place(horizon + left, {
      v(1.0fr)
      heading(
        numbering: none,
        outlined: true,
        title
      )
      v(2.0fr)
    })
  ]
}

#let epigraph(attribution: none, content) = {
  show quote: set text( size: 9.0pt, style: "italic" )
  show quote.where(block: true): it => {
    set par(justify: false)
    set align(left)
    set block(above: 28.0pt, below: 28.0pt)
    pad(
      left: 1.0in,
      right: 0.0in,
      box(width: 1.0fr)[
        #llap[\u{201C}]
        #h(0.0pt, weak: true)
        #it.body
        #h(0.0pt, weak: true)
        \u{201D}
      ] + if attribution != none {
        linebreak()
        h(1.0fr)
        text(size: 9.0pt, style: "normal")[\u{2015}#it.attribution]
      }
    )
  }
  quote(attribution: attribution, block: true, content)
}
#let quotation = epigraph

#let preheading = heading.with(
  level: 1,
  numbering: none,
  outlined: false
)

#let book(
  title: [The Title],
  shorttitle: none,
  author: "Daniel Gonzalez Cedre",
  date: datetime.today(),
  publisher: none,
  university: none,
  course: none,
  code: none,
  show_cover: true,
  show_toc: true,
  show_back: true,
  bib: none,
  paper_size: "us-letter",  // 215.9mm x 279.4mm
  paper_color: "natural",
  font_size: 10.0pt,
  header: none,
  footer: none,
  chapter_zero: false,
  doc
) = {
  show: maths.setup

  if chapter_zero { maths.counters.offset.update(-1) }

  set document(
    title: title,
    author: author,
    date: date,
  )

  // let page-margin-right = (3.125in, 3.0in, 2.525in).at(1)  // 3.0 inches

  set page(
    paper: paper_size,
    fill: if paper_color == "natural" { colors.paper.natural } else { colors.paper.bleached },
    header: none,
    footer: none,
  )

  set par(justify: true)

  set text( ..fonts.select("Palatino Linotype"), fill: fonts.ink, size: font_size )
  show raw: set text( ..fonts.select("TX-02"), size: 1.0em )

  set smallcaps(all: true)

  set underline(
    offset: 2.0pt,
    stroke: (
      cap: "round",
      dash: "dotted",
    )
  )

  show quote.where(block: false): set text( ..fonts.select("Palatino Linotype"), style: "italic" )

  // set enum(indent: 1.0em, body-indent: 1.0em)
  show enum: set par(justify: true)

  // set list(indent: 1.0em, body-indent: 1.0em)
  show list: set par(justify: true)

  show figure.where(kind: image): set figure(supplement: [Figure], numbering: "1.")
  show figure.where(kind: image): set figure.caption(separator: [ ])

  show: tables  // @local/tables
  show figure.where(kind: table): set figure(supplement: [Table], numbering: "1.")
  show figure.where(kind: table): set figure.caption(separator: [ ])

  show figure.where(kind: raw): set figure(supplement: [Algorithm], numbering: "1.")
  show figure.where(kind: raw): set figure.caption(separator: [ ])

  if show_cover {
    show: matter.cover.with(
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
    show: matter.toc
  }

  show: marginalia.show-frame
  show: marginalia.setup.with(
    paper_size: "us-letter",
    font_size: 10.0pt,
  )

  counter(page).update(0)

  set heading(
    numbering: (..nums) => (
      nums.pos().slice(0, 1).map(x => x - (if chapter_zero {1} else {0}))
      + nums.pos().slice(1,)
    ).map(str).join(".")
  )

  show heading.where(level: 1): it => {
    set text( ..fonts.select("Palatino Linotype"), size: 22.0pt, style: "italic", weight: "bold" )
    maths.counters.definition.update(0)
    maths.counters.axiom.update(0)
    maths.counters.theorem.update(0)
    maths.counters.lemma.update(0)
    maths.counters.corollary.update(0)
    maths.counters.exercise.update(0)
    maths.counters.algorithm.update(0)
    if it.numbering != none {
      block(
        below: 28.0pt,
        v(78.0pt)
        + counter(heading).display()
        + v(1.2em, weak: true)
        + it.body
      )
    } else {
      block(
        v(32.0pt + 48.0pt)
        + it.body
      )
    }
  }
  show heading.where(level: 2): it => {
    set text( ..fonts.select("Palatino Linotype"), size: 13.0pt, style: "italic", weight: "bold" )
    block(
      above: 28.0pt,
      below: 16.0pt,
      llap[ #counter(heading).display() #h(11.0pt) ] + it.body
    )
  }
  show heading.where(level: 3): it => {
    set text( ..fonts.select("Palatino Linotype"), size: 12.0pt, style: "italic", weight: "bold" )
    block(
      above: 28.0pt,
      below: 16.0pt,
      // llap[ #counter(heading).display() #h(11.0pt) ]
      // + it.body
      it.body
    )
    // block( it.body )
  }

  // set math.equation(numbering: (..nums) => {
  //   let num = "(" + counter(heading).get().map(str).at(0) + "." + nums.pos().map(str).join(".") + ")"
  //   serif[#num]
  // })

  // show link: set text(luma(50))

  doc

  if bib != none {
    show bibliography: set text( ..fonts.select("Palatino Linotype"), size: 9.0pt )
    show bibliography: set par(justify: false)
    set bibliography(title: none)
    heading(level: 1, [Bibliography])
    bib
  }
}

#let chapter(
  title: [The Title],
  shorttitle: none,
  number: 1,
  author: "Daniel Gonzalez Cedre",
  date: datetime.today(),
  publisher: none,
  university: none,
  course: none,
  code: none,
  paper_size: "us-letter",
  paper_color: "natural",
  header: none,
  footer: none,
  doc
) = {
  show: book.with(
    title: title,
    shorttitle: none,
    author: author,
    date: date,
    publisher: publisher,
    university: university,
    course: course,
    code: code,
    show_cover: false,
    show_toc: false,
    show_back: false,
    bib: none,
    paper_size: paper_size,
    paper_color: paper_color,
    header: header,
    footer: footer,
    chapter_zero: ( number == 0 ),
  )
  if number != 0 {
    counter(heading).update(number - 1)
    maths.counters.offset.update(number - 1)
  }
  doc
}
