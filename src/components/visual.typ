// Visual Components  
// Visual elements like boxes, highlights, and visual emphasis

#import "../colors.typ": *

#let important(content) = {
  block(
    width: 100%,
    fill: dtu-salmon.lighten(60%),
    stroke: 2pt + dtu-coral,
    radius: 5pt,
    inset: 1em,
    [
      #text(weight: "bold", fill: dtu-coral, size: 11pt)[Important]
      #v(0.5em)
      #content
    ]
  )
}

#let note-box(content) = {
  block(
    width: 100%,
    fill: dtu-light-gray,
    stroke: 1pt + dtu-gray,
    radius: 3pt,
    inset: 0.8em,
    content
  )
}

#let dtu-highlight(content) = {
  rect(
    fill: dtu-yellow.lighten(60%),
    stroke: none,
    radius: 2pt,
    inset: (x: 3pt, y: 1pt),
    [#content]
  )
}
