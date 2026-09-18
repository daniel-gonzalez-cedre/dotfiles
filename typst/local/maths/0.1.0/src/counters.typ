#let fragment   = counter("fragment")
#let case       = counter("case")

#let idea       = counter("idea")
#let lemma      = counter("lemma")
#let theorem    = counter("theorem")
#let corollary  = counter("corollary")

#let definition = counter("definition")
#let axiom      = counter("axiom")
#let rule       = counter("rule")

#let exercise   = counter("exercise")
#let algorithm  = counter("algorithm")

#let offset = state("offset", 0)
#let offset_theorems(value) = offset.update(value)
