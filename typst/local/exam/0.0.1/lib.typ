#import "@local/colors:0.0.1": *
#import "@local/fonts:0.0.1": *
#import "@local/maths:0.0.1": *
#import "@local/defs:0.0.1": *

#import "@local/margins:0.0.1": *

// #import "@preview/marge:0.1.0": sidenote

#let red    = color.blind.red
#let green  = color.blind.green
#let blue   = color.blind.blue
#let yellow = color.blind.yellow
#let purple = color.blind.purple
#let orange = color.blind.orange
// #let aqua   = color.light.aqua

#let page-margin-right = (3.125in, 2.25in).at(1)
#let fullwidth(content) = block(width: 100.0% + (page-margin-right - 1.0125in), content)

#let assignment(
  shorttitle: none,
  author: "Daniel Gonzalez Cedre",
  title: [The Title],
  course: [The Course],
  type: "",
  number: 0,
  version: 0,
  date: datetime.today(),
  paper: "us-letter",
  paper_color: "natural",
  doc
) = {
  show: maths
  set math.lr(size: 115%)

  let cover = false
  let title = ""
  let thedate = ""
  if type in ("mt", "midterm") {
    cover = true
    title = [ Midterm #number ver.~#version ]
    thedate = [ #displaydate(date, long: true) ]
  } else if type in ("fe", "final exam") {
    cover = false
    number = ""
    title = [ Final Exam ver.~#version ]
    thedate = [ #displaydate(date, long: true) ]
  } else if type in ("fp", "practice final") {
    cover = false
    number = ""
    title = [ Practice Final ]
    thedate = [ #displaydate(date, long: true) ]
  } else if type in ("fp", "practice final") {
    cover = false
    number = ""
    title = [ Practice Final Solutions ]
    thedate = [ #displaydate(date, long: true) ]
  } else if type in ("mp", "practice midterm") {
    cover = false
    title = [ Practice Midterm #number ]
    thedate = [ #displaydate(date, long: true) ]
  } else if type in ("ms", "practice midterm solutions") {
    cover = false
    title = [ Solutions for Practice Midterm #number ]
    thedate = [ #displaydate(date, long: true) ]
  } else {
    cover = false
    title = ""
    thedate = [ #displaydate(date, long: true) ]
  }

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

  set par(justify: true)

  set smallcaps(all: true)

  show quote: set text( ..fonts.serif, size: 10.0pt, style: "italic" )
  show quote: set pad(left: 1in, right: 0in)
  set quote(block: true)
  show quote.where(block: true): it => {
    set par(justify: false)
    set align(left)
    set text( ..fonts.serif, size: 10.0pt )
    pad(
      left: 1.0in,
      right: 0.0in,
      text(style: "italic", llap[\u{201C}] + it.body + [\u{201D}])
      + linebreak()
      + h(1.0fr) + text(size: 9.0pt, style: "normal", [--- ] + it.attribution)
    )
  }

  set text( ..fonts.serif, size: 10.0pt )
  show raw: set text( ..fonts.mono, size: 9.0pt )

  set underline(
    offset: 2.0pt,
    // stroke: (
    //   cap: "round",
    //   dash: "dotted",
    // )
  )

  show figure: set figure.caption(separator: [.#h(0.5em)])
  show figure.caption: set align(left)
  show figure.caption: set text( ..fonts.serif, size: 9.0pt )

  set enum(numbering: "1.")
  set list(marker: sym.dot.c)
  // set enum(indent: 0.0em, body-indent: 1.0em)
  // show enum: set par(justify: false)

  // set list(indent: 0.0em, body-indent: 1.0em)
  // show list: set par(justify: false)

  show figure.where(kind: table): set figure(supplement: [Tab.], numbering: "1")
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: image): set figure(supplement: [Fig.], numbering: "1")
  show figure.where(kind: raw): set figure(supplement: [Alg.], numbering: "1")
  show figure.where(kind: raw): set figure.caption(position: top)

  // if cover {
  //   place(horizon + center)[
  //     Discrete Mathematics

  //     #underline(sc("name:"))
  //   ]
  // }

  set page(
    margin: (right: page-margin-right, rest: auto),
    header: context {
      fullwidth(
        underline(sc("name:"))
        + box(
          width: 1.0fr,
          baseline: 2.0pt,
          line(
            length: 100.0%,
            stroke: 0.6pt + color.off.black
          )
        )
        + underline(sc("netid:"))
        + box(
          width: 1.0fr,
          baseline: 2.0pt,
          line(
            length: 100.0%,
            stroke: 0.6pt + color.off.black
          )
        )
        + v(0.6em)
      )
    },
    footer: context {
      set text( ..fonts.serif, size: 7.0pt )
      fullwidth(
        align(
          center,
          counter(page).display() + h(0.6em) + "/" + h(0.6em) + str(counter(page).final().first())
        )
      )
    }
  )

  set heading(numbering: "1")
  // show heading.where(level: 1): set heading(numbering: none)
  // show heading.where(level: 2): set heading(numbering: none)
  // show heading.where(level: 3): set heading(numbering: none)
  // show heading.where(level: 4): set heading(numbering: "1")
  show heading.where(level: 1): it => {
    set text( ..fonts.serif, size: 12.0pt, style: "italic", weight: "regular" )
    block(
      above: 24.0pt,
      below: 16.0pt,
      llap[#counter(heading).display()#h(0.8em)] + it.body
    )
  }
  show heading.where(level: 2): it => {
    set text( ..fonts.serif, size: 12.0pt, style: "italic", weight: "regular" )
    block(
      above: 11.0pt,
      below: 11.0pt,
      it.body
    )
  }
  show heading.where(level: 3): it => {
    set text( ..fonts.serif, size: 12.0pt, style: "italic", weight: "regular" )
    block(
      above: 11.0pt,
      below: 24.0pt,
      it.body
    )
  }
  show heading.where(level: 4): it => {
    set text( ..fonts.serif, size: 12.0pt, style: "italic", weight: "regular" )
    block(
      above: 24.0pt,
      below: 16.0pt,
      llap[#counter(heading).display()#h(8.0pt)] + it.body
    )
  }

  [
    #{
      set text( ..fonts.serif, size: 15.0pt, style: "italic", weight: "regular" )
      block(
        above: 32.0pt,
        below: 11.0pt,
        title
      )
      set text( ..fonts.serif, size: 12.0pt, style: "italic", weight: "regular" )
      block(
        above: 11.0pt,
        below: 11.0pt,
        course
      )
      set text( ..fonts.serif, size: 12.0pt, style: "italic", weight: "regular" )
      block(
        above: 11.0pt,
        below: 24.0pt,
        thedate
      )
    }
    // = #title
    // == #course
    // === #thedate
    #doc
  ]
}
