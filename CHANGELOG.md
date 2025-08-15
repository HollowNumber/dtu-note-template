# Changelog

All notable changes to the DTU Template project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Removed built-in course database functionality
- Template now integrates with [dtu-notes](https://github.com/HollowNumber/dtu-notes) CLI for course management

### Planned

- Additional content box styles
- Support for multi-language documents
- Extended integration with dtu-notes CLI
- Custom color theme support

## [0.1.0] - 2024-03-15

### Added

- Initial release of DTU Template package
- `dtu-note` template for lecture notes and study materials
- `dtu-assignment` template for homework and projects
- Official DTU color scheme implementation
- Styled content boxes: `definition`, `theorem`, `example`, `important`, `note-box`, `dtu-highlight`
- Professional headers and footers with DTU branding
- DTU logo integration (CMYK version)
- Mathematical equation styling and numbering
- Consistent typography following DTU design guidelines
- Support for Neo Sans font family (with Arial fallback)

### Package Structure

- `typst.toml` - Package configuration
- `src/lib.typ` - Main template library
- `src/misc/dtu-logo-cmyk.png` - Official DTU logo
- Examples and documentation

### Features

- **Templates**: Note-taking and assignment templates
- **Colors**: All official DTU primary and secondary colors
- **Typography**: DTU-compliant font choices and sizing
- **Content Boxes**: Six different styled content types
- **CLI Integration**: Designed for use with dtu-notes Rust CLI
- **Responsive Design**: Proper page margins and spacing
- **Professional Headers**: Consistent branding across pages

### Documentation

- Comprehensive README with usage examples
- Example documents demonstrating all features
- Installation and setup instructions
- Contributing guidelines

### Technical

- Compatible with Typst 0.11.0+
- Proper package structure following Typst conventions
- Clean, modular code organization
- Extensive inline documentation
