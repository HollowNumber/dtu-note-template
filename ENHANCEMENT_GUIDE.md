# DTU Template Enhancement & Publishing Guide

## 🚀 Current Enhancements Added

### 1. **Enhanced Code Blocks with `codelst`**

- Syntax highlighting for multiple languages
- Optional line numbering
- Code captions
- Consistent DTU styling

### 2. **Additional Academic Components**

- Enhanced tables with styling
- Quote blocks
- Alert boxes (info, warning, success, error)
- Color utilities

## 📋 Library Enhancement Opportunities

### **Immediate Improvements**

1. **Better Code Block Features**

   ````typst
   #code-block(line-numbers: true, caption: "Advanced Example")[
   ```python
   # Your code here
   ````

   ]

   ```

   ```

2. **Figure Management**

   - Add `dtu-figure()` function
   - Automatic numbering
   - Cross-references

3. **Bibliography Integration**

   - Citation styles
   - Reference formatting

4. **Math Enhancements**
   - Theorem environments
   - Proof blocks
   - Custom equation numbering

### **Advanced Features to Add**

1. **Modular Architecture**

   ```
   src/
   ├── lib.typ          # Main exports
   ├── colors.typ       # Color definitions
   ├── layouts.typ      # Page layouts
   ├── components.typ   # Content components
   ├── math.typ         # Math utilities
   └── utils.typ        # Helper functions
   ```

2. **Configuration System**

   ```typst
   #let dtu-config = (
     language: "en",
     font-family: "Neo Sans",
     color-theme: "default",
     numbering-style: "1.1.1"
   )
   ```

3. **Template Variants**

   - Thesis template
   - Presentation slides
   - Lab reports
   - Exam templates

4. **Internationalization**
   - Danish language support
   - Multi-language headings
   - Locale-aware formatting

## 📦 How to Properly Publish

### **1. Version Management**

Update version in `typst.toml`:

```toml
[package]
name = "dtu-template"
version = "0.2.0"  # Semantic versioning
entrypoint = "src/lib.typ"
authors = ["Your Name"]
description = "Enhanced DTU template with code highlighting and academic components"
```

### **2. Release Process**

1. **Prepare Release**:

   ```bash
   # Update version in typst.toml
   # Update CHANGELOG.md
   # Test all features
   just test
   just examples
   ```

2. **Create GitHub Release**:

   - Tag: `v0.2.0` (matching typst.toml version)
   - Title: "Enhanced DTU Template v0.2.0"
   - Description: List of new features and changes
   - The publish workflow will automatically run

3. **Package Structure Created**:
   ```
   dtu-template/
   ├── typst.toml                    # Package config
   └── 0.2.0/                       # Version directory
       ├── lib.typ                   # Main library
       └── misc/                     # Assets
           └── dtu-logo-cmyk.png
   ```

### **3. Distribution Options**

#### **Option A: GitHub Releases**

- Automatic via workflow
- Creates `.tar.gz` archive
- Ready for manual distribution

#### **Option B: Typst Universe** (Manual)

1. Visit https://typst.app/universe/submit
2. Enter repository URL
3. Specify release tag
4. Submit for review

#### **Option C: Local Installation**

Users can install directly:

```bash
# From GitHub
typst init @github/HollowNumber/dtu-note-template

# Or clone and install locally
git clone https://github.com/HollowNumber/dtu-note-template
```

### **4. Documentation**

Essential documentation to add:

- API reference for all functions
- Usage examples for each component
- Migration guide for breaking changes
- Contributing guidelines

### **5. Testing Strategy**

Add comprehensive tests:

```bash
# Current
just test      # Basic compilation
just examples  # Example documents

# Enhanced testing needed
just test-all-features
just test-compatibility
just test-performance
```

## 🎯 Recommended Next Steps

1. **Add figure management functions**
2. **Create thesis template variant**
3. **Add bibliography support**
4. **Implement configuration system**
5. **Add comprehensive documentation**
6. **Set up automated testing**

The current structure with the publish workflow makes it easy to release new versions - just update the version in `typst.toml` and create a GitHub release!
