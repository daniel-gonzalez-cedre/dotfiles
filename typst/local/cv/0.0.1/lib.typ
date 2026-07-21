#import "@local/colors:0.0.1": *
#import "@local/fonts:0.0.1": *
#import "@local/maths:0.0.1": *
#import "@local/defs:0.0.1": *

#import "@local/margins:0.0.1": *

// #let red    = color.blind.red
// #let green  = color.blind.green
// #let blue   = color.blind.blue
// #let yellow = color.blind.yellow
// #let purple = color.blind.purple
// #let orange = color.blind.orange
// // #let aqua   = color.light.aqua

#let red    = rgb("cd241c")
#let teal   = rgb("458588")
#let beige  = rgb("a79a84")

#let inks = (
  dark:   luma(42),
  medium: luma(82),
  light:  luma(170),
)

#let sizes = (
  title: 28.0pt,
  subtitle: 13.0pt,
  heading: 16.0pt,
  item: 10.0pt,
  body: 9.0pt,
  footnote: 7.0pt,
)

#let spacedot(size: sizes.body) = text(fill: inks.light, size: size)[$space dot.c space$]

#let daterange(start, end, size: sizes.body) = {
  if end == "" {
    [#text(fill: inks.medium)[#sc[#start]] #text(fill: inks.light)[--] #text(fill: inks.light)[#sc[Present]]]
  } else {
    [#text(fill: inks.medium)[#sc[#start]] #text(fill: inks.light)[--] #text(fill: inks.medium)[#sc[#end]]]
  }
}

#let item-experience(
  title: "",
  institute: "",
  department: "",
  start: "",
  end: ""
) = block(above: 1.0em, below: 1.0em, breakable: false)[
  #text(size: sizes.item, fill: inks.dark, style: "normal", weight: "bold")[#title]
  #h(1.0fr)
  #text(size: sizes.item, fill: inks.dark, style: "italic", weight: "bold")[#institute]
  #linebreak()
  #text(size: sizes.body, fill: inks.medium, style: "normal", weight: "regular")[#sc[#department]]
  #h(1.0fr)
  #daterange(start, end, size: sizes.body)
]

#let item-education(
  degree: "",
  subject: "",
  honor: "",
  institute: "",
  department: "",
  start: "",
  end: ""
) = block(above: 1.0em, below: 1.0em, breakable: false)[
  #text(size: sizes.item, fill: inks.dark, style: "normal", weight: "bold")[#degree]
  #spacedot(size: sizes.item)
  #text(size: sizes.item, fill: inks.medium, style: "normal", weight: "bold")[#subject]
  #{
    if honor != "" {
      text(size: sizes.item, fill: inks.light, style: "italic", weight: "bold")[#spacedot(size: sizes.item)#honor]
    }
  }
  #h(1.0fr)
  #text(size: sizes.item, fill: inks.dark, style: "italic", weight: "bold")[#institute]
  #linebreak()
  #text(size: sizes.body, fill: inks.medium, style: "normal", weight: "regular")[#sc[#department]]
  #h(1.0fr)
  #daterange(start, end, size: sizes.body)
]

#let item-educations(
  degree: "",
  subjects: ("",),
  honor: "",
  institute: "",
  departments: "",
  start: "",
  end: ""
) = block(above: 1.0em, below: 1.0em, breakable: false)[
  #text(size: sizes.item, fill: inks.dark, style: "normal", weight: "bold")[#degree]
  #{
    for subject in subjects {
      text(size: sizes.item, fill: inks.medium, style: "normal", weight: "bold")[#spacedot(size: sizes.item)#subject]
    }
    if honor != "" {
      text(size: sizes.item, fill: inks.light, style: "italic", weight: "bold")[#spacedot(size: sizes.item)#honor]
    }
  }
  #h(1.0fr)
  #text(size: sizes.item, fill: inks.dark, style: "italic", weight: "bold")[#institute]
  #linebreak()
  #{
    for department in departments.intersperse(spacedot(size: sizes.body)) {
      text(size: sizes.body, fill: inks.medium, style: "normal", weight: "regular")[#sc(department)]
    }
  }
  #h(1.0fr)
  #daterange(start, end)
]

#let item-award(
  year: "",
  award: "",
  awarder: "",
  institute: ""
) = block(above: 0.8em, below: 0.8em, breakable: false)[
  #grid(
    align: (left, left, right, center, left),
    columns: (3.0em, 2.0fr, 2.0fr, 1.0em, 1.0fr),
    text(size: sizes.body, fill: inks.medium, style: "normal", weight: "regular")[#year],
    text(size: sizes.body, fill: inks.dark, style: "normal", weight: "bold")[#award],
    text(size: sizes.body, fill: inks.medium, style: "italic", weight: "regular")[#awarder],
    [~],
    text(size: sizes.body, fill: inks.dark, style: "italic", weight: "regular")[#institute],
  )
]

#let item-pub(
  year: "",
  title: "",
  venue: "",
  authors: ("Daniel Gonzalez Cedre",),
  me: 0,
  equal: ()
) = block(above: 1.0em, below: 1.0em, breakable: false)[
  // #grid(
  //   columns: (auto, )
  // )
  #grid(
    align: (left, left, right),
    columns: (3.0em, 1.0fr, auto),
    rows: (1.4em, auto),
    text(size: sizes.body, fill: inks.medium, style: "normal", weight: "regular")[#year],
    text(size: sizes.body, fill: inks.dark,   style: "normal", weight: "bold")[#title],
    text(size: sizes.body, fill: inks.medium, style: "normal", weight: "bold")[#venue],
    [~],
    {
      let index = 0
      for author in authors.intersperse(spacedot(size: sizes.body)) {
        if index/2 == me {
          text(size: sizes.body, fill: inks.medium, style: "italic", weight: "regular")[#author]
        } else {
          text(size: sizes.body, fill: inks.medium, style: "normal", weight: "regular")[#author]
        }
        if index/2 in equal {
          text(size: sizes.body, fill: inks.light, style: "normal", weight: "regular")[\*]
        }
        index += 1
      }
    },
    {
      if equal.len() != 0 {
          text(size: sizes.footnote, fill: inks.light, style: "normal", weight: "regular")[\*#sc[Equal Contribution]]
      }
    }
  )
]

#let item-talk(
  year: "",
  title: "",
  type: "",
  venue: ""
) = block(above: 0.8em, below: 0.8em, breakable: false)[
  #grid(
    align: (left, left, right, center, left),
    columns: (3.0em, 2.0fr, 0.75fr, 1.0em, 1.25fr),
    text(size: sizes.body, fill: inks.medium, style: "normal", weight: "regular")[#year],
    text(size: sizes.body, fill: inks.dark,   style: "normal", weight: "bold")[#title],
    text(size: sizes.body, fill: inks.medium, style: "italic", weight: "regular")[#type],
    [~],
    text(size: sizes.body, fill: inks.dark,   style: "italic", weight: "regular")[#venue]
  )
]

#let item-collab(
  title: "",
  institute: "",
  department: "",
  advisors: (),
  start: "",
  end: "",
  dates: (),
  description: ("",)
) = block(above: 1.0em, below: 1.0em, breakable: false)[
  #text(size: sizes.item, fill: inks.dark, style: "normal", weight: "bold")[#title]
  #h(1.0fr)
  #text(size: sizes.item, fill: inks.dark, style: "italic", weight: "bold")[#institute]
  #linebreak()
  #text(size: sizes.body, fill: inks.medium, style: "normal", weight: "regular")[#sc(department)]
  #{
    if advisors.len() != 0 {
      for advisor in advisors {
        text(size: sizes.body, fill: inks.light, style: "italic", weight: "regular")[#spacedot(size: sizes.body)#advisor]
      }
    }
  }
  #h(1.0fr)
  #{
    if dates.len() == 0 {
      daterange(start, end)
    } else {
      text(size: sizes.body, fill: inks.light, style: "normal", weight: "regular")[#sc[Multiple Date Ranges]]
    }
  }
  #{
    if dates.len() == 0 {
      if type(description) == str {
        list.item(description)
      } else {
        for desc in description {
          list.item(desc)
        }
      }
    } else {
      for (desc, (start, end)) in description.zip(dates) {
        list.item[#desc#h(1.0fr)#daterange(start, end)]
      }
    }
  }
]

#let item-mentor(
  year: "",
  title: "",
  type: "",
  venue: ""
) = block(above: 0.8em, below: 0.8em, breakable: false)[
  #grid(
    align: (left, left, right, center, left),
    columns: (3.0em, 2.0fr, 2.0fr, 1.0em, 1.0fr),
    text(size: sizes.body, fill: inks.medium, style: "normal", weight: "regular")[#year],
    text(size: sizes.body, fill: inks.dark,   style: "normal", weight: "bold")[#title],
    text(size: sizes.body, fill: inks.medium, style: "italic", weight: "regular")[#type],
    [~],
    text(size: sizes.body, fill: inks.dark,   style: "italic", weight: "regular")[#venue]
  )
]

#let item-teaching(
  class: "",
  course: "",
  institute: "",
  title: "",
  enrollment: "",
  semester: ""
) = block(above: 1.0em, below: 1.0em, breakable: false)[
  #text(size: sizes.item, fill: inks.dark,   style: "normal", weight: "bold")[#class]
  #spacedot(size: sizes.item)
  #text(size: sizes.item, fill: inks.medium, style: "normal", weight: "regular")[#sc(course)]
  #h(1.0fr)
  #text(size: sizes.item, fill: inks.dark,   style: "italic", weight: "bold")[#institute]
  #linebreak()
  #text(size: sizes.body, fill: inks.medium, style: "normal", weight: "regular")[#sc(title)]
  #spacedot(size: sizes.body)
  #text(size: sizes.body, fill: inks.light,  style: "normal", weight: "regular")[
    #{
      if enrollment == "" or enrollment == 0 {
        sc[TBD]
      } else if enrollment == 1 {
        sc(str(enrollment) + " student")
      } else {
        sc(str(enrollment) + " students")
      }
    }
  ]
  #h(1.0fr)
  #text(size: sizes.body, fill: inks.medium, style: "normal", weight: "regular")[#sc(semester)]
]

#let item-service(
  type: "",
  department: "",
  institute: "",
) = block(above: 0.8em, below: 0.8em, breakable: false)[
  #grid(
    align: (left, left, center, right),
    columns: (10.0em, auto, auto, auto),
    text(size: sizes.body, fill: inks.dark, style: "normal", weight: "regular")[#sc(type)],
    text(size: sizes.body, fill: inks.medium, style: "italic", weight: "regular")[#institute],
    spacedot(size: sizes.body),
    text(size: sizes.body, fill: inks.dark,   style: "italic", weight: "bold")[#department],
  )
]

#let cv(
  firstname: "Daniel",
  lastname: "Gonzalez Cedre",
  website: "cedre.tech",
  url: "https://cedre.tech",
  email: "cedre@illinois.edu",
  date: datetime.today(),
  paper: "us-letter",
  paper_color: "natural",
  doc
) = {
  show: maths
  set math.lr(size: 115.0%)

  set document(
    title: "Curriculum Vitae",
    author: firstname + " " + lastname,
    date: date,
  )

  set page(
    paper: paper,
    fill: if paper_color == "natural" { color.paper.natural } else { color.paper.bleached },
    margin: (
      x: 0.7in,
      y: 0.65in,
    ),
    header: none,
    footer: context text(size: sizes.footnote, fill: inks. light)[#sc[
      #date.display("[month repr:long] [day], [year repr:full]")
      #h(1.0fr)
      #firstname #lastname#spacedot(size: sizes.footnote)curriculum vitae
      #h(1.0fr)
      #counter(page).display("1 of 1", both: true)
    ]]
  )

  set par(justify: true)

  set text( ..adobe-garamond, fill: inks.dark, size: 9.0pt )
  show raw: set text( ..berkeley-mono, fill: inks.dark, size: 9.0pt )

  set smallcaps(all: true)

  set underline(
    offset: 2.0pt,
    stroke: (
      cap: "round",
      dash: "dotted",
    )
  )

  // set enum(indent: 1.0em, body-indent: 1.0em)
  // show enum: set par(justify: false)

  // set list(marker: sym.bullet.hyph)
  set list(marker: text(fill: inks.light)[#sym.hyph])
  // set list(indent: 1.0em, body-indent: 1.0em)
  // show list: set par(justify: false)

  // set page(
  //   margin: (right: page-margin-right, rest: auto),
  //   header: context {
  //     // if due {
  //     //   fullwidth(
  //     //     text(style: "italic", color.blind.red)[Due: #displaydate(date)]
  //     //     + h(1.0fr)
  //     //     // + sc(lower(title))
  //     //     // + h(2.0em)
  //     //     + counter(page).display()
  //     //     + v(1.0em)
  //     //   )
  //     // } else {
  //       fullwidth(
  //         emph(displaydate(date))
  //         + h(1.0fr)
  //         + sc(lower(title))
  //         + h(2.0em)
  //         + counter(page).display()
  //         + v(1.0em)
  //       )
  //     // }
  //   }
  // )

  show heading.where(level: 1): it => {
    set text( ..adobe-garamond, size: sizes.heading, style: "italic", weight: "bold" )
    block(
      above: 16.0pt,
      below: 10.0pt,
    )[
      #it.body #box(
        width: 1.0fr, line(
          length: 100.0%,
          stroke: (
            paint: inks.light,
            thickness: 0.5pt,
            cap: "round"
          )
        )
      )
    ]
  }
  // show heading.where(level: 2): it => {
  //   set text( ..adobe-garamond, size: 13.0pt, style: "italic", weight: "bold" )
  //   block(
  //     above: 22.0pt,
  //     below: 16.0pt,
  //     it.body
  //     // if numbering {
  //     //   llap[#counter(heading).display()#h(12.0pt)] + it.body
  //     // } else {
  //     //   it.body
  //     // }
  //   )
  // }
  // show heading.where(level: 3): it => {
  //   set text( ..adobe-garamond, size: 12.0pt, style: "italic", weight: "regular" )
  //   block(
  //     // if numbering {
  //     //   llap[#counter(heading).display()#h(12.0pt)] + it.body
  //     // } else {
  //     //   it.body
  //     // }
  //   )
  // }

  // show link: set text(luma(50))

  align(center)[
    #text(fill: inks.medium, size: sizes.title)[#firstname] ~
    #text(fill: inks.dark, size: sizes.title, style: "italic", weight: "bold")[#lastname]

    #text(fill: teal, size: sizes.subtitle, style: "italic", weight: "bold")[#link(url)[#website]]
    #spacedot(size: sizes.subtitle)
    // #text(fill: inks.light, size: sizes.subtitle)[$quad dot.c quad$]
    #text(fill: teal, size: sizes.subtitle, style: "italic", weight: "bold")[#email]
  ]

  doc
}
