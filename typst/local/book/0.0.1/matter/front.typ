#let table_of_contents = body => {
  show heading.where(level: 1): it => {
    set text( ..fonts.select("Palatino Linotype"), size: 22.0pt, style: "italic", weight: "bold" )
    block(
      v(32.0pt + 48.0pt)
      + it.body
    )
  }

  show outline.entry.where(level: 1): set block(above: 32.0pt, below: 12.0pt)
  show outline.entry.where(level: 2): set block(above:  8.0pt, below:  8.0pt)
  show outline.entry.where(level: 3): set block(above:  8.0pt, below:  8.0pt)

  show outline.entry.where(level: 1): set text( ..fonts.select("Palatino Linotype"), size: 16.0pt, style: "italic" )
  show outline.entry.where(level: 2): set text( ..fonts.select("Palatino Linotype"), size: 11.0pt, style: "italic" )
  show outline.entry.where(level: 3): set text( ..fonts.select("Palatino Linotype"), size: 11.0pt, style: "italic" )

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

  body
}

