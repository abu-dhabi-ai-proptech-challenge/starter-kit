# Abu Dhabi AI PropTech Challenge — one command to a running AI agent (Windows).
#
#   powershell -ExecutionPolicy Bypass -File .\quickstart.ps1
#
# Creates a local virtualenv, installs the few dependencies, and runs the
# land-intelligence example end to end. No API keys needed.
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

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
    Write-Host "X Python 3.10+ not found. Install it from https://python.org (tick 'Add Python to PATH') and retry."
    exit 1
}

Write-Host "- Creating virtualenv (.venv)..."
& $python @pyargs -m venv .venv

Write-Host "- Installing dependencies (pandas, matplotlib, jupyter)..."
& .\.venv\Scripts\python.exe -m pip install --quiet --upgrade pip
& .\.venv\Scripts\python.exe -m pip install --quiet pandas matplotlib jupyter

Write-Host "- Running the Land Intelligence example agent..."
Write-Host ""
Push-Location examples\land-intelligence-agent
& ..\..\.venv\Scripts\python.exe main.py
Pop-Location

Write-Host @"

OK - You're set. Next moves:

  - Explore the data:     .venv\Scripts\jupyter notebook notebooks\explore_sample_data.ipynb
  - Try the other agents: examples\investment-matching-agent  -  examples\decision-copilot
  - Build a web UI:       https://github.com/abu-dhabi-ai-proptech-challenge/project-template
  - Stuck? Discord:       https://discord.gg/jy3QDxQ3jK
"@
