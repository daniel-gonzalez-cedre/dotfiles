#import "colors.typ" as colors

#let pt2float(ell) = float(repr(ell).split("p").at(0))
#let float2pt(eff) = eff * 1.0pt

#let adobe-garamond = (
  font: "EB Garamond",
  number-type: "old-style",
)

#let eb-garamond = (
  font: "EB Garamond",
  number-type: "old-style",
)

#let gill-sans = (
  font: "Gill Sans",
)
#let gill-title = (
  font: "Gill Sans",
  tracking: ( ( 12.0 * 11.0 ) / 48.0 ) * 1.0pt
)

#let palatino-linotype = (
  font: "Palatino Linotype",
  number-type: "old-style",
  number-width: "proportional",
)

#let tx-02 = (font: "TX-02")

#let kjv1611 = (font: "KJV1611")

#let select(font) = {
  if font == auto {
    return palatino-linotype
  } else {
    let name = lower(font).replace("_", " ").replace("-", " ").trim()
    if name in ("palatino", "palatino linotype") {
      return palatino-linotype
    } else if name in ("garamond", "garamond pro", "adobe garamond", "adobe garamond pro") {
      return adobe-garamond
    } else if name in ("eb garamond", "ebgaramond") {
      return eb-garamond
    } else if name in ("gill sans", "gill") {
      return gill-sans
    } else if name in ("gill title",) {
      return gill-title
    } else if name in ("berkeley", "berkeley mono", "tx 02", "tx02") {
      return tx-02
    } else if name in ("king james version 1611", "king james version", "king james", "kvj", "kvj1611") {
      return kjv1611
    } else {
      return (font: font,)
    }
  }
}

#let sans-serif = text.with(
  font: "Gill Sans",
  fill: colors.ink,
  tracking: ( ( 12.0 * 11.0 ) / 48.0 ) * 1.0pt
)

#let serif = text.with(
  font: "Palatino Linotype",
  fill: colors.ink,
  number-type: "old-style",
  number-width: "proportional"
)

#let mono = text.with(
  font: "TX-02",
  fill: colors.ink,
  size: ( 10 / 11 ) * 1.0em
)

#let fraktur = text.with(
  font: "KJV1611",
  fill: colors.ink
)

#let define = text.with(
  font: "Palatino Linotype",
  fill: colors.ink,
  number-type: "old-style",
  number-width: "proportional",
  // fill: colors.blind.red,
  style: "italic",
)

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
