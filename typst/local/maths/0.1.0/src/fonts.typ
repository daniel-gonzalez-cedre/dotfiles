#import "colors.typ" as colors

#let ink = rgb("#252422")
#let paper = rgb("#FBF7F1")

#let _body-font = state("_body-font", "Palatino Linotype")
#let _math-font = state("_math-font", "Concrete Math")

#let diacritic = (
  grave: (
    single: x => x + "\u{300}",
    double: x => x + "\u{30F}"  // NOT SUPPORTED
  ),
  acute: (
    single: x => x + "\u{301}",
    double: x => x + "\u{30B}"
  ),
  dot: (
    over:   x => x + "\u{307}",
    double: x => x + "\u{308}",
    under:  x => x + "\u{323}"
  ),
  umlaut:   x => x + "\u{308}",
  diaresis: x => x + "\u{308}",
  tilde: x => x + "\u{303}",
  circumflex: x => x + "\u{302}",
  caron: x => x + "\u{30C}",  // NOT SUPPORTED
)
