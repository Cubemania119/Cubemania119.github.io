# ==============================
# INCIDENT RESPONSE TERMINAL
# ==============================

$ExpectedIP       = "10.42.8.17"
$ExpectedAdmin    = "jsmith"
$ExpectedRecovery = "BLUE-FALCON-2718"
$ExpectedPhrase   = "NIGHTHAWK"

function Write-Banner {
    Clear-Host

    Write-Host ""
    Write-Host "==================================================" -ForegroundColor Cyan
    Write-Host "           INCIDENT RESPONSE TERMINAL" -ForegroundColor Cyan
    Write-Host "==================================================" -ForegroundColor Cyan
    Write-Host ""
}

function Show-Loading {

    $frames = @(
        "[■□□□□□□□□□]",
        "[■■□□□□□□□□]",
        "[■■■□□□□□□□]",
        "[■■■■□□□□□□]",
        "[■■■■■□□□□□]",
        "[■■■■■■□□□□]",
        "[■■■■■■■□□□]",
        "[■■■■■■■■□□]",
        "[■■■■■■■■■□]",
        "[■■■■■■■■■■]"
    )

    $tasks = @(
        "Scanning server logs",
        "Verifying administrator credentials",
        "Analyzing backup records",
        "Checking recovery database",
        "Reconstructing evidence chain",
        "Validating mission report"
    )

    foreach ($task in $tasks) {

        foreach ($frame in $frames) {

            Write-Host "`r$frame  $task..." -NoNewline -ForegroundColor Yellow
            Start-Sleep -Milliseconds 120
        }

        Write-Host ""
    }

    Start-Sleep -Milliseconds 500
}

function Show-Success {

    Clear-Host

    Write-Host ""
    Write-Host "##################################################" -ForegroundColor Green
    Write-Host "#                                                #" -ForegroundColor Green
    Write-Host "#              MISSION SUCCESSFUL                #" -ForegroundColor Green
    Write-Host "#                                                #" -ForegroundColor Green
    Write-Host "##################################################" -ForegroundColor Green
    Write-Host ""

    Write-Host "Server restored." -ForegroundColor Green
    Write-Host "Backup services online." -ForegroundColor Green
    Write-Host "State testing infrastructure secured." -ForegroundColor Green

    Write-Host ""
    Write-Host "Status: RESOLVED" -ForegroundColor Green
    Write-Host ""

    Write-Host @"

      ___________
     / =======  /|
    / =======  / |
   /__________/  |
   |  _ _ _  |  |
   | | | | | |  |
   | |-+-+-| |  |
   | |_|_|_| | /
   |_________|/

"@ -ForegroundColor Green

    Write-Host ""
    Read-Host "Press ENTER to exit"
}

function Show-Failure {

    Clear-Host

    Write-Host ""
    Write-Host "##################################################" -ForegroundColor Red
    Write-Host "#                                                #" -ForegroundColor Red
    Write-Host "#               ACCESS DENIED                    #" -ForegroundColor Red
    Write-Host "#                                                #" -ForegroundColor Red
    Write-Host "##################################################" -ForegroundColor Red
    Write-Host ""

    Write-Host "One or more values were incorrect." -ForegroundColor Red
    Write-Host ""
    Write-Host "Investigation report rejected." -ForegroundColor Red
    Write-Host "Continue searching the evidence folders." -ForegroundColor Red

    Write-Host ""

    Write-Host @"

      /\_/\\
     ( o.o )
      > ^ <
    
    SYSTEM ERROR

"@ -ForegroundColor Red

    Write-Host ""
    Read-Host "Press ENTER to try again"
}

# ==============================
# MAIN PROGRAM
# ==============================

Write-Banner

Write-Host "Enter the results from your investigation." -ForegroundColor White
Write-Host ""

$IP       = Read-Host "Backup Server IP"
$Admin    = Read-Host "Administrator Username"
$Recovery = Read-Host "Recovery Code"
$Phrase   = Read-Host "Password Phrase"

Write-Host ""
Write-Host "Submitting forensic report..." -ForegroundColor Yellow
Write-Host ""

Show-Loading

if (
    $IP -eq $ExpectedIP -and
    $Admin -eq $ExpectedAdmin -and
    $Recovery -eq $ExpectedRecovery -and
    $Phrase -eq $ExpectedPhrase
) {
    Show-Success
}
else {
    Show-Failure
}