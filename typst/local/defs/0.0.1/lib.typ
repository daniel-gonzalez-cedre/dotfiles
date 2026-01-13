#let circa = [_ca._]
#let ca = [_ca._]
#let BC = smallcaps("bc")
#let AD = smallcaps("ad")

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

#let llap(body) = {
  box(width: 0.0pt)[#h(-100cm)#h(1.0fr)#body]
}

#let nth(num) = {
  num = int(num)
  let rem = calc.rem(num, 10)
  if num not in (11, 12, 13) {
    if rem == 1 { return str(num) + super[st] }
    if rem == 2 { return str(num) + super[nd] }
    if rem == 3 { return str(num) + super[rd] }
  }
  return str(num) + super[th]
}

#let displaydate(date, short: false) = {
  let year = date.display("[year]")
  let month = date.display("[month repr:long]")
  let day = date.display("[day padding:none]")
  if short {
    return month + " " + day + ", " + year
  } else {
    return nth(day) + " of " + month + ", " + year
  }
}
