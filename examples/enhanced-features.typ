#import "../src/lib.typ": dtu-note, code-block, dtu-table, dtu-quote, alert, dtu-color

#show: dtu-note.with(
  course: "02101",
  course-name: "Enhanced Template Features",
  title: "Advanced DTU Template Demo",
  author: "Template Developer",
  date: datetime.today()
)

= Enhanced Content Features

== Code Blocks

#code-block(caption: "Fibonacci function implementation")[
```python
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

print(fibonacci(10))
```
]

== Enhanced Tables

#dtu-table(
  columns: 3,
  [*Course*], [*Credits*], [*Grade*],
  [02101], [5], [A],
  [02102], [5], [B+],
  [02105], [10], [A-],
  caption: "Course Overview"
)

== Alert Components

#alert(
  [This is an informational message with the default blue styling.],
  type: "info"
)

#alert(
  [This is a warning message that draws attention.],
  type: "warning"
)

#alert(
  [This indicates a successful operation.],
  type: "success"
)

#alert(
  [This indicates an error that needs attention.],
  type: "error"
)

== Quotes

#dtu-quote(
  [The best way to predict the future is to create it.],
  author: "Peter Drucker",
  source: "Management Theory"
)

== Color Helper Function

You can now access DTU colors programmatically:

- Primary red: #rect(fill: dtu-color("red"), width: 2em, height: 1em)
- DTU blue: #rect(fill: dtu-color("blue"), width: 2em, height: 1em)
- Success green: #rect(fill: dtu-color("green"), width: 2em, height: 1em)

= Next Steps

These enhancements make the template more versatile for academic and professional documents while maintaining the DTU brand identity.
