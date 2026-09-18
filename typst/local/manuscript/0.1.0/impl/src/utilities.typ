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
