#import "counters.typ" as counters
#import "fonts.typ" as fonts

// FIX FONT FOR EQUATION NUMBERING
#let equation = math.equation.with(block: true, numbering: (..nums) => {
  let num = "(" + counter(heading).get().map(str).at(0) + "." + nums.pos().map(str).join(".") + ")"
  fonts.math-text[#num]
})

#let fragment(
  content,
  title: "Fragment",
  name: none,
  numbering: true,
  reset: false,
  weight: "regular"
) = {
  counters.case.update(0)
  if reset and numbering { counters.fragment.update(0) }
  if numbering { counters.fragment.step() }
  context {
    let number = if numbering {
      " " + counters.fragment.display()
    } else {
      ""
    }
    let subtitle = if name == none {
      ""
    } else {
      " " + name + "."
    }
    let head = title + number + ":" + subtitle
    block(
      inset: (x: 1em),
      text(weight: weight, style: "italic", head) + linebreak() + content
    )
  }
}

#let case(
  content,
  title: "Case",
  name: none,
  numbering: true,
  number: none,
  reset: false,
  weight: "regular",
  size: 1.0em
) = {
  if reset and numbering { counters.case.update(0) }
  if numbering { counters.case.step() }
  context {
    let number = if number != none {
      " " + str(number)
    } else if numbering {
      " " + counters.case.display()
    } else {
      ""
    }
    let subtitle = if name == none {
      ""
    } else {
      " " + name
    }
    let head = title + number + ":" + subtitle
    // set text(size: size)
    block(
      width: 100%,
      inset: (x: 1em),
      text(weight: weight, style: "italic", head) + linebreak() + content
    )
  }
}

#let case-basis(content) = case(content, title: "Basis Step", numbering: false, weight: "regular")
#let case-inductive(content) = case(content, title: "Inductive Step", numbering: false, weight: "regular")

#let basis-step(content) = case(content, title: "Basis Step", numbering: false, weight: "regular")
#let inductive-step(content) = case(content, title: "Inductive Step", numbering: false, weight: "regular")
