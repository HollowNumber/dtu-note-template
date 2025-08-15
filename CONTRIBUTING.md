# Contributing to DTU Template

Thank you for your interest in contributing to the DTU Template project! This document provides guidelines and information for contributors.

## How to Contribute

### Reporting Issues

If you find a bug or have a suggestion for improvement:

1. **Search existing issues** to avoid duplicates
2. **Create a new issue** with:
   - Clear, descriptive title
   - Detailed description of the problem
   - Steps to reproduce (for bugs)
   - Expected vs actual behavior
   - Typst version and operating system
   - Example code that demonstrates the issue

### Submitting Changes

1. **Fork the repository** on GitHub
2. **Create a feature branch** from `main`:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes** following the guidelines below
4. **Test your changes** thoroughly
5. **Commit your changes** with clear, descriptive messages
6. **Push to your fork** and submit a pull request

## Development Guidelines

### Development Workflow

This project uses [Just](https://github.com/casey/just) for task automation. The typical development workflow is:

```bash
# 1. Setup development environment
just setup

# 2. Start development mode (watches for changes)
just dev

# 3. Run tests before committing
just check

# 4. Install locally for testing
just install-local
```

**Available Just Commands:**

- `just --list` - Show all available commands
- `just examples` - Compile all example documents
- `just test` - Run comprehensive tests
- `just lint` - Check code quality
- `just watch` - Watch for file changes and recompile
- `just package` - Create release package
- `just ci` - Simulate CI pipeline

### Code Style

- Use **2-space indentation** for Typst files
- Follow existing naming conventions (kebab-case for functions, snake_case for variables)
- Add comments for complex logic
- Keep lines under 100 characters when possible

### Template Structure

```
0.1.0/
├── typst.toml          # Package configuration
├── src/
│   ├── lib.typ         # Main library file
│   └── misc/
│       └── *.png       # Assets (logos, images)
└── lib.typ             # Root library file (mirrors src/lib.typ)
```

### Adding New Features

#### New Content Boxes

When adding new content box types:

```typst
#let my-new-box(content) = {
  rect(
    width: 100%,
    inset: 1.2em,
    fill: rgb("#f0f8ff"),        // Light background
    stroke: (left: 4pt + dtu-blue),  // DTU color accent
    radius: (right: 3pt),
    [
      #text(weight: "bold", fill: dtu-blue, size: 12pt)[Box Title]
      #v(0.3em)
      #content
    ]
  )
}
```

#### New Template Types

For new document templates, follow the existing pattern:

```typst
#let dtu-my-template(
  course: "",
  title: "",
  author: "",
  // other parameters...
  body
) = {
  // Page setup
  set page(...)

  // Typography
  set text(...)

  // Title page content
  // ...

  // Body content
  body
}
```

### Testing

### Testing

Before submitting changes:

1. **Install Just** (if not already installed):

   ```bash
   # Windows
   choco install just
   # or
   scoop install just
   ```

2. **Run comprehensive tests**:

   ```bash
   # Run all tests and checks
   just check

   # Or run specific test suites
   just test           # All tests
   just examples       # Compile examples
   just test-features  # Test all content boxes
   just lint           # Code quality checks
   ```

3. **Test compilation** manually if needed:

   ```bash
   typst compile examples/note-example.typ
   typst compile examples/assignment-example.typ
   ```

4. **Create test cases** for new features

5. **Verify visual appearance** matches DTU design guidelines

6. **Install locally for testing**:

   ```bash
   just install-local
   ```

7. **Test with different Typst versions** if possible

### Documentation

- Update README.md if adding new features
- Add examples demonstrating new functionality
- Update CHANGELOG.md for significant changes
- Include inline documentation for complex functions

## DTU Design Guidelines

When contributing, ensure compliance with [DTU Design Guide 2018](https://www.designguide.dtu.dk/):

### Colors

- Use only official DTU colors defined in the template
- Primary: DTU Red (#990000), White, Black
- Secondary: Blue, Green, Dark Blue, etc. (see existing definitions)

### Typography

- Neo Sans is the primary DTU font
- Arial/Helvetica as fallbacks
- Consistent font sizes and weights

### Layout

- Maintain proper margins and spacing
- Use DTU logo appropriately
- Follow hierarchy conventions

## Pull Request Guidelines

### Before Submitting

- [ ] Code follows the style guidelines
- [ ] All tests pass
- [ ] Documentation is updated
- [ ] Changes are backwards compatible (or breaking changes are justified)
- [ ] Commit messages are clear and descriptive

### Pull Request Template

Please include:

1. **Description** of changes
2. **Motivation** and context
3. **Testing** performed
4. **Screenshots** (for visual changes)
5. **Breaking changes** (if any)

### Review Process

1. Automated tests must pass
2. At least one maintainer review required
3. Documentation and examples should be updated
4. Changes should align with DTU design guidelines

## Community Guidelines

### Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/). Please be respectful and inclusive.

### Communication

- **GitHub Issues**: Bug reports, feature requests
- **Pull Requests**: Code contributions, discussions
- **Discussions**: General questions, ideas

## Getting Help

If you need help contributing:

1. Check existing documentation and examples
2. Search through past issues and discussions
3. Create a new issue with the "question" label
4. Be specific about what you're trying to achieve

## Recognition

Contributors will be:

- Listed in the README.md contributors section
- Mentioned in release notes for significant contributions
- Given credit in the package metadata

## License

By contributing to this project, you agree that your contributions will be licensed under the MIT License.

---

Thank you for helping make the DTU Template better for everyone! 🚀
