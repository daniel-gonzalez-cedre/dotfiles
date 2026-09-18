#import "counters.typ" as counters

#let proof(
  content,
  title: "Proof",
  number: none,
  name: none,
  punctuation: ".",
  weight: "bold",
  headbreak: false,
  qedbreak: true,
  qed: none,
  exercise: false,
) = {
  // set page(fill: color.misc.cream)
  if exercise {
    qedbreak = false
    qed = sym.square
  }
  if number != none {
    number = " " + str(number)
  } else {
    number = ""
  }
  if name != none {
    name = ": " + name
  } else {
    name = ""
  }
  counters.case.update(0)
  counters.fragment.update(0)
  let headline = if headbreak {
    title + number + name + punctuation + v(- 0.6em)
  } else {
    title + number + name + punctuation + " "
  }
  // if qed == none { qed = text(size: 9.0pt, style: "italic", weight: "bold", "quod erat demonstrandum") }
  if qed == none { qed = smallcaps(lower("QED")) }
  let qedline = if qedbreak {
    v(- 0.6em) + h(1.0fr) + qed
  } else {
    h(1.0fr) + qed
  }
  block(
    // above: 1.0em,
    text(size: 1.0em, style: "italic", weight: weight, headline)
    + content
    + text(size: 1.0em, style: "normal", weight: "regular", qedline)
  )
}
