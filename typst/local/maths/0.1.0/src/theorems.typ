#import "counters.typ" as counters

#let statement(
  expression,
  size: 1em,
  title: "Statement",
  style: "italic",
  weight: "bold",
  number: none,
  numbering: true,
  section: false,
  offset: auto,
  level: 1,
  thecounter: none,
  punctuation: ".",
  name: "",
  newline: true,
  delimiter: sym.angle.right,
  label: none,
) = {
  if numbering and number == none { thecounter.step() }
  let thename = if name != "" { ": " + name } else { name }
  context {
    let theoffset = if offset == auto { state("offset").get() } else { offset }
    let thenumber = if numbering and section {
      counter(heading.where(level: level)).get().map(x => str(x + theoffset)).at(0) + "." + thecounter.display()
    } else if numbering and number != none {
      str(number)
    } else if numbering {
      thecounter.display()
    } else {
      ""
    }
    let thenumberspaced = if thenumber != "" { " " + thenumber } else { thenumber }
    let thenewline = if newline { h(1fr) + v(-0.6em) } else { "" }
    let headline = text(
      size: size,
      style: style,
      weight: weight,
      title + thenumberspaced + thename + punctuation + thenewline
    )
    let thelabel = if label != none [#metadata((kind: "theorem", supplement: title, number: thenumber))#label] else []
    block(
      headline + thelabel + expression + if delimiter != none {
        place(bottom + right, scale(x: -100%, y: 100%, delimiter))
      } else {
        ""
      }
    )
  }
}

#let idea      = statement.with(title: "Idea",      thecounter: counter("idea"),      section: true)
#let lemma     = statement.with(title: "Lemma",     thecounter: counter("lemma"),     section: true)
#let theorem   = statement.with(title: "Theorem",   thecounter: counter("theorem"),   section: true)
#let corollary = statement.with(title: "Corollary", thecounter: counter("corollary"), section: true)

#let definition = statement.with(title: "Definition", thecounter: counter("definition"), section: true)
#let axiom      = statement.with(title: "Axiom",      thecounter: counter("axiom"),      section: false)
#let rule       = statement.with(title: "Rule",       thecounter: counter("rule"),       section: false)

#let exercise  = statement.with(title: "Exercise",  thecounter: counter("exercise"),  section: true, newline: false)
#let algorithm = statement.with(title: "Algorithm", thecounter: counter("algorithm"), section: true)

// #let algorithm(
//   expression,
//   numbering: true,
//   section: true,
//   level: 1,
//   offset: auto,
//   title: "Algorithm",
//   name: "",
//   punctuation: ".",
//   headbreak: true
// ) = {
//   if numbering { counters.algorithm.step() }
//   name = if name != "" { ": " + name }
//   context {
//     let offset = if offset == auto { counters.offset.get() } else { offset }
//     let number = if numbering and section {
//       " " + counter(heading.where(level: level)).get().map(x => str(x + offset)).at(0) + "." + counters.algorithm.display()
//     } else if numbering {
//       " " + counters.algorithm.display()
//     } else {
//       ""
//     }
//     let headline = if headbreak {
//       text(size: 1em, style: "italic", weight: "bold", title + number + name + punctuation) + h(1.0fr) + v(- 0.6em)
//     } else {
//       text(size: 1em, style: "italic", weight: "bold", title + number + name + punctuation)
//     }
//     block( headline + expression )
//   }
// }
