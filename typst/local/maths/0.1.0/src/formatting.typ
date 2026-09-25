#import "fonts.typ" as fonts
#import "utilities.typ" as utilities

#let math-text(..args) = context {
  text(font: fonts._body-font.get(), number-type: "old-style", style: "normal", ..args)
}

#let text-math(..args) = context {
  text(font: fonts._math-font.get(), number-type: "lining", ..args)
}

#let fraktur(..args) = {
  set text(font: "KJV1611", size: 0.85em, ..args.named())
  utilities.to-string(..args.pos())
}

#let mono(..args) = {
  set text(font: "TX-02", size: 0.9em, ..args.named())
  utilities.to-string(..args.pos())
}

#let under(
  body,
  annotation,
  delimiter: "brace",
  level: 0,
  fill: auto,
  gap: 1.4em,
) = {
  let brace = if delimiter == "line" {
    math.underline
  } else if delimiter == "brace" {
    math.underbrace
  } else if delimiter == "bracket" {
    math.underbracket
  } else if delimiter == "paren" {
    math.underparen
  } else if delimiter == "shell" {
    math.undershell
  } else {
    panic()
  }
  box({
    place(
      bottom + center,
      dy: level*gap + 1.4em,
      brace(
        hide(
          text(top-edge: "ascender", bottom-edge: "descender")[$#body$]
        ),
        if fill == auto { math-text[#annotation] } else { math-text(fill: fill)[#annotation] }
      )
    )
    $#body$
  })
}

#let over(
  body,
  annotation,
  delimiter: "brace",
  level: 0,
  fill: auto,
  gap: -1.4em,
) = {
  let brace = if delimiter == "line" {
    math.overline
  } else if delimiter == "brace" {
    math.overbrace
  } else if delimiter == "bracket" {
    math.overbracket
  } else if delimiter == "paren" {
    math.overparen
  } else if delimiter == "shell" {
    math.overshell
  } else {
    panic()
  }
  box({
    place(
      top + center,
      dy: -level*gap - 1.2em,
      brace(
        hide(
          text(top-edge: "ascender", bottom-edge: "descender")[$#body$]
        ),
        if fill == auto { math-text[#annotation] } else { math-text(fill: fill)[#annotation] }
      )
    )
    $#body$
  })
}
