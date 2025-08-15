# DTU Template Development Justfile
# Cross-platform recipes for Windows, macOS, and Linux
# Requires: just (command runner) and typst (typesetting system)
# Usage: just <recipe>

# Default recipe - show help
default:
    @just help

# Show available commands
help:
    @echo "DTU Template Development Commands:"
    @echo ""
    @echo "Development:"
    @echo "  setup     - Create test directory and validate dependencies"
    @echo "  dev       - Development workflow (setup + examples)"  
    @echo "  test      - Test template compilation"
    @echo "  clean     - Clean generated files"
    @echo ""
    @echo "Examples:"
    @echo "  examples  - Compile all example documents"
    @echo ""
    @echo "Validation:"
    @echo "  validate  - Check package structure"
    @echo ""
    @echo "Platform: Cross-platform (Windows/macOS/Linux)"

# Setup development environment (cross-platform)
setup:
    @echo "Setting up development environment..."
    @mkdir -p test-output
    @typst --version
    @echo "Setup complete!"

# Validate package structure (cross-platform)
validate:
    @echo "Validating package structure..."
    @test -f typst.toml || (echo "Error: Missing typst.toml" && exit 1)
    @test -f src/lib.typ || (echo "Error: Missing src/lib.typ" && exit 1)
    @test -f src/misc/dtu-logo-cmyk.png || (echo "Error: Missing DTU logo" && exit 1)
    @echo "Package structure valid!"

# Clean generated files (cross-platform)
clean:
    @echo "Cleaning generated files..."
    @rm -rf test-output
    @echo "Clean complete!"

# Compile example documents
examples: setup
    @echo "Compiling examples..."
    @typst compile --root . "examples/note-example.typ" "test-output/note-example.pdf"
    @typst compile --root . "examples/assignment-example.typ" "test-output/assignment-example.pdf"
    @echo "Examples compiled to test-output/"

# Test template compilation (cross-platform)
test: setup validate
    @echo "Testing template compilation..."
    @echo '#import "../src/lib.typ": dtu-note' > test-output/test.typ
    @echo '' >> test-output/test.typ  
    @echo '#show: dtu-note.with(course: "TEST", title: "Test")' >> test-output/test.typ
    @echo '' >> test-output/test.typ
    @echo '= Test' >> test-output/test.typ
    @echo 'This is a test.' >> test-output/test.typ
    @typst compile --root . "test-output/test.typ" "test-output/test.pdf"
    @echo "Test compilation successful!"

# Development workflow
dev: setup validate examples
    @echo "Development environment ready!"
    @echo "Examples compiled. Edit files and run 'just examples' to recompile."
