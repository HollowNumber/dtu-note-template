// Content Helpers
// Figure, list, and content management utilities

#import "../colors.typ": *

#let dtu-figure(
  content, 
  caption: "", 
  kind: "figure", 
  supplement: auto
) = {
  figure(
    content,
    caption: caption,
    kind: kind,
    supplement: supplement
  )
}

#let dtu-list(items, style: "bullet") = {
  if style == "bullet" {
    list(
      ..items.map(item => [#item])
    )
  } else if style == "numbered" {
    enum(
      ..items.map(item => [#item])
    )
  } else if style == "custom" {
    for item in items [
      • #item
    ]
  }
}

// Conditional content helpers
#let if-note(content) = context {
  // This would need to be implemented based on document state
  content
}

#let if-assignment(content) = context {
  // This would need to be implemented based on document state  
  content
}
