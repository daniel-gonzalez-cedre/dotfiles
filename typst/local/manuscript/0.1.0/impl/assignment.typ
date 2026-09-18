#import "@local/maths:0.1.0" as maths
#import "@local/tables:0.1.0" as tables
#import "@local/marginalia:0.1.0" as marginalia: marginalis, marginale, apostille, fullblock, wideblock

#import "src/formatting.typ": llap, display-date, display-year, display-month, display-day
#import "src/colors.typ" as colors
#import "src/fonts.typ" as fonts

#let problem-set(
  author: "Daniel Gonzalez Cedre",
  title: "Problem Set",
  number: "",
  date: datetime.today(),
  due: datetime.today(),
  semester: none,
  publisher: none,
  university: none,
  course: none,
  code: none,
  instructions: [],
  paper-size: "us-letter",
  paper-color: "natural",
  font-size: 10pt,
  doc
) = {
  show: maths.setup.with(
    body-font: "Palatino Linotype",
    math-font: "New Computer Modern Math"
  )

  set document(
    title: title + " " + str(number),
    author: author,
    date: date,
  )

  set page(
    paper: paper-size,
    fill: if paper-color in ("pulp", "natural") { colors.paper.pulp } else { colors.paper.bleached },
    header: none,
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
  set enum(numbering: "1.a.")

  show figure.where(kind: image): set figure(supplement: [Figure], numbering: "1.")
  show figure.where(kind: image): set figure.caption(separator: [ ])

  show: tables.setup
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
    set text(size: 15pt, style: "italic", weight: "regular")
    block(
      above: 32pt,
      below: 11pt
    )[#llap(margin: 13.5pt)[#counter(heading).display()]#it.body]
  }
  show heading.where(level: 2): it => {
    set text(size: 12pt, style: "italic", weight: "regular")
    block(
      above: 22pt,
      below: 16pt,
    )[#it.body]
  }
  show heading.where(level: 3): it => {
    set text(size: 11pt, style: "italic", weight: "regular")
    block(
      above: 22pt,
      below: 16pt,
    )[#it.body]
  }

  let instruction-block = if instructions == "" [] else [
    #fullblock[#text(size: 12pt)[#instructions]]
    #v(10pt)
  ]

  let date-message = if due != none [
    Due on the #strong[#display-date(long: true, due)] at 11:59 pm // #display-day(due) day of #display-month(due) of the year of our Lord #display-year(due)
  ] else [
    #display-date(long: true, date)
  ]
  [
    #set text(style: "italic", weight: "regular")
    #text(size: 15pt)[#title #number]
    #v(-6pt)
    #text(size: 12pt)[#course]
    #v(-4pt)
    #text(size: 12pt)[#date-message]
    #v(10pt)
    #instruction-block
  ]

  doc
}

#let solution-set(
  author: "Daniel Gonzalez Cedre",
  title: "Solution Set",
  number: "",
  date: datetime.today(),
  due: datetime.today(),
  semester: none,
  publisher: none,
  university: none,
  course: none,
  code: none,
  instructions: "",
  paper-size: "us-letter",
  paper-color: "natural",
  font-size: 10pt,
  doc
) = {
  show: problem-set.with(
    author: author,
    title: title,
    number: number,
    date: if due != datetime.today() { due } else { date },
    due: none,
    semester: semester,
    university: university,
    course: course,
    code: code,
    instructions: instructions,
    paper-size: paper-size,
    paper-color: paper-color,
    font-size: font-size
  )
  doc
}
