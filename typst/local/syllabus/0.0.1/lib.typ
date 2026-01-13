#import "@local/colors:0.0.1": *
#import "@local/fonts:0.0.1": *
#import "@local/maths:0.0.1": *
#import "@local/defs:0.0.1": *

#import "@local/tables:0.0.1": *

#import "@local/margins:0.0.1": *

// #let page-margin-right = (3.125in, 2.25in).at(1)
// #let fullwidth(content) = block(width: 100.0% + (page-margin-right - 1.0125in), content)

#let white  = color.white
#let black  = color.black
#let red    = color.blind.red
#let green  = color.blind.green
#let blue   = color.blind.blue
#let yellow = color.blind.yellow
#let purple = color.blind.purple
#let orange = color.blind.orange
// #let aqua   = color.blind.aqua

#let quotation(attribution: none, content) = {
  show quote: set text( ..fonts.serif, size: 9.0pt, style: "italic" )
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

#let abstract(body) = {
  set text(size: 9.0pt)
  fullwidth[
    #pad(12.0pt)[
      // #set text(size: 9.0pt)
      #body
    ]
  ]
}

#let syllabus(
  author: "Daniel Gonzalez Cedre",
  title: "Syllabus",
  course: "the Course",
  code: "CSXXX",
  semester: "Fall 20XX",
  date: datetime.today(),
  publisher: none,
  paper: "us-letter",
  paper_color: "natural",
  doc
) = {
  set document(
    title: course + ": " + title,
    author: author,
    date: date,
  )

  set page(
    paper: paper,
    fill: if paper_color == "natural" { color.paper.natural } else { color.paper.bleached },
    header: none,
    footer: none,
  )

  set par(
    justify: true,
    // leading: 0.65em,
  )

  set smallcaps(all: true)

  show quote: set text( ..fonts.serif, size: 10.0pt, style: "italic" )
  // show quote: set pad(left: 1in, right: 0in)
  // set quote(block: true)
  // show quote.where(block: true): it => {
  //   set par(justify: false)
  //   set align(left)
  //   set text( ..fonts.serif, size: 10.0pt )
  //   pad(
  //     left: 1.0in,
  //     right: 0.0in,
  //     text(style: "italic", llap[\u{201C}] + it.body + [\u{201D}])
  //     + linebreak()
  //     + h(1.0fr) + text(size: 9.0pt, style: "normal", [--- ] + it.attribution)
  //   )
  // }

  set text( ..fonts.serif, size: 11.0pt )
  show raw: set text( ..fonts.mono, size: 9.0pt )

  set underline(
    offset: 2.0pt,
    stroke: (
      cap: "round",
      dash: "dotted",
    )
  )

  show figure: set figure.caption(separator: [.#h(0.5em)])
  show figure.caption: set align(left)
  show figure.caption: set text( ..fonts.serif, size: 9.0pt )

  set enum(indent: 1.0em, body-indent: 1.0em)
  show enum: set par(justify: false)

  set list(indent: 1.0em, body-indent: 1.0em)
  show list: set par(justify: false)

  show: tables
  // show table.header: it => {
  //   set table.cell(fill: red)
  //   it
  // }

  // show figure.where(kind: table): set figure(supplement: [Tab.], numbering: "1")
  // show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: image): set figure(supplement: [Fig.], numbering: "1.")
  show figure.where(kind: raw): set figure(supplement: [Alg.], numbering: "1.")
  show figure.where(kind: raw): set figure.caption(position: top)

  show figure.caption.where(kind: image): it => {
    sidenote(
      // dy: 1.2em,
      side: right,
      numbering: none,
      padding: (
        left: 18.0pt,
        right: page-margin-right - 180.0pt,
      )
    )[
      #it.supplement
      #context it.counter.display(it.numbering)
      #it.body
    ]
  }

  // show heading.where(level: 1): it => {
  //   set text( ..fonts.serif, size: 22.0pt, style: "italic" )
  //   block(
  //     v(32.0pt + 48.0pt)
  //     + it.body
  //   )
  // }
  // show outline.entry.where(level: 1): set block(above: 32.0pt, below: 12.0pt)
  // show outline.entry.where(level: 1): set text( ..fonts.serif, size: 16.0pt, style: "italic" )
  // show outline.entry.where(level: 1): it => link(
  //   it.element.location(),
  //   it.indented( it.prefix(), [ #it.body() #h(1.0fr) #text(style: "normal", it.page()) ] ),
  // )
  // show outline.entry.where(level: 2): set block(above: 8.0pt, below: 8.0pt)
  // show outline.entry.where(level: 2): set text( ..fonts.serif, size: 11.0pt, style: "italic" )
  // show outline.entry.where(level: 2): it => link(
  //   it.element.location(),
  //   it.indented( it.prefix(), [ #it.body() #h(1.0fr) #text(style: "normal", it.page()) ] ),
  // )
  // show outline.entry.where(level: 3): set block(above: 8.0pt, below: 8.0pt)
  // show outline.entry.where(level: 3): set text( ..fonts.serif, size: 11.0pt, style: "italic" )
  // show outline.entry.where(level: 3): it => link(
  //   it.element.location(),
  //   it.indented( hide(it.prefix()), [ #it.body() #h(1.0fr) #text(style: "normal", it.page()) ] ),
  // )

  set page(
    margin: (right: page-margin-right, rest: auto),
    header: context {
      if counter(page).get().at(0) == 1 {
        fullwidth(h(1.0fr) + box(image(height: 15.0pt, "assets/illinois.pdf")))
      } else {
        fullwidth(
          emph(displaydate(date))
          + h(1.0fr)
          // + smallcaps(lower(course))
          // + h(2.0em)
          + counter(page).display()
          + v(1.0em)
        )
      }
    }
  )

  set heading(numbering: "1.1")
  show heading.where(level: 1): it => {
    set text( ..fonts.serif, size: 13.0pt, style: "italic", weight: "regular" )
    block(
      above: 22.0pt,
      below: 16.0pt,
      llap[#counter(heading).display()#h(12.0pt)]
      + it.body
    )
  }
  show heading.where(level: 2): it => {
    set text( ..fonts.serif, size: 12.0pt, style: "italic", weight: "regular" )
    block(
      above: 22.0pt,
      below: 16.0pt,
      it.body
      // llap[#counter(heading).display()#h(12.0pt)]
      // + it.body
    )
  }
  show heading.where(level: 3): it => {
    set text( ..fonts.serif, size: 11.0pt, style: "italic", weight: "regular" )
    block(
      llap[#counter(heading).display()#h(12.0pt)]
      + it.body
    )
  }

  // show link: set text(luma(50))

  fullwidth[
    // #place(top + right, float: false)[
    //   #box(image(height: 15.0pt, "assets/illinois.pdf"))
    // ]
    #text( ..fonts.serif, style: "italic", weight: "regular" )[
      #text(size: 15.0pt)[#title]
      #v(- 6.0pt)
      #text(size: 12.0pt)[#course]
      #v(- 4.0pt)
      #text(size: 12.0pt)[#semester]
    ]
  ]
  // par(
  // )
  // par(
  //   text( ..fonts.serif, size: 14.0pt, style: "italic" )[ #course ]
  // )
  // par(
  //   text( ..fonts.serif, size: 14.0pt, style: "italic" )[ #semester ]
  // )
  doc
}
