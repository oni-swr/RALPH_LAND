<#
.SYNOPSIS
    OpenCode Loop Runner (Refactored for Stability)
#>

param (
    [int]$MaxIterations = 100
)

# Configuration
$ErrorActionPreference = "Stop"
$ScriptDir = $PSScriptRoot
$PromptFile = Join-Path $ScriptDir "REVIEW.md"
$StatusFile = Join-Path $ScriptDir "STATUS.md"

# ---------------------------------------------------------
# Function 1: Check Status
# ---------------------------------------------------------
function Test-GoalAccomplished {
    if (-not (Test-Path -Path $StatusFile)) {
        return $false
    }

    $content = Get-Content -Path $StatusFile
    $statusLine = $content | Where-Object { $_ -match "^Status:" } | Select-Object -First 1

    if ($null -eq $statusLine) { return $false }

    $statusValue = ($statusLine -split ":", 2)[1].Trim().ToLower()

    if ($statusValue -eq "completed") {
        Write-Host " Model marked status as: completed" -ForegroundColor Green
        return $true
    }
    elseif ($statusValue -eq "blocked") {
        Write-Host " Model marked status as: blocked" -ForegroundColor Yellow
        $reasonLine = $content | Where-Object { $_ -match "^Reason:" } | Select-Object -First 1
        if ($reasonLine) {
            $reason = ($reasonLine -split ":", 2)[1].Trim()
            Write-Host "Reason: $reason" -ForegroundColor Yellow
        }
        return $true
    }

    return $false
}

# ---------------------------------------------------------
# Function 2: Run Iteration
# ---------------------------------------------------------
function Invoke-OpencodeIteration {
    param ([int]$CurrentIter)

    Write-Host "--- Iteration $CurrentIter ---" -ForegroundColor Cyan
    
    if (-not (Test-Path $PromptFile)) {
        Write-Host "Error: PROMPT.md not found in $ScriptDir" -ForegroundColor Red
        exit 1
    }

    $promptContent = Get-Content -Path $PromptFile -Raw

    # Execute opencode using the call operator &
# Execute opencode using the call operator &
    try {
    # Pipe to Out-Host to force output to screen and keep it out of the return value
        & opencode run -m github-copilot/gpt-4.1 "$promptContent" | Out-Host
    }

    catch {
        Write-Host "CRITICAL ERROR: Could not run 'opencode'. Is it installed and in your PATH?" -ForegroundColor Red
        Write-Host "Error details: $_" -ForegroundColor Red
        exit 1
    }

    if (Test-GoalAccomplished) {
        Write-Host " Goal accomplished!" -ForegroundColor Green
        return $true
    }
    return $false
}

# ---------------------------------------------------------
# Function 3: Main Loop Logic
# ---------------------------------------------------------
function Start-MainLoop {
    Write-Host "================================" -ForegroundColor Cyan
    Write-Host "OpenCode Loop Runner" -ForegroundColor Cyan
    Write-Host "================================" -ForegroundColor Cyan
    Write-Host "Working Dir: $ScriptDir" -ForegroundColor Gray
    Write-Host ""

    # Create Status file if missing
    if (-not (Test-Path -Path $StatusFile)) {
        Set-Content -Path $StatusFile -Value "# Status`nStatus: in_progress" -Encoding UTF8
        Write-Host "Created STATUS.md" -ForegroundColor Yellow
    }

    $Iteration = 0

    while ($Iteration -lt $MaxIterations) {
        $Iteration++
        
        # Calling the function
        $done = Invoke-OpencodeIteration -CurrentIter $Iteration

        if ($done) {
            Write-Host "Exiting success." -ForegroundColor Green
            exit 0
        }
        
        Start-Sleep -Seconds 2
    }

    Write-Host "Max iterations reached." -ForegroundColor Red
}

# ---------------------------------------------------------
# EXECUTION STARTS HERE
# ---------------------------------------------------------
Start-MainLoop

