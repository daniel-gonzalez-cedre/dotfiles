#import "colors.typ": inks

#let default-text = (
  font: "Palatino Linotype",
  fill: inks.off.black,
  style: "normal",
  weight: "regular"
)

#let default-stroke = (
  thickness: 0.1cm,
  paint: inks.off.black,
  dash: "solid",
  join: "round",
  cap: "round",
)

/*
  * triangle, curved-stealth, stealth
  * > <       )>              >>
  *
  * hook, straight, barbed
  *
  * parenthesis, bracket, bar
  * )            ] [      |
  *
  * circle, ellipse, diamond, rect
  * o                <>       []
  *
  * plus, x, star
  * +     x  *
*/
#let default-mark = (
  symbol: ")>",
  scale: 1.0,  // 0.85
  stroke: (
    thickness: default-stroke.thickness/2,
    paint: default-stroke.paint,
  ),
  fill: default-stroke.paint,
)

#let default-content = (
  padding: 2*default-stroke.thickness,
  wrap: text.with(..default-text)
)

#let default-point = (
  radius: default-stroke.thickness,
  stroke: (
    thickness: 0.0cm,
    paint: white.transparentize(100.0%),
  ),
  fill: default-stroke.paint,
  padding: default-content.padding,
  anchor: "south",
  label-font: default-text.font,
  label-fill: default-text.fill,
  label-style: default-text.style,
  label-weight: default-text.weight,
)

#let default-arc = (stroke: default-stroke)
#let default-arc-through = (stroke: default-stroke)
#let default-arc-between = (
  direction: "ccw",
  radius:    2*default-stroke.thickness,
  thickness: default-stroke.thickness,
  paint:     default-stroke.paint,
  dash:      default-stroke.dash,
  cap:       default-stroke.cap,
  fill: default-stroke.paint.transparentize(50.0%),
)
#let default-circle = (stroke: default-stroke)
#let default-circle-through = (stroke: default-stroke)

#let default-line = (stroke: default-stroke)

#let default-edge = (
  thickness: default-stroke.thickness,
  paint:     default-stroke.paint,
  dash:      default-stroke.dash,
  cap:       default-stroke.cap,
  mark-symbol:    default-mark.symbol,
  mark-scale:     default-mark.scale,
  mark-thickness: default-mark.stroke.thickness,
  mark-paint:     default-mark.stroke.paint,
  fill: none,
  close: false,
)

#let default-path = (
  thickness: default-stroke.thickness,
  paint: default-stroke.paint,
  dash: default-stroke.dash,
  join: default-stroke.join,
  cap:  default-stroke.cap,
  mark-symbol:    none,
  mark-scale:     default-mark.scale,
  mark-thickness: default-mark.stroke.thickness,
  mark-paint:     default-mark.stroke.paint,
  fill: none,
  close: false,
)

#let default-region = (
  thickness: default-path.thickness,
  paint: default-path.paint,
  dash:  default-path.dash,
  join:  default-path.join,
  cap:   default-path.cap,
  mark-symbol:    none,
  mark-scale:     default-mark.scale,
  mark-thickness: 0.0cm,
  mark-paint:     white.transparentize(100.0%),
  fill: default-stroke.paint.transparentize(50.0%),
  close: true,
)

#let default = (
  content: default-content,
  stroke:  default-stroke,
  mark: (
    // symbol: gray,
    // scale: 0.85,
    fill: inks.off.black,
    stroke: default-stroke,
  ),
  fill: none,
  point:          default-point,
  arc:            default-arc,
  arc-through:    default-arc-through,
  arc-between:    default-arc-through,
  // sector:         default-sector,
  circle:         default-circle,
  circle-through: default-circle-through,
  line:           default-line,
  edge:           default-edge,
  region:         default-region,
)
