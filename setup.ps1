# DTU Template Development Setup
# This script helps set up the development environment

Write-Host "🚀 Setting up DTU Template development environment..." -ForegroundColor Green

# Check if Typst is installed
Write-Host "Checking Typst installation..." -ForegroundColor Yellow
try {
    $typstVersion = & typst --version
    Write-Host "✅ Typst found: $typstVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Typst not found. Please install Typst first:" -ForegroundColor Red
    Write-Host "   Visit: https://github.com/typst/typst/releases" -ForegroundColor Yellow
    exit 1
}

# Check if Just is installed
Write-Host "Checking Just installation..." -ForegroundColor Yellow
try {
    $justVersion = & just --version
    Write-Host "✅ Just found: $justVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Just not found. Installing Just..." -ForegroundColor Yellow
    
    # Try to install via different package managers
    $installed = $false
    
    # Try Chocolatey first
    try {
        & choco --version | Out-Null
        Write-Host "Installing Just via Chocolatey..." -ForegroundColor Yellow
        & choco install just -y
        $installed = $true
    } catch {
        Write-Host "Chocolatey not available" -ForegroundColor Yellow
    }
    
    # Try Scoop if Chocolatey failed
    if (-not $installed) {
        try {
            & scoop --version | Out-Null
            Write-Host "Installing Just via Scoop..." -ForegroundColor Yellow
            & scoop install just
            $installed = $true
        } catch {
            Write-Host "Scoop not available" -ForegroundColor Yellow
        }
    }
    
    # If both failed, provide manual instructions
    if (-not $installed) {
        Write-Host "❌ Could not install Just automatically." -ForegroundColor Red
        Write-Host "Please install Just manually:" -ForegroundColor Yellow
        Write-Host "  1. Download from: https://github.com/casey/just/releases" -ForegroundColor Yellow
        Write-Host "  2. Extract just.exe to a directory in your PATH" -ForegroundColor Yellow
        Write-Host "  3. Or install a package manager (Chocolatey/Scoop) first" -ForegroundColor Yellow
        exit 1
    }
}

# Create test output directory
Write-Host "Creating test output directory..." -ForegroundColor Yellow
if (!(Test-Path "test-output")) {
    New-Item -ItemType Directory -Path "test-output" | Out-Null
    Write-Host "✅ Created test-output directory" -ForegroundColor Green
} else {
    Write-Host "✅ test-output directory already exists" -ForegroundColor Green
}

# Test Just commands
Write-Host "Testing Just setup..." -ForegroundColor Yellow
try {
    & just --list | Out-Host
    Write-Host "✅ Just setup successful!" -ForegroundColor Green
} catch {
    Write-Host "❌ Just setup failed. Please check the installation." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "🎉 Development environment setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  just examples  # Compile example documents" -ForegroundColor Cyan
Write-Host "  just test      # Run all tests" -ForegroundColor Cyan
Write-Host "  just dev       # Start development workflow" -ForegroundColor Cyan
Write-Host "  just --list    # See all available commands" -ForegroundColor Cyan
