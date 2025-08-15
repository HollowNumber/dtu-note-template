# DTU Note Template

A professional Typst template package for Danish Technical University (DTU) students and staff, designed to follow the official DTU Design Guide 2018.

## Features

- **Official DTU Branding**: Uses official DTU colors and design elements
- **Multiple Document Types**: Support for notes and assignments
- **Professional Typography**: Neo Sans font (with Arial fallback) following DTU guidelines
- **Styled Content Boxes**: Definitions, theorems, examples, important notes, and highlights
- **Header/Footer**: Professional headers and footers with DTU branding
- **Mathematical Styling**: Proper equation numbering and formatting
- **CLI Integration**: Designed to work with [dtu-notes](https://github.com/HollowNumber/dtu-notes) Rust CLI

## Installation

### From the Typst Universe (Recommended)

```bash
typst install dtu-template
```

### Manual Installation

1. Download the latest release
2. Extract to your local Typst packages directory:
   - **Windows**: `%APPDATA%/typst/packages/local/dtu-template/0.1.0/`
   - **macOS**: `~/Library/Application Support/typst/packages/local/dtu-template/0.1.0/`
   - **Linux**: `~/.local/share/typst/packages/local/dtu-template/0.1.0/`

## Usage

### Notes Template

```typst
#import "@local/dtu-template:0.1.0": dtu-note

#show: dtu-note.with(
  course: "02101",
  course-name: "Introduction to Programming",
  title: "Lecture 5: Data Structures",
  date: datetime(year: 2024, month: 3, day: 15),
  author: "Your Name",
  semester: "Spring 2024"
)

= Introduction
This is your content...

== Subsection
More content here...
```

> **Note**: For enhanced workflow with automatic course name resolution and project management, consider using the [dtu-notes](https://github.com/HollowNumber/dtu-notes) CLI tool.

### Assignment Template

```typst
#import "@local/dtu-template:0.1.0": dtu-assignment

#show: dtu-assignment.with(
  course: "02102",
  course-name: "Algorithms and Data Structures",
  title: "Assignment 3",
  due-date: datetime(year: 2024, month: 4, day: 1),
  author: "Your Name",
  semester: "Spring 2024"
)

= Problem 1
Solve the following...
```

> **Tip**: The [dtu-notes](https://github.com/HollowNumber/dtu-notes) CLI can automatically generate templates with course information.

### Content Boxes

The template provides several styled content boxes:

```typst
#import "@local/dtu-template:0.1.0": definition, theorem, example, important, note-box, dtu-highlight

#definition("Algorithm", [
  A step-by-step procedure for solving a problem.
])

#theorem(name: "Fundamental Theorem", [
  Every integer greater than 1 is either prime or composite.
])

#example([
  Here's how to implement a binary search...
])

#important([
  Remember to handle edge cases!
])

#note-box([
  This is a helpful note for later reference.
])

#dtu-highlight([
  Key concept that will be important for the exam.
])
```

## Available Templates

### `dtu-note`

Perfect for lecture notes, study materials, and academic documentation.

**Parameters:**

- `course`: Course code (e.g., "02101")
- `course-name`: Full course name (optional, can be auto-filled from course code)
- `title`: Document title
- `date`: Date of the document
- `author`: Your name
- `semester`: Academic semester

### `dtu-assignment`

Designed for homework, projects, and assignments.

**Parameters:**

- `course`: Course code
- `course-name`: Full course name (optional)
- `title`: Assignment title
- `due-date`: Assignment due date
- `author`: Student name
- `semester`: Academic semester

## DTU Colors

The template includes all official DTU colors:

- **Primary Colors**: DTU Red (#990000), White, Black
- **Secondary Colors**: Blue (#2F3EEA), Green (#1FD082), Dark Blue (#030F4F), Yellow (#F6D04D), Orange (#FC7634), Salmon (#F7BBB1), Gray (#DADADA), Coral (#E83F48), Dark Green (#008835), Purple (#79238E)

## CLI Integration

This template is designed to work seamlessly with the [dtu-notes](https://github.com/HollowNumber/dtu-notes) Rust CLI tool, which provides:

- Automatic course name resolution from DTU course codes
- Project initialization and management
- Template generation with pre-filled course information
- Integration with DTU course database

## Examples

Check the `examples/` directory for complete document samples:

- Basic note template
- Assignment with multiple problems
- Advanced formatting examples

## Requirements

- Typst 0.11.0 or later
- DTU logo file (included in package)

## Contributing

Contributions are welcome! Please feel free to:

1. Report bugs or request features via GitHub Issues
2. Submit pull requests for improvements
3. Enhance template functionality and styling
4. Improve documentation

## Development

To work on this template:

```bash
git clone https://github.com/HollowNumber/dtu-note-template.git
cd dtu-note-template
```

### Development Pipeline with Just

This project uses [Just](https://github.com/casey/just) for task automation.

#### Quick Setup

Run the setup script to install dependencies automatically:

```powershell
# Windows PowerShell
.\setup.ps1
```

#### Manual Setup

1. **Install Typst** (if not already installed):

   ```bash
   # Download from: https://github.com/typst/typst/releases
   ```

2. **Install Just**:

   ```bash
   # Windows (Chocolatey)
   choco install just

   # Windows (Scoop)
   scoop install just

   # Manual installation:
   # Download from: https://github.com/casey/just/releases
   ```

#### Common Development Tasks

```bash
# List all available commands
just --list

# Run all tests and checks
just check

# Compile all example documents
just examples

# Start development workflow (compile + watch for changes)
just dev

# Install template locally for testing
just install-local

# Run CI simulation
just ci

# Prepare for release
just pre-release
```

#### Development Workflow

1. **Setup**: `just setup` - Prepares development environment
2. **Development**: `just dev` - Starts watch mode with automatic recompilation
3. **Testing**: `just test` - Runs comprehensive tests
4. **Quality**: `just lint` - Checks code quality and consistency
5. **Package**: `just package` - Creates release package

#### File Structure for Development

```
dtu-note-template/
├── justfile              # Development automation
├── 0.1.0/               # Typst package
│   ├── typst.toml       # Package config
│   ├── src/lib.typ      # Main template
│   └── src/misc/        # Assets
├── examples/            # Example documents
├── test-output/         # Generated during testing
└── .github/workflows/   # CI/CD automation
```

Test your changes locally by symlinking to your local packages directory or using the `--root` flag with Typst.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## Disclaimer

This is an unofficial template. While it follows DTU's official design guidelines, it is not endorsed by DTU. The DTU logo is used under educational fair use.

## Acknowledgments

- Danish Technical University for the design guidelines
- The Typst team for the excellent typesetting system
- Contributors who helped improve this template

---

**Technical University of Denmark**  
_Developed by students, for students_
