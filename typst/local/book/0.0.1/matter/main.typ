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
