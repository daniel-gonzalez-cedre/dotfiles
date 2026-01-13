#import "@local/colors:0.0.1": *
#import "@local/fonts:0.0.1": *
#import "@local/maths:0.0.1": *
#import "@local/defs:0.0.1": *

#let header(thedate, salutation, object) = {
  // set text(  )
}

#let footer(author) = {
}

#let format(doc, author, subject, object, salutation, date) = {
}

#let letter(
  title: [The Title],
  shorttitle: none,
  author: "Daniel Gonzalez Cedre",
  subject: "RECOMMENDEE",
  object: "ORGANIZATION",
  salutation: "To whom it may concern at",
  date: datetime.today(),
  fontsize: (
    main: 11.0pt,
    sub: 9.0pt,
  ),
  doc
) = {
  set document(
    title: title,
    author: author,
    date: date,
  )

  set page(
    paper: "us-letter",
    fill: color.paper.bleached,
    header: none,
    footer: [
      #text(font: "Montserrat", size: fontsize.main, fill: color.illinois.orange, weight: "semibold")[
        UNIVERSITY OF ILLINOIS URBANA-CHAMPAIGN
      ]
      #h(1.0fr)
      #text(font: "Montserrat", size: fontsize.sub, fill: color.illinois.blue, weight: "medium")[
        #smallcaps("CEDRE@ILLINOIS.EDU")
      ]
    ]
  )

  set text(
    font: "ETbb",
    size: fontsize.main,
    // fill: color.off.black,
    number-type: "old-style",
    number-width: "proportional"
  )
  show raw: set text( ..fonts.mono, size: fontsize.sub )

  show quote: set text(size: fontsize.main, style: "italic")
  set smallcaps(all: true)
  set underline(
    offset: 2.0pt,
    stroke: (
      cap: "round",
      dash: "dotted",
    )
  )

  show figure: set figure.caption(separator: [.#h(0.5em)])
  show figure.caption: set align(left)
  show figure.caption: set text( ..fonts.serif, size: fontsize.sub )

  set enum(indent: 1.0em, body-indent: 1.0em)
  show enum: set par(justify: false)

  set list(indent: 1.0em, body-indent: 1.0em)
  show list: set par(justify: false)

  show figure.where(kind: table): set figure(supplement: [Tab.], numbering: "1")
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: image): set figure(supplement: [Fig.], numbering: "1")
  show figure.where(kind: raw): set figure(supplement: [Alg.], numbering: "1")
  show figure.where(kind: raw): set figure.caption(position: top)

  place(
    float: true,
    center + top,
  )[
    #box(image(width: 2.0in, "assets/illinois.pdf") + v(0.4in))
    #h(1.0fr)
    #box[
      #set align(right)
      #set text(font: "Montserrat", fill: color.illinois.blue, weight: "medium", size: fontsize.sub)
      #text(weight: "semibold", size: 11.0pt)[THE GRAINGER COLLEGE OF ENGINEERING] \
      // Siebel School for Computing and Data Science \
      // Siebel Center for Computer Science \
      // 201 North Goodwin Avenue \
      // Urbana, IL 61801 USA
      #text(size: 8.0pt)[#smallcaps[
        Siebel School for Computing and Data Science \
        Siebel Center for Computer Science \
        201 North Goodwin Avenue \
        Urbana, IL 61801 USA
      ]]
    ]
  ]

  set par(
    justify: false,
    spacing: 1.6em,
    leading: 0.8em,
  )

  show "Prof. ": [Prof.#sym.space.nobreak.narrow]
  show "Dr. ": [Dr.#sym.space.nobreak.narrow]
  show "Mrs. ": [Mrs.#sym.space.nobreak.narrow]
  show "Ms. ": [Ms.#sym.space.nobreak.narrow]
  show "Mr. ": [Mr.#sym.space.nobreak.narrow]

  [
    #displaydate(date, short: true)

    #salutation #object,

    #doc
  ]

  place(
    float: true,
    left + bottom,
  )[
    Sincerely,
    #v(- 0.4em)
    #image(
      height: 3.6em,
      fit: "contain",
      "assets/signature.pdf"
    )
    #v(- 1.2em)
    #smallcaps[
      #author, PhD \
      Teaching Assistant Professor
      // Siebel School for Computing and Data Science
    ]
  ]
}
