# Charge un fichier .env dans les variables d'environnement PowerShell
$envPath = ".\.env"

if (Test-Path $envPath) {
    Get-Content $envPath | ForEach-Object {
        if ($_ -match "^\s*#") { return } # Ignore les commentaires
        if ($_ -match "^\s*$") { return } # Ignore les lignes vides

        $parts = $_ -split "=", 2
        if ($parts.Length -eq 2) {
            $key = $parts[0].Trim()
            $value = $parts[1].Trim()
            [System.Environment]::SetEnvironmentVariable($key, $value, "Process")
        }
    }
    Write-Host "Variables d'environnement chargées depuis .env"
} else {
    Write-Host "Fichier .env introuvable"
}
