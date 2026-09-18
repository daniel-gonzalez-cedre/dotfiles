#import "../src/fonts.typ" as fonts
#import "../src/formatting.typ": display-date

#let publisherblock(publisher) = {
  place(top + left, {
    set text( ..fonts.gill-title, size: 14.0pt )
    [#upper(publisher)]
  })
}

#let dateblock(date) = {
  place(top + right, {
    set text( ..fonts.gill-title, size: 14.0pt )
    [#upper(display-date(date))]
  })
}

#let titleblock(title, split: false) = {
  place(horizon + left, {
    set text( ..fonts.gill-title, size: 48.0pt, hyphenate: false )
    v(1.0fr)
    if split {
      for word in title.split() {
        [#upper(word)]
        v(-32.0pt)
      }
    } else {
      [#upper(title)]
    }
    v(2.0fr)
  })
}

#let authorblock(author) = {
  place(bottom + right, {
    set text( ..fonts.gill-title, size: 20.0pt )
    align(left, upper(author))
  })
}

#let copyrightblock(university, course, code, author, date) = {
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

#let cover(
  title: "The Title",
  author: "The Author",
  date: none,
  publisher: auto,
  university: none,
  course: none,
  code: none,
  body
) = {
  if publisher != none {
    publisherblock(publisher)
  }

  if date == auto {
    dateblock(datetime.today())
  } else if date != none {
    dateblock(date)
  }

  titleblock(title, split: false)
  authorblock(author)

  pagebreak()

  copyrightblock(
    university,
    course,
    code,
    author,
    if date in (auto, none) {
      datetime.today()
    } else {
      date
    }
  )

  pagebreak()

  body
}
