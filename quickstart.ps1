# Abu Dhabi AI PropTech Challenge — one command to a running AI agent (Windows).
#
#   powershell -ExecutionPolicy Bypass -File .\quickstart.ps1
#
# Creates a local virtualenv, installs the few dependencies, and runs the
# land-intelligence example end to end. No API keys needed.
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

function Fail-WithHelp($msg) {
    Write-Host ""
    Write-Host "X $msg"
    Write-Host ""
    Write-Host "Windows fallback — if setup keeps fighting you, don't lose time:"
    Write-Host "  - GitHub Codespaces (zero local setup): open this repo -> Code -> Codespaces"
    Write-Host "  - Google Colab: upload the notebook in notebooks\ and run there"
    Write-Host "  - WSL: 'wsl --install', then use the bash quickstart (./quickstart.sh)"
    Write-Host "  - Long-path errors? Run as admin: 'git config --system core.longpaths true'"
    Write-Host "  - Stuck? Ask in Discord #help-desk: https://discord.gg/jy3QDxQ3jK"
    exit 1
}

# Find a real Python 3.10+ (the Microsoft Store stub fails this check safely)
$python = $null
$pyargs = @()
foreach ($candidate in @("py", "python", "python3")) {
    if (Get-Command $candidate -ErrorAction SilentlyContinue) {
        $candidateArgs = if ($candidate -eq "py") { @("-3") } else { @() }
        try {
            $ok = & $candidate @candidateArgs -c "import sys; print(1 if sys.version_info >= (3,10) else 0)" 2>$null
            if ("$ok".Trim() -eq "1") { $python = $candidate; $pyargs = $candidateArgs; break }
        } catch {}
    }
}
if (-not $python) {
    Fail-WithHelp "Python 3.10+ not found. Install it from https://python.org (tick 'Add Python to PATH') and retry."
}

Write-Host "- Creating virtualenv (.venv)..."
& $python @pyargs -m venv .venv
if ($LASTEXITCODE -ne 0) { Fail-WithHelp "Could not create the virtualenv." }

# Absolute path to the venv's Python — a relative path breaks once we change
# directory into the example, and pwsh won't resolve "..\..\.venv\..." as a program.
$venvPy = Join-Path $PSScriptRoot ".venv\Scripts\python.exe"
if (-not (Test-Path $venvPy)) { Fail-WithHelp "Virtualenv Python not found at $venvPy." }

Write-Host "- Installing dependencies (pandas, matplotlib, jupyter)..."
& $venvPy -m pip install --quiet --upgrade pip
if ($LASTEXITCODE -ne 0) { Fail-WithHelp "pip could not upgrade itself." }
& $venvPy -m pip install --quiet pandas matplotlib jupyter
if ($LASTEXITCODE -ne 0) { Fail-WithHelp "Dependency install failed (often a Windows long-path issue)." }

# Verify the key import actually works before claiming success.
& $venvPy -c "import pandas, matplotlib" 2>$null
if ($LASTEXITCODE -ne 0) { Fail-WithHelp "Dependencies installed but won't import — the environment is not usable." }

Write-Host "- Running the Land Intelligence example agent..."
Write-Host ""
Push-Location examples\land-intelligence-agent
& $venvPy main.py
$exampleExit = $LASTEXITCODE
Pop-Location
if ($exampleExit -ne 0) { Fail-WithHelp "The example agent did not run cleanly." }

Write-Host @"

OK - You're set. Next moves:

  - Explore the data:     .venv\Scripts\jupyter notebook notebooks\explore_sample_data.ipynb
  - Try the other agents: examples\investment-matching-agent  -  examples\decision-copilot
  - Build a web UI:       https://github.com/abu-dhabi-ai-proptech-challenge/project-template
  - Stuck? Discord:       https://discord.gg/jy3QDxQ3jK
"@
