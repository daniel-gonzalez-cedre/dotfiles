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
