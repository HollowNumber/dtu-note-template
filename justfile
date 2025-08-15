# DTU Template Development Justfile
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

# Setup development environment
setup:
    @echo "Setting up development environment..."
    @powershell -Command "if (!(Test-Path 'test-output')) { New-Item -ItemType Directory -Path 'test-output' | Out-Null }"
    @typst --version
    @echo "Setup complete!"

# Validate package structure
validate:
    @echo "Validating package structure..."
    @powershell -Command "if (!(Test-Path 'typst.toml')) { Write-Error 'Missing typst.toml'; exit 1 }"
    @powershell -Command "if (!(Test-Path 'src/lib.typ')) { Write-Error 'Missing src/lib.typ'; exit 1 }"
    @powershell -Command "if (!(Test-Path 'src/assets/dtu-logo-cmyk.png')) { Write-Error 'Missing DTU logo'; exit 1 }"
    @echo "Package structure valid!"

# Clean generated files
clean:
    @echo "Cleaning generated files..."
    @powershell -Command "if (Test-Path 'test-output') { Remove-Item -Recurse -Force 'test-output' }"
    @echo "Clean complete!"

# Compile example documents
examples: setup
    @echo "Compiling examples..."
    @typst compile --root . "examples/note-example.typ" "test-output/note-example.pdf"
    @typst compile --root . "examples/assignment-example.typ" "test-output/assignment-example.pdf"
    @echo "Examples compiled to test-output/"

# Test template compilation
test: setup validate
    @echo "Testing template compilation..."
    @echo "#import \"../src/lib.typ\": dtu-note" > test-output/test.typ
    @echo "" >> test-output/test.typ  
    @echo "#show: dtu-note.with(course: \"TEST\", title: \"Test\")" >> test-output/test.typ
    @echo "" >> test-output/test.typ
    @echo "= Test" >> test-output/test.typ
    @echo "This is a test." >> test-output/test.typ
    @typst compile --root . "test-output/test.typ" "test-output/test.pdf"
    @echo "Test compilation successful!"

# Development workflow
dev: setup validate examples
    @echo "Development environment ready!"
    @echo "Examples compiled. Edit files and run 'just examples' to recompile."
