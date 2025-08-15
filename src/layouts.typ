// DTU Page Layouts
// Note and assignment templates following DTU design guidelines

#import "colors.typ": *

#let dtu-note(
  course: "",
  course-name: "",
  title: "",
  date: datetime.today(),
  author: "",
  semester: "",
  body
) = {
  // Page setup following DTU guidelines
  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 2cm),
    header: context {
      let page-number = counter(page).display()
      if page-number != "1" {
        grid(
          columns: (auto, 1fr, auto),
          align: (left, center, right),
          column-gutter: 1em,
          [
            #rect(
              width: 1.2cm,
              height: 0.4cm,
              fill: dtu-red,
              radius: 1pt,
              stroke: none,
              align(center + horizon)[
                #text(size: 8pt, weight: "bold", fill: white)[DTU]
              ]
            )
          ],
          [#text(size: 9pt, fill: dtu-black)[#course - #title]],
          [#text(size: 9pt, fill: dtu-black)[Page #page-number]]
        )
        v(-0.2em)
        line(length: 100%, stroke: 0.5pt + dtu-gray)
      }
    },
    footer: context {
      let page-number = counter(page).display()
      if page-number != "1" {
        align(center)[
          #text(size: 8pt, fill: dtu-gray)[
            Technical University of Denmark
          ]
        ]
      }
    }
  )
  
  // Typography - Following DTU guidelines (Neo Sans primary, Arial fallback)
  set text(
    font: ("Neo Sans", "Arial", "Liberation Sans", "Helvetica Neue", "Helvetica"),
    size: 11pt,
    lang: "en"
  )
  
  set par(
    justify: true,
    leading: 0.65em,
  )
  
  // Headings with DTU styling
  show heading.where(level: 1): it => {
    set text(size: 20pt, weight: "bold", fill: dtu-red)
    block(spacing: 1.5em, it)
    v(-0.3em)
    line(length: 100%, stroke: 2pt + dtu-red)
    v(1.2em)
  }
  
  show heading.where(level: 2): it => {
    set text(size: 16pt, weight: "bold", fill: dtu-blue)
    block(spacing: 1.2em, it)
  }
  
  show heading.where(level: 3): it => {
    set text(size: 13pt, weight: "bold", fill: dtu-dark-blue)
    block(spacing: 1em, it)
  }
  
  // Math styling
  set math.equation(numbering: "(1)")
  show math.equation: set text(fill: dtu-black)
  
  // Lists
  set enum(numbering: "1.a.i.")
  set list(marker: ([•], [◦], [‣]))
  
  // DTU-branded title page
  align(center)[
    // DTU Logo representation
    #image("misc/dtu-logo-cmyk.png", width: 25%)
    #v(6mm)
    
    #block(spacing: 1.8em)[
      #text(size: 26pt, weight: "bold", fill: dtu-red)[#title]
    ]
    
    #block(spacing: 1.2em)[
      #text(size: 18pt, fill: dtu-blue, weight: "bold")[#course]
      #if course-name != "" [
        #linebreak()
        #text(size: 14pt, fill: dtu-dark-blue, weight: "medium")[#course-name]
      ]
    ]
    
    #v(1.5em)
    
    #grid(
      columns: 2,
      column-gutter: 3em,
      align: center,
      [
        #text(size: 12pt, fill: dtu-black)[
          *Date:* #date.display("[day] [month repr:long] [year]")
        ]
      ],
      [
        #if semester != "" [
          #text(size: 12pt, fill: dtu-black)[
            *Semester:* #semester
          ]
        ]
      ]
    )
    
    #if author != "" [
      #v(2em)
      #text(size: 12pt, fill: dtu-black, weight: "medium")[#author]
    ]
    
    #v(1em)
    #line(length: 80%, stroke: 1pt + dtu-gray)
  ]
  
  pagebreak()
  
  // Content
  body
}

#let dtu-assignment(
  course: "",
  course-name: "",
  title: "",
  due-date: datetime.today(),
  author: "",
  semester: "",
  body
) = {
  // Page setup (consistent with notes)
  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 2cm),
    header: context {
      let page-number = counter(page).display()
      if page-number != "1" {
        grid(
          columns: (auto, 1fr, auto),
          align: (left, center, right),
          column-gutter: 1em,
          [
            #rect(
              width: 1.2cm,
              height: 0.4cm,
              fill: dtu-red,
              radius: 1pt,
              stroke: none,
              align(center + horizon)[
                #text(size: 8pt, weight: "bold", fill: white)[DTU]
              ]
            )
          ],
          [#text(size: 9pt, fill: dtu-black)[#course - #title]],
          [#text(size: 9pt, fill: dtu-black)[Page #page-number]]
        )
        v(-0.2em)
        line(length: 100%, stroke: 0.5pt + dtu-gray)
      }
    },
    footer: context {
      let page-number = counter(page).display()
      if page-number != "1" {
        align(center)[
          #text(size: 8pt, fill: dtu-gray)[
            Technical University of Denmark
          ]
        ]
      }
    }
  )
  
  // Typography (same as notes)
  set text(
    font: ("Neo Sans", "Arial", "Liberation Sans", "Helvetica Neue", "Helvetica"),
    size: 11pt,
    lang: "en"
  )
  
  set par(
    justify: true,
    leading: 0.65em,
  )
  
  // Math
  set math.equation(numbering: "(1)")
  
  // Problem numbering
  set enum(numbering: "1.a.i.")
  
  // DTU Assignment header
  align(center)[
    #grid(
      columns: (auto, 1fr, auto),
      align: (left, center, right),
      column-gutter: 1em,
      [
        #image("misc/dtu-logo-cmyk.png", width: 25%)
      ],
      [],
      [
        #text(size: 10pt, fill: dtu-black, weight: "medium")[
          #semester Semester
        ]
      ]
    )
    
    #v(1.5em)
    
    #block(spacing: 1.5em)[
      #text(size: 22pt, weight: "bold", fill: dtu-red)[#title]
    ]
    
    #text(size: 16pt, fill: dtu-blue, weight: "bold")[#course]
    #if course-name != "" [
      #linebreak()
      #text(size: 13pt, fill: dtu-dark-blue, weight: "medium")[#course-name]
    ]
    
    #v(1.2em)
    
    #grid(
      columns: 2,
      column-gutter: 3em,
      align: center,
      [
        #if author != "" [
          #text(size: 11pt, fill: dtu-black)[*Student:* #author]
        ]
      ],
      [
        #text(size: 11pt, fill: dtu-black)[*Due:* #due-date.display("[day] [month repr:short] [year]")]
      ]
    )
  ]
  
  line(length: 100%, stroke: 1.5pt + dtu-red)
  
  v(2em)
  
  // Content
  body
}
