#let opacity(colorname, a) = {
  let (r, g, b, _) = color.components(colorname)
  return rgb(r, g, b, a)
}

#let color = (
  white: rgb("#FBF7F1"),
  black: rgb("#141617"),
  off: (
    white: rgb("#F6F5F2"),
    black: rgb("#252422"),
  ),
  light: (
    bg0: rgb("#F9F5D7"),
    bg1: rgb("#F5EDCA"),
    bg2: rgb("#F3EAC7"),
    bg3: rgb("#F2E5BC"),
    bg4: rgb("#EEE0B7"),
    bg5: rgb("#EBDBB2"),

    fg0: rgb("#141617"),
    fg1: rgb("#252422"),

    black:    rgb("#141617"),
    blackish: rgb("#252422"),

    red:    rgb("#C14A4A"),
    green:  rgb("#6C782E"),
    blue:   rgb("#45707A"),
    yellow: rgb("#B47109"),
    purple: rgb("#945E80"),
    orange: rgb("#C35E0A"),
    aqua:   rgb("#4C7A5D"),
  ),
  dark: (
    bg0: rgb("#252423"),
    bg1: rgb("#282828"),
    bg2: rgb("#2F2C29"),
    bg3: rgb("#3C3836"),
    bg4: rgb("#3C3836"),
    bg5: rgb("#504945"),

    fg0: rgb("#D4BE98"),
    fg1: rgb("#DDC7A1"),

    black:    rgb("#141617"),
    blackish: rgb("#252422"),

    red:    rgb("#EA6962"),
    green:  rgb("#A9B665"),
    blue:   rgb("#7DAEA3"),
    yellow: rgb("#D8A657"),
    purple: rgb("#D3869B"),
    orange: rgb("#E78A4E"),
    aqua:   rgb("#89B482"),
  ),
  blind: (
    red:    rgb("#d81b60"),
    green:  rgb("#22ac7b"),
    blue:   rgb("#1e88e5"),
    yellow: rgb("#ffc107"),
    purple: rgb("#7c1d6f"),
    orange: rgb("#ff5430"),
    gold:   rgb("#ea9c00"),
  ),
  paper: (
    sepia:  rgb("#F7F0E4"),
    natural:  rgb("#FBF7F1"),
    bleached:  rgb("#FFFFFF"),
  ),
  illinois: (
    orange: rgb("#FF5F05"),
    blue: rgb("#13294B"),
  ),
  misc: (
    sepia:  rgb("#F7F0E4"),
    butter: rgb("#FBF7F1"),
    cream:  rgb("#F6F5F2"),
    clarified:  rgb("#FDFBF8"),
  ),
)
