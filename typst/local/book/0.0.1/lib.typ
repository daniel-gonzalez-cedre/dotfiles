#import "@local/colors:0.0.1": *
#import "@local/fonts:0.0.1": *
#import "@local/maths:0.0.1": *
#import "@local/defs:0.0.1": *

#import "@local/tables:0.0.1": *

#import "@local/margins:0.0.1": *

#let coverauthorblock(author) = {
  place(top + left, {
    set text( ..fonts.sans, size: 20.0pt )
    align(left, upper(author))
  })
}

#let covertitleblock(title: none) = {
  place(horizon + left, {
    set text( ..fonts.sans, size: 48.0pt, hyphenate: false )
    v(1.0fr)
    for word in title.split() {
      [#upper(word)]
      v(- 32.0pt)
    }
    v(2.0fr)
  })
}

#let coverdateblock(publisher, date) = {
  place(bottom + center, {
    set text( ..fonts.sans, size: 14.0pt )
    if publisher != none {
      [#upper(publisher) #h(1.0fr) #upper(displaydate(date))]
    } else {
      [#h(1.0fr) #upper(displaydate(date))]
    }
  })
}

#let matter_front(doc) = {
  set page(numbering: "i")
  doc
}

#let matter_main(doc) = {
  set page(
    numbering: "1",
    header: context {
      set align(right)
      set text( ..fonts.serif )
      smallcaps(document.title)
      // if counter(page).get().first() > 1 {
      //   if shorttitle != none {
      //     smallcaps(shorttitle)
      //   } else {
      //     smallcaps(title)
      //   }
      // }
    },
    // footer: context {
    //   if type(footer) == array {
    //     footer.at(1)
    //     linebreak()
    //   } else {
    //     footer
    //     linebreak()
    //   }
    // },
  )
  doc
}

#let matter_back(doc) = {
  set page(
    numbering: "i",
  )
  doc
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
  toc: true,
  bib: none,
  paper: "us-letter",
  paper_color: "natural",
  header: none,
  footer: none,
  doc
) = {
  show: maths

  set document(
    title: title,
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
    // spacing: 0.65em,
    // first-line-indent: 1.0em,
  )

  set text( ..fonts.serif, 11.0pt )
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

  show: tables

  // show figure: set figure.caption(separator: [.#h(0.5em)])
  show figure.caption: set align(left)
  // show figure.caption: set text( ..fonts.serif, size: 9.0pt )

  show figure.where(kind: image): set figure(supplement: [Figure], numbering: "1.")
  show figure.where(kind: image): set figure.caption(position: bottom, separator: [ ])

  show figure.where(kind: raw): set figure(supplement: [Algorithm], numbering: "1.")
  show figure.where(kind: raw): set figure.caption(position: bottom, separator: [ ])

  coverauthorblock(author)
  covertitleblock(title: title)
  coverdateblock(publisher, date)

  pagebreak()

  place(bottom + left, [
    #set text(size: 11.0pt)
    These notes are intended for #raw("CS173") at the University of Illinois Urbana-Champaign. \
    Copyright #sym.copyright #date.display("[year]") Daniel Gonzalez Cedre
  ])

  pagebreak()

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

  counter(page).update(0)
  set page(
    margin: (right: page-margin-right, rest: auto),
    header: context {
      if query(selector(heading.where(level: 1))).filter(h => h.location().page() == here().page()).len() == 0 {
        fullwidth(
          smallcaps(query(selector(heading.where(level: 1)).before(here())).last().body)
          + h(1.0fr)
          + counter(page).display()
          + v(1.0em)
        )
      }
    }
  )

  set heading(
    numbering: (..nums) => (
      nums.pos().slice(0, 1).map(x => x - 1) + nums.pos().slice(1,)
    ).map(str).join(".")
  )

  show heading.where(level: 1): it => {
    set text( ..fonts.serif, size: 22.0pt, style: "italic", weight: "bold" )
    block(
      below: 28.0pt,
      v(78.0pt)
      + counter(heading).display()
      + v(1.2em, weak: true)
      + it.body
    )
  }
  show heading.where(level: 2): it => {
    set text( ..fonts.serif, size: 14.0pt, style: "italic", weight: "bold" )
    block(
      above: 28.0pt,
      below: 16.0pt,
      llap[ #counter(heading).display() #h(11.0pt) ]
      + it.body
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

  show link: set text(luma(50))

  doc

  show bibliography: set text( ..fonts.serif, size: 9.0pt )
  show bibliography: set par(justify: false)
  set bibliography(title: none)
  if bib != none {
    heading(level: 1, [Bibliography])
    bib
  }
}

// #let sidenotecounter = counter("sidenotecounter")
// #let sidenote(dy: - 2.0em, numbered: true, content) = {
//   set text( ..fonts.serif, size: 9.0pt )
//   if numbered {
//     sidenotecounter.step()
//     text(weight: "bold", super(sidenotecounter.display()))
//   }
//   // margin-note
//   if numbered {
//     super(sidenotecounter.display())
//   } else {
//     content
//   }
// }
