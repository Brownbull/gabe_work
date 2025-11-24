Param(
  [Parameter(Mandatory = $true)]
  [string]$Title,
  [string]$Date = (Get-Date -Format 'yyyy-MM-dd'),
  [ValidateSet('ai','dev','diary','trends','life')]
  [string]$Pillar = 'ai',
  [string]$PlannedPublishAt,
  [string]$BaseDir = 'Posts',
  [switch]$Force
)

$ErrorActionPreference = 'Stop'

function Get-Slug([string]$s) {
  $t = $s.ToLowerInvariant()
  $t = [regex]::Replace($t, '[^a-z0-9]+', '-')
  $t = $t.Trim('-')
  return $t
}

# Validate date formats (YYYY-MM-DD)
if ($Date -notmatch '^\d{4}-\d{2}-\d{2}$') { throw "Invalid -Date. Use YYYY-MM-DD." }
if ($PlannedPublishAt -and ($PlannedPublishAt -notmatch '^\d{4}-\d{2}-\d{2}$')) { throw "Invalid -PlannedPublishAt. Use YYYY-MM-DD." }

$slug = Get-Slug $Title
$folderName = "$Date-$slug"
$src = Join-Path $BaseDir '_template'
$dst = Join-Path $BaseDir $folderName

if (-not (Test-Path $src)) {
  throw "Template not found at: $src"
}

if (Test-Path $dst) {
  if (-not $Force) {
    throw "Destination exists: $dst. Use -Force to overwrite."
  } else {
    Remove-Item -Recurse -Force $dst
  }
}

# Create folder and copy template
New-Item -ItemType Directory -Force -Path $dst | Out-Null
Copy-Item -Path (Join-Path $src '*') -Destination $dst -Recurse -Force

# Update front matter in post.md
$postMd = Join-Path $dst 'post.md'
if (-not (Test-Path $postMd)) {
  throw "post.md not found in $dst"
}

$content = Get-Content -Raw $postMd

# Escape quotes for YAML double-quoted string
$yamlTitle = $Title -replace '"','\"'

# Replace basic fields
$content = $content -replace '(?m)^title:\s*".*?"', ('title: "' + $yamlTitle + '"')
$content = $content -replace '(?m)^slug:\s*".*?"', ('slug: "' + $slug + '"')
$content = $content -replace '(?m)^pillar:.*$', ('pillar: ' + $Pillar + ' # ai | dev | diary | trends | life')
$content = $content -replace '(?m)^created_at:\s*\d{4}-\d{2}-\d{2}', ('created_at: ' + $Date)

if ($PlannedPublishAt) {
  $content = $content -replace '(?m)^planned_publish_at:\s*.*$', ('planned_publish_at: ' + $PlannedPublishAt)
}

Set-Content -Path $postMd -Value $content -Encoding UTF8

Write-Host "New post created:"
Write-Host "  Folder: $dst"
Write-Host "  Title: $Title"
Write-Host "  Slug: $slug"
Write-Host "  Pillar: $Pillar"
Write-Host "Next steps:"
Write-Host "  - Open $postMd to verify front matter"
Write-Host "  - Fill 00-brief.md, then outline/draft/polish"
