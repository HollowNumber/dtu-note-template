// DTU-themed Content Components
// Academic content boxes and components following DTU design guidelines

#import "colors.typ": *

#let definition(term, content) = {
  rect(
    width: 100%,
    inset: 1.2em,
    fill: rgb("#f8f9ff"),
    stroke: (left: 4pt + dtu-blue),
    radius: (right: 3pt),
    [
      #text(weight: "bold", fill: dtu-blue, size: 12pt)[Definition: #term]
      #v(0.3em)
      #content
    ]
  )
}

#let theorem(name: "", content) = {
  rect(
    width: 100%,
    inset: 1.2em,
    fill: rgb("#fff8f8"),
    stroke: (left: 4pt + dtu-red),
    radius: (right: 3pt),
    [
      #text(weight: "bold", fill: dtu-red, size: 12pt)[
        Theorem#if name != "" [ (#name)]
      ]
      #v(0.3em)
      #content
    ]
  )
}

#let example(content) = {
  rect(
    width: 100%,
    inset: 1.2em,
    fill: rgb("#f9fff9"),
    stroke: (left: 4pt + dtu-green),
    radius: (right: 3pt),
    [
      #text(weight: "bold", fill: dtu-green, size: 12pt)[Example]
      #v(0.3em)
      #content
    ]
  )
}

#let important(content) = {
  rect(
    width: 100%,
    inset: 1.2em,
    fill: rgb("#fff5f5"),
    stroke: 2pt + dtu-coral,
    radius: 4pt,
    [
      #text(weight: "bold", fill: dtu-coral, size: 12pt)[Important]
      #v(0.3em)
      #content
    ]
  )
}

#let note-box(content) = {
  rect(
    width: 100%,
    inset: 1.2em,
    fill: rgb("#fffef8"),
    stroke: (left: 4pt + dtu-yellow),
    radius: (right: 3pt),
    [
      #text(fill: dtu-dark-blue, size: 10pt)[Note]#content
    ]
  )
}

#let dtu-highlight(content) = {
  rect(
    width: 100%,
    inset: 1.2em,
    fill: rgb("#f5f0ff"),
    stroke: (left: 4pt + dtu-purple),
    radius: (right: 3pt),
    [
      #text(weight: "bold", fill: dtu-purple, size: 12pt)[Key Point]
      #v(0.3em)
      #content
    ]
  )
}
