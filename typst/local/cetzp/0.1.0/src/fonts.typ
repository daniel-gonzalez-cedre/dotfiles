#import "colors.typ": inks

#let font-select(name) = {
  if name == auto {
    return palatino
  } else {
    name = lower(name).replace("-", " ").trim()
    if font in ("adobe garamond pro", "adobe garamond", "garamond") {
      return fonts.adobe-garamond
    } else if font in ("eb garamond", "ebgaramond") {
      return fonts.eb-garamond
    } else if font in ("tx 02", "tx02", "berkeley mono", "berkeley") {
      return fonts.berkeley-mono
    } else {
      panic()
    }
  }
}

// SERIF
#let adobe-garamond = (
  font: "EB Garamond",
  number-type: "old-style",
  fill: inks.off.black,
)

// SERIF
#let eb-garamond = (
  font: "EB Garamond",
  number-type: "old-style",
  fill: inks.off.black,
)

// SERIF
#let palatino = (
  font: "Palatino Linotype",
  number-type: "old-style",
  number-width: "proportional",
  fill: inks.off.black,
)

// SANS
#let gill-sans = (
  font: "Gill Sans",
  fill: inks.off.black,
)

// MONO
#let berkeley-mono = (
  font: "TX-02",
  fill: inks.off.black,
)

// FRAK
#let kjv1611 = (
  font: "KJV1611",
  fill: inks.off.black,
)
