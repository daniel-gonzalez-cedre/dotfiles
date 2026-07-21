#import "@local/colors:0.0.1": *
#import "@local/fonts:0.0.1": *
#import "@local/maths:0.0.1": *
#import "@local/defs:0.0.1": *

#import "@local/tables:0.0.1": *

// #import "@local/margins:0.0.1": *

#import "@preview/marginalia:0.3.1" as marginalia: note, notefigure, wideblock

#let red    = color.blind.red
#let green  = color.blind.green
#let blue   = color.blind.blue
#let yellow = color.blind.yellow
#let purple = color.blind.purple
#let orange = color.blind.orange

#let hyperlink( ..args ) = text(
  ..fonts.serif,
  style: "italic",
  fill: green,
  link( ..args )
)

#let url( ..args ) = text(
  ..fonts.mono,
  fill: green,
  size: (9 / 10) * 1.0em,
  link( ..args )
)

#let cover_authorblock(author, font) = {
  place(top + left, {
    set text( ..font, size: 20.0pt )
    align(left, upper(author))
  })
}

#let cover_titleblock(title, font) = {
  place(horizon + left, {
    set text( ..font, size: 48.0pt, hyphenate: false )
    v(1.0fr)
    for word in title.split() {
      [#upper(word)]
      v(- 32.0pt)
    }
    v(2.0fr)
  })
}

#let cover_dateblock(publisher, font, date: datetime.today()) = {
  place(bottom + center, {
    set text( ..font, size: 14.0pt )
    if publisher != none {
      [#upper(publisher) #h(1.0fr) #upper(displaydate(date))]
    } else {
      [#h(1.0fr) #upper(displaydate(date))]
    }
  })
}

#let cover_copyrightblock(university, course, code, author, date: datetime.today()) = {
  if university != none and lower(university.split().at(0)) == "university" {
    university = "the " + university
  }

  let intent = if university != none and code != none {
    [These notes are intended for students of #raw(code) at #university. \ ]
  } else if university != none {
    [These notes are intended for #university. \ ]
  } else {
    ""
  }

  place(bottom + left, [#{intent}Copyright #sym.copyright #date.display("[year]") #author])
}

#let table_of_contents() = {
  show heading.where(level: 1): it => {
    set text( ..fonts.serif, size: 22.0pt, style: "italic", weight: "bold" )
    block(
      v(32.0pt + 48.0pt)
      + it.body
    )
  }

  show outline.entry.where(level: 1): set block(above: 32.0pt, below: 12.0pt)
  show outline.entry.where(level: 2): set block(above:  8.0pt, below:  8.0pt)
  show outline.entry.where(level: 3): set block(above:  8.0pt, below:  8.0pt)

  show outline.entry.where(level: 1): set text( ..fonts.serif, size: 16.0pt, style: "italic" )
  show outline.entry.where(level: 2): set text( ..fonts.serif, size: 11.0pt, style: "italic" )
  show outline.entry.where(level: 3): set text( ..fonts.serif, size: 11.0pt, style: "italic" )

  show outline.entry.where(level: 1): it => link(
    it.element.location(),
    it.indented(
      box(width: 0.0em, h(- 1.8em) + it.prefix()),
      [ #h(- 0.75em) #it.body() #h(1.0fr) #text(style: "normal", it.page()) ]
    ),
  )
  show outline.entry.where(level: 2): it => link(
    it.element.location(),
    it.indented(
      box(width: 1.2em, it.prefix()),
      [ #it.body() #h(1.0fr) #text(style: "normal", it.page()) ]
    ),
  )
  show outline.entry.where(level: 3): it => link(
    it.element.location(),
    it.indented(
      box(width: 1.2em, hide(it.prefix())),
      [ #it.body() #h(1.0fr) #text(style: "normal", it.page()) ]
    ),
  )

  outline(depth: 3, indent: 0.0pt)
}

#let part(weight: "bold", title) = {
  show heading.where(level: 1): it => {
    set text( ..fonts.serif, size: 22.0pt, style: "italic", weight: weight )
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

#let book(
  title: [The Title],
  shorttitle: none,
  author: "Daniel Gonzalez Cedre",
  date: datetime.today(),
  publisher: none,
  university: none,
  course: none,
  code: none,
  frontmatter: true,
  toc: true,
  bib: none,
  backmatter: true,
  paper: "us-letter",  // 215.9mm x 279.4mm
  paper_color: "natural",
  header: none,
  footer: none,
  chapter_zero: false,
  doc
) = {
  // show: marginalia.show-frame
  show: marginalia.setup.with(
    inner: (
      far: 7.5mm,  // 5.0mm
      width: 15.0mm - 5.0mm,  // 15.0mm
      sep: 7.5mm,  // 5.0mm
    ),
    outer: (
      far: 7.5mm,  // 5.0mm
      width: 50.0mm,  // 15.0mm
      sep: 7.5mm,  // 5.0mm
    ),
    book: false,
    clearance: 10.0pt,  // 12.0pt
  )

  show: maths  // @local/maths

  if chapter_zero { offset_theorems(-1) }

  set document(
    title: title,
    author: author,
    date: date,
  )

  // let page-margin-right = (3.125in, 3.0in, 2.525in).at(1)  // 3.0 inches

  set page(
    paper: paper,
    fill: if paper_color == "natural" { color.paper.natural } else { color.paper.bleached },
    header: none,
    footer: none,
  )

  set par(justify: true)

  set text( ..fonts.serif, 10.0pt )
  show raw: set text( ..fonts.mono, size: 1.0em )

  set smallcaps(all: true)

  set underline(
    offset: 2.0pt,
    stroke: (
      cap: "round",
      dash: "dotted",
    )
  )

  show quote.where(block: false): set text( ..fonts.serif, style: "italic" )

  set enum(indent: 1.0em, body-indent: 1.0em)
  show enum: set par(justify: false)

  set list(indent: 1.0em, body-indent: 1.0em)
  show list: set par(justify: false)

  show: tables  // @local/tables

  // show figure: set figure.caption(separator: [.#h(0.5em)])
  show figure.caption: set align(left)
  // show figure.caption: set text( ..fonts.serif, size: 9.0pt )

  show figure.where(kind: image): set figure(supplement: [Figure], numbering: "1.")
  show figure.where(kind: image): set figure.caption(position: bottom, separator: [ ])

  show figure.where(kind: raw): set figure(supplement: [Algorithm], numbering: "1.")
  show figure.where(kind: raw): set figure.caption(position: bottom, separator: [ ])

  if frontmatter {
    cover_authorblock(author, fonts.sans)
    cover_titleblock(title, fonts.sans)
    cover_dateblock(publisher, fonts.sans, date: date)

    pagebreak()

    cover_copyrightblock(university, course, code, author, date: date)

    pagebreak()
  }

  if toc {
    show heading.where(level: 1): it => {
      set text( ..fonts.serif, size: 22.0pt, style: "italic", weight: "bold" )
      block(
        v(32.0pt + 48.0pt)
        + it.body
      )
    }

    show outline.entry.where(level: 1): set block(above: 32.0pt, below: 12.0pt)
    show outline.entry.where(level: 2): set block(above:  8.0pt, below:  8.0pt)
    show outline.entry.where(level: 3): set block(above:  8.0pt, below:  8.0pt)

    show outline.entry.where(level: 1): set text( ..fonts.serif, size: 16.0pt, style: "italic" )
    show outline.entry.where(level: 2): set text( ..fonts.serif, size: 11.0pt, style: "italic" )
    show outline.entry.where(level: 3): set text( ..fonts.serif, size: 11.0pt, style: "italic" )

    show outline.entry.where(level: 1): it => link(
      it.element.location(),
      it.indented(
        box(width: 0.0em, h(- 1.8em) + it.prefix()),
        [ #h(- 0.75em) #it.body() #h(1.0fr) #text(style: "normal", it.page()) ]
      ),
    )
    show outline.entry.where(level: 2): it => link(
      it.element.location(),
      it.indented(
        box(width: 1.2em, it.prefix()),
        [ #it.body() #h(1.0fr) #text(style: "normal", it.page()) ]
      ),
    )
    show outline.entry.where(level: 3): it => link(
      it.element.location(),
      it.indented(
        box(width: 1.2em, hide(it.prefix())),
        [ #it.body() #h(1.0fr) #text(style: "normal", it.page()) ]
      ),
    )

    outline(depth: 3, indent: 0.0pt)
  }

  counter(page).update(0)
  // set page(
  //   // margin: (right: page-margin-right, rest: auto),
  //   margin: (right: page-margin-right, rest: auto),
  //   header: context {
  //     if query(selector(heading.where(level: 1))).filter(h => h.location().page() == here().page()).len() == 0 and query(selector(heading.where(level: 1)).before(here())).len() != 0 {
  //       block(width: 100.0% + (page-margin-right - 1.0125in),
  //         smallcaps(query(selector(heading.where(level: 1)).before(here())).last().body)
  //         + h(1.0fr)
  //         + counter(page).display()
  //         + v(1.0em)
  //       )
  //       // fullwidth(
  //         // smallcaps(query(selector(heading.where(level: 1)).before(here())).last().body)
  //         // + h(1.0fr)
  //         // + counter(page).display()
  //         // + v(1.0em)
  //       // )
  //     }
  //   }
  // )

  set heading(
    numbering: (..nums) => (
      nums.pos().slice(0, 1).map(x => x - (if chapter_zero {1} else {0})) + nums.pos().slice(1,)
    ).map(str).join(".")
  )

  show heading.where(level: 1): it => {
    set text( ..fonts.serif, size: 22.0pt, style: "italic", weight: "bold" )
    counter-definition.update(0)
    counter-axiom.update(0)
    counter-theorem.update(0)
    counter-lemma.update(0)
    counter-corollary.update(0)
    counter-exercise.update(0)
    counter-algorithm.update(0)
    block(
      below: 28.0pt,
      v(78.0pt)
      + counter(heading).display()
      + v(1.2em, weak: true)
      + it.body
    )
  }
  show heading.where(level: 2): it => {
    set text( ..fonts.serif, size: 13.0pt, style: "italic", weight: "bold" )
    block(
      above: 28.0pt,
      below: 16.0pt,
      llap[ #counter(heading).display() #h(11.0pt) ] + it.body
    )
  }
  show heading.where(level: 3): it => {
    set text( ..fonts.serif, size: 12.0pt, style: "italic", weight: "bold" )
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
    show bibliography: set text( ..fonts.serif, size: 9.0pt )
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
  paper: "us-letter",
  paper_color: "natural",
  header: none,
  footer: none,
  doc
) = {
  let chapter_zero = ( number == 0 )
  show: book.with(
    title: title,
    shorttitle: none,
    author: author,
    date: date,
    publisher: publisher,
    university: university,
    course: course,
    code: code,
    frontmatter: false,
    toc: false,
    bib: none,
    backmatter: false,
    paper: paper,
    paper_color: paper_color,
    header: header,
    footer: footer,
    chapter_zero: chapter_zero,
  )
  if number != 0 {
    counter(heading).update(number - 1)
    offset_theorems(number - 1)
  }
  doc
}
