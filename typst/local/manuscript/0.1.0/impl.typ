#import "@local/maths:0.1.0" as maths
#import "@local/tables:0.1.0" as tables
#import "@local/marginalia:0.1.0" as marginalia: marginalis, marginale, apostille, wideblock

#import "impl/src/formatting.typ" as formatting

#let part(weight: "bold", title) = {
  show heading.where(level: 1): it => {
    set text(size: 22pt, style: "italic", weight: weight)
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

#let epigraph(attribution: none, content) = {
  show quote: set text( size: 9pt, style: "italic" )
  show quote.where(block: true): it => {
    set par(justify: false)
    set align(left)
    set block(above: 28pt, below: 28pt)
    pad(
      left: 1.0in,
      right: 0.0in,
      box(width: 1.0fr)[
        #formatting.llap[\u{201C}]
        #h(0pt, weak: true)
        #it.body
        #h(0pt, weak: true)
        \u{201D}
      ] + if attribution != none {
        linebreak()
        h(1.0fr)
        text(size: 9pt, style: "normal")[\u{2015}#it.attribution]
      }
    )
  }
  quote(attribution: attribution, block: true, content)
}

#let quotation = epigraph

#let preheading = heading.with(
  level: 1,
  numbering: none,
  outlined: false
)
