// templates/dtu-template/lib.typ
// Unofficial DTU-themed template following DTU Design Guide 2018

// Official DTU Colors from designguide.dtu.dk
#let dtu-red = rgb("#990000")        // Primary DTU Red
#let dtu-white = rgb("#ffffff")      // Primary White
#let dtu-black = rgb("#000000")      // Primary Black

// Secondary DTU Colors
#let dtu-blue = rgb("#2F3EEA")       // Bright Blue
#let dtu-green = rgb("#1FD082")      // Bright Green
#let dtu-dark-blue = rgb("#030F4F")  // Dark Blue
#let dtu-yellow = rgb("#F6D04D")     // Yellow
#let dtu-orange = rgb("#FC7634")     // Orange
#let dtu-salmon = rgb("#F7BBB1")     // Salmon/Light Pink
#let dtu-gray = rgb("#DADADA")       // Gray
#let dtu-coral = rgb("#E83F48")      // Coral
#let dtu-dark-green = rgb("#008835") // Dark Green
#let dtu-purple = rgb("#79238E")     // Purple

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

// DTU-themed content boxes following design guidelines
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
      #text(weight: "bold", fill: dtu-coral, size: 12pt)[⚠ Important]
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
      #text(fill: dtu-dark-blue, size: 10pt)[📝 ] #content
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

// Course information database for DTU (expanded with official course codes)
#let dtu-courses = (
  // Mathematics and Computer Science
  "01005": "Advanced Engineering Mathematics 1",
  "01006": "Advanced Engineering Mathematics 2",
  "01017": "Discrete Mathematics",
  "01035": "Mathematics 1",
  "01037": "Mathematics 2", 
  "02101": "Introduction to Programming",
  "02102": "Algorithms and Data Structures",
  "02105": "Algorithms and Data Structures 1",
  "02110": "Algorithms and Data Structures 2",
  "02157": "Functional Programming",
  "02158": "Concurrent Programming",
  "02159": "Operating Systems",
  "02180": "Introduction to Artificial Intelligence",
  "02201": "Introduction to Mathematical Software",
  "02393": "Programming in C++",
  "02450": "Introduction to Machine Learning and Data Mining",
  
  // Physics and Engineering
  "10020": "Introduction to Numerical Methods",
  "10333": "Fluid Mechanics 1",
  "22100": "Electronics 1",
  "22101": "Electronics 2",
  "25100": "Introduction to Quantum Physics",
  "25200": "Classical Physics 1",
  "25201": "Classical Physics 2",
  "28000": "Introduction to Nano and Micro Technology",
  "31001": "Electromagnetics",
  "31002": "Electric Circuit Analysis",
  
  // Chemistry and Materials Science
  "28230": "Materials and Manufacturing",
  "28240": "Materials, Technology and Society",
  "28350": "Surface Engineering",
  
  // Civil and Mechanical Engineering  
  "11034": "Statics and Strength of Materials",
  "11035": "Dynamics",
  "42101": "Intro to Building Design",
  "42435": "Advanced Structural Analysis",
  
  // Biotechnology and Chemical Engineering
  "27002": "Life Science",
  "27003": "Molecular Biotechnology",
  "28330": "Chemical and Bio Process Engineering",
  
  // Environmental Engineering
  "12100": "Quantitative Sustainability Analysis",
  "12132": "Environmental Chemistry and Microbiology",
  
  // Add more as needed...
)

#let get-course-name(course-code) = {
  dtu-courses.at(course-code, default: "")
}