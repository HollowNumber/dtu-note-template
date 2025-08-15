// Academic Components
// Academic-focused components like definitions, theorems, and examples

#import "../colors.typ": *

#let definition(term, content) = {
  block(
    width: 100%,
    fill: dtu-light-gray,
    stroke: 2pt + dtu-blue,
    radius: 5pt,
    inset: 1em,
    [
      #text(weight: "bold", fill: dtu-blue, size: 11pt)[Definition: #term]
      #v(0.5em)
      #content
    ]
  )
}

#let theorem(name: "", content) = {
  let title = if name == "" { "Theorem" } else { "Theorem: " + name }
  block(
    width: 100%,
    fill: dtu-light-gray.lighten(50%),
    stroke: 2pt + dtu-dark-blue,
    radius: 5pt,
    inset: 1em,
    [
      #text(weight: "bold", fill: dtu-dark-blue, size: 11pt)[#title]
      #v(0.5em)
      #content
    ]
  )
}

#let example(content) = {
  block(
    width: 100%,
    fill: dtu-yellow.lighten(80%),
    stroke: 2pt + dtu-orange,
    radius: 5pt,
    inset: 1em,
    [
      #text(weight: "bold", fill: dtu-orange, size: 11pt)[Example]
      #v(0.5em)
      #content
    ]
  )
}
