# Copyright 2026 MiniLang Project
# SPDX-License-Identifier: Apache-2.0

[CmdletBinding()]
param([string]$MiniDoc, [string]$CompilerRoot, [switch]$Check)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$repo = [IO.Path]::GetFullPath((Split-Path -Parent $PSScriptRoot))
$workspace = Split-Path -Parent $repo

if ([string]::IsNullOrWhiteSpace($MiniDoc)) {
    $MiniDoc = @($env:MINIDOC_EXE, (Join-Path $workspace 'MiniDoc\build\minidoc.exe')) |
        Where-Object { -not [string]::IsNullOrWhiteSpace($_) -and (Test-Path -LiteralPath $_ -PathType Leaf) } |
        Select-Object -First 1
}
if ([string]::IsNullOrWhiteSpace($MiniDoc)) { throw 'MiniDoc was not found. Pass -MiniDoc or set MINIDOC_EXE.' }
if ([string]::IsNullOrWhiteSpace($CompilerRoot)) {
    $CompilerRoot = @($env:MINILANG_ROOT, (Join-Path $workspace 'MiniLangCompilerML'), (Join-Path $workspace 'MiniLangCompilerPy')) |
        Where-Object { -not [string]::IsNullOrWhiteSpace($_) -and (Test-Path -LiteralPath (Join-Path $_ 'std') -PathType Container) } |
        Select-Object -First 1
}
if ([string]::IsNullOrWhiteSpace($CompilerRoot)) { throw 'MiniLang compiler root was not found. Pass -CompilerRoot or set MINILANG_ROOT.' }

$arguments = @('--config', (Join-Path $repo 'minidoc.toml'), '-I', ([IO.Path]::GetFullPath($CompilerRoot)))
if ($Check) { $arguments += '--check' }
Push-Location $repo
try {
    & $MiniDoc @arguments
    if ($LASTEXITCODE -ne 0) { throw "MiniDoc failed with exit code $LASTEXITCODE." }
}
finally { Pop-Location }
