#import "@local/maths:0.1.0" as maths

#import "book.typ": book

#let chapter(
  author: "Daniel Gonzalez Cedre",
  title: [The Title],
  shorttitle: none,
  number: 1,
  date: datetime.today(),
  publisher: none,
  university: none,
  course: none,
  code: none,
  paper_size: "us-letter",
  paper_color: "natural",
  font_size: 10pt,
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
    font_size: font_size,
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
