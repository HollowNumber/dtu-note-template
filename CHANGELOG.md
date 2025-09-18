# Changelog

All notable changes to the DTU Template project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned

- Additional content box styles
- Support for multi-language documents
- Extended integration with dtu-notes CLI
- Custom color theme support

## [0.4.3] - 2025-09-18

- **Bug fix**: Fixed the compilation warning saying invalid font `sans-serif`
- **Removed**: Artifact file

## [0.4.2] - 2025-09-11

- **Bug fix**: Fixed typo in `.noter.config.toml` that causes variants to not properly be imported.

## [0.4.1] - 2025-08-22

- **Bug Fixes**: Fixed typo in `.noter.config.toml` that would cause it to not compile

## [0.4.0] - 2025-08-21

- **Enhanced CLI Integration**: Full integration configuration for DTU Notes CLI
- **Template Variants System**: Support for course-specific template variations
- **Improved Documentation**: Better examples and usage instructions

## Added

- **Programming assignment

### Changed

- **Configuration Format**: Updated `.noter.config.toml` to version 0.4.0 format

## [0.3.0] - 2025-08-15

### Added

- **Modular Architecture**: Complete reorganization into logical folders
  - `src/components/` - Academic and visual components split into submodules
  - `src/styles/` - Spacing and typography utilities
  - `src/helpers/` - Layout and content management utilities
  - `src/layouts/` - Individual layout files with better organization
  - `src/assets/` - Renamed from `misc/` for better clarity
- **Enhanced Component System**:
  - `academic.typ`: definitions, theorems, examples
  - `visual.typ`: boxes, highlights, visual elements
- **Styling System**:
  - `spacing.typ`: consistent spacing helpers and constants
  - `typography.typ`: text styling and emphasis utilities
- **Layout Helpers**:
  - `layout.typ`: grid, column, and layout utilities
  - `content.typ`: figure, list, and content helpers
- **Documentation & Metadata**:
  - `VERSION.typ`: centralized version management
  - `src/README.md`: comprehensive architecture documentation
- **Just Task Runner Integration**: Cross-platform development workflow
- **GitHub Actions CI/CD**: Automated testing and release pipeline
- **Enhanced Examples**: Updated examples showcasing new features

### Changed

- **Breaking**: Reorganized folder structure for better maintainability
- **Asset Path**: Moved logo from `misc/` to `assets/` folder
- **Import Structure**: New modular imports available (backward compatible)
- **Build System**: Integrated Just task runner for development workflow

### Fixed

- Cross-platform font compatibility with robust fallbacks
- Asset path resolution in CI/CD environments
- Layout template organization and modularity

### Deprecated

- Legacy single-file modules (`components.typ`, `utils.typ`) - still functional for backward compatibility

## [0.2.0] - 2025-08-15

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
