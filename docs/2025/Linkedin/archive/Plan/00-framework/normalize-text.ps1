Param(
  [string]$Path = '.',
  [string[]]$Include = @('*.md','*.ps1','*.csv','*.txt')
)

$ErrorActionPreference = 'Stop'

function Has-Mojibake([string]$s) {
  # Detect common mojibake indicators without embedding non-ASCII literals
  $indicators = @(
    [string][char]0x00C3, # Ã
    [string][char]0x00C2, # Â
    [string][char]0x00E2  # â
  )
  foreach ($ch in $indicators) { if ($s.Contains($ch)) { return $true } }
  return $false
}

function Demojibake([string]$text) {
  try {
    # Reverse typical UTF-8 -> CP1252 mojibake by reinterpreting bytes
    $bytes = [System.Text.Encoding]::GetEncoding(1252).GetBytes($text)
    $t = [System.Text.Encoding]::UTF8.GetString($bytes)
    if ($t.Contains([char]0xFFFD)) { return $text } else { return $t }
  } catch { return $text }
}

# Smart punctuation map using Unicode code points (keeps script ASCII-only)
$map = @{}
$map[[string][char]0x201C] = '"'  # left double quote
$map[[string][char]0x201D] = '"'  # right double quote
$map[[string][char]0x201E] = '"'  # double low-9 quote
$map[[string][char]0x00AB] = '"'  # guillemet left
$map[[string][char]0x00BB] = '"'  # guillemet right
$map[[string][char]0x2018] = "'"  # left single quote
$map[[string][char]0x2019] = "'"  # right single quote
$map[[string][char]0x201A] = "'"  # single low-9 quote
$map[[string][char]0x2013] = '-'  # en dash
$map[[string][char]0x2014] = '-'  # em dash
$map[[string][char]0x2026] = '...'# ellipsis
$map[[string][char]0x2022] = '* ' # bullet
$map[[string][char]0x00A0] = ' '  # nbsp

function Normalize-Punct([string]$t) {
  $out = $t
  foreach ($k in $map.Keys) { $out = $out.Replace($k, $map[$k]) }
  return $out
}

function Normalize-Text([string]$text) {
  $t = $text
  if (Has-Mojibake $t) {
    $t = Demojibake $t
  }
  $t = Normalize-Punct $t
  return $t
}

# Collect files matching Include patterns
$files = @()
foreach ($pattern in $Include) {
  $files += Get-ChildItem -Path $Path -Recurse -File -Filter $pattern -ErrorAction SilentlyContinue
}
$files = $files | Sort-Object FullName -Unique | Where-Object {
  $_.FullName -notmatch '\\\.git\\' -and $_.FullName -notmatch '\\node_modules\\'
}

$changed = 0
foreach ($f in $files) {
  $content = Get-Content -Raw -Path $f.FullName -Encoding UTF8
  $normalized = Normalize-Text $content
  if ($normalized -ne $content) {
    Set-Content -Path $f.FullName -Value $normalized -Encoding UTF8
    $changed++
  }
}

Write-Host "Normalized text in $changed file(s) under '$Path'."
