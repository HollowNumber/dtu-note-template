---
name: Bug report
about: Create a report to help us improve the template
title: "[BUG] "
labels: ["bug"]
assignees: ""
---

**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:

1. Create a document with '...'
2. Use template function '....'
3. Compile with '....'
4. See error

**Expected behavior**
A clear and concise description of what you expected to happen.

**Minimal example**
Please provide a minimal Typst document that reproduces the issue:

```typst
#import "@local/dtu-template:0.1.0": dtu-note

#show: dtu-note.with(
  course: "02101",
  title: "Test Document"
)

= Test
This causes the problem...
```

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Environment (please complete the following information):**

- OS: [e.g. Windows 11, macOS 14, Ubuntu 22.04]
- Typst Version: [e.g. 0.11.0]
- Template Version: [e.g. 0.1.0]

**Additional context**
Add any other context about the problem here.
