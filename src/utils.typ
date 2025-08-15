// DTU Template Utilities
// Helper functions and utility components

#import "colors.typ": *

// Figure helper with DTU styling
#let dtu-figure(
  image,
  caption: none,
  width: auto,
  placement: auto
) = {
  figure(
    image,
    caption: if caption != none {
      text(
        size: 10pt,
        fill: dtu-dark-gray,
        style: "italic"
      )[#caption]
    } else { none },
    placement: placement,
    gap: 0.8em
  )
}

// Enhanced list styling
#let dtu-list(items, style: "bullet") = {
  if style == "numbered" {
    set enum(
      numbering: "1.",
      spacing: 0.8em,
      tight: false
    )
    for (i, item) in items.enumerate() {
      [#(i + 1). #item]
      if i < items.len() - 1 { v(0.4em) }
    }
  } else {
    set list(
      marker: text(fill: dtu-blue)[•],
      spacing: 0.8em,
      tight: false
    )
    for (i, item) in items.enumerate() {
      [• #item]
      if i < items.len() - 1 { v(0.4em) }
    }
  }
}

// Spacing utilities
#let small-gap = v(0.5em)
#let medium-gap = v(1em)
#let large-gap = v(1.5em)
#let section-gap = v(2em)

// Text utilities
#let dtu-emphasis(content) = {
  text(weight: "bold", fill: dtu-blue)[#content]
}

#let dtu-subtle(content) = {
  text(size: 9pt, fill: dtu-gray, style: "italic")[#content]
}

// Layout utilities
#let two-column(left, right, ratio: 1fr) = {
  grid(
    columns: (ratio, 1fr),
    column-gutter: 2em,
    left, right
  )
}

#let three-column(left, center, right) = {
  grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 1.5em,
    left, center, right
  )
}

// Horizontal rule with DTU styling
#let dtu-line() = {
  v(0.5em)
  line(length: 100%, stroke: 1pt + dtu-light-gray)
  v(0.5em)
}

// Page break utility
#let page-break() = pagebreak()

// Conditional content based on document type
#let if-note(content) = context {
  // This would need access to document metadata
  // For now, always show content
  content
}

#let if-assignment(content) = context {
  // This would need access to document metadata  
  // For now, always show content
  content
}
