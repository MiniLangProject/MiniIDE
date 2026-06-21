# MiniIDE

MiniIDE is a small native Windows IDE for MiniLang, written in MiniLang.
It is intentionally lightweight: no Electron shell, no web runtime, and no
large framework. The application uses Win32 controls directly and focuses on
the core edit/build/run loop for MiniLang projects.

The MiniLang compiler is **not** part of this repository. MiniIDE expects a
local copy of `mlc_win64.exe` when building, running projects, or executing the
test suite.

## Current Status

MiniIDE is an MVP-level IDE with a working native Windows UI. It can open and
create MiniLang projects, edit source files, compile and run programs, run test
entries, display compiler diagnostics, navigate symbols, render local Markdown
help, and switch between dark and light themes.

The repository currently targets Windows because the UI is built directly on
Win32 APIs and RichEdit.

## Features

- Native Win32 application written in MiniLang.
- Project tree using `SysTreeView32`.
- Editor tabs using `SysTabControl32`.
- RichEdit-based source editor with dirty-file tracking.
- MiniLang syntax highlighting.
- Build, rebuild, clean, stop, run, and run-tests commands.
- Background compiler and process execution without `cmd.exe`.
- Automatic compile-before-run when the target executable is missing or stale.
- Captured stdout/stderr in the bottom log view.
- Compiler diagnostics, project diagnostics, and code inspections parsed into a
  clickable Problems/results panel.
- Project-wide symbol outline and search.
- Go to line and go to definition.
- Find, find-next, and basic completion.
- Standard project wizard with console/library project type selection.
- Tree context actions for creating test files, renaming, and deleting items.
- Debug/release build profiles.
- Project-local compiler and build settings.
- Dark and light theme support.
- Rendered Markdown tabs for local help and language-reference content.

## Repository Layout

```text
src/
  build/          Background build, run, clean, and process-control services.
  editor/         Editor buffer helpers.
  help/           Language-reference lookup and search helpers.
  lang/           MiniLang syntax and symbol helpers.
  platform/       Win32 declarations and native UI wrappers.
  project/        Project file loading and project template generation.
  ui/             Theme, Markdown rendering, and command palette helpers.
  main.ml         MiniIDE application entry point.

tests/
  run_tests.ps1   Windows test runner and UI smoke test.
  *_test.ml       Focused MiniLang regression tests.

examples/
  hello/          Small sample project.

projects/
  MiniLangProject/
  MiniLangProject2/
                  Generated-project examples.

MiniIDE.mlproj    MiniIDE project file.
```

Generated output belongs in `build/` folders and is ignored by Git.

## External Compiler Dependency

MiniIDE needs the self-hosted MiniLang compiler executable:

```text
mlc_win64.exe
```

The repository deliberately does not vendor the compiler sources or compiler
build output. For local development, use one of these layouts:

```text
MiniIDE/
  MiniLangCompilerML/
    build/
      mlc_win64.exe
```

or keep the compiler elsewhere and point `.miniide.cfg` at it:

```ini
compiler=C:\path\to\mlc_win64.exe
```

The checked-in `.miniide.cfg.example` can be copied to `.miniide.cfg` for local
configuration. `.miniide.cfg` itself is ignored because it usually contains
machine-specific paths.

## Requirements

- Windows x64.
- PowerShell.
- Git, for normal repository workflows.
- A local MiniLang compiler build containing `mlc_win64.exe`.
- RichEdit/MSFTEDIT support, available on normal Windows installations.

## Build

From the repository root, assuming the compiler is available at
`.\MiniLangCompilerML\build\mlc_win64.exe`:

```powershell
.\MiniLangCompilerML\build\mlc_win64.exe .\src\main.ml .\build\MiniIDE.exe -I .\src -I .\MiniLangCompilerML --keep-going --max-errors 80 --subsystem windows
```

This writes:

```text
build\MiniIDE.exe
```

The IDE project file uses `build\MiniIDE_dev.exe` as its normal development
output so that a running `build\MiniIDE.exe` is not overwritten from inside the
IDE.

## Run

Start MiniIDE:

```powershell
.\build\MiniIDE.exe
```

Open a specific project root:

```powershell
.\build\MiniIDE.exe .\examples\hello
```

Inside MiniIDE, use `File > Run` or the Run ribbon button to run the active
project executable. MiniIDE checks whether the executable is missing or older
than the project sources/configuration; if needed, it compiles first and starts
the program after a successful build.

Program output is captured in the bottom log view and written to:

```text
build\last_run.log
```

## Tests

Run the full test suite:

```powershell
.\tests\run_tests.ps1
```

The full test runner:

- performs static source wiring checks;
- compiles and runs focused command palette metadata/search tests;
- compiles and runs focused Markdown renderer tests;
- compiles and runs project-loader tests;
- compiles MiniIDE to an isolated temporary executable;
- starts MiniIDE and runs a Win32 message-based UI smoke test;
- verifies background compilation;
- verifies auto-compile-before-run;
- verifies test build/run behavior;
- exercises build profiles, clean/rebuild/stop, theme switching, and language
  help commands.

For a faster non-UI check:

```powershell
.\tests\run_tests.ps1 -SkipUi
```

Use `-KeepArtifacts` when investigating temporary test outputs:

```powershell
.\tests\run_tests.ps1 -KeepArtifacts
```

## Project Files

MiniIDE reads simple `.mlproj` files:

```ini
name=MiniIDE
type=console
entry=src\main.ml
output=build\MiniIDE_dev.exe
testEntry=tests\main_test.ml
runArgs=
workingDir=.
importPath=src
importPath=MiniLangCompilerML
```

Common keys:

- `name`: project display/build name.
- `type`: usually `console` or `library`.
- `entry`: main source file.
- `output`: executable or library output path.
- `testEntry`: optional test entry file used by `File > Run Tests`.
- `runArgs`: arguments passed when running the project.
- `workingDir`: process working directory for run/test commands.
- `importPath`: additional MiniLang import roots.

## Standard Project Structure

New projects created by MiniIDE use this layout:

```text
src\main.ml
src\app\
src\lib\
lib\
tests\main_test.ml
assets\data\
assets\icons\
build\
.miniide.cfg
<name>.mlproj
README.md
```

## Configuration

Use `Configuration > Compile Settings...` to choose:

- main file;
- output file;
- compiler executable;
- maximum compiler errors;
- subsystem;
- keep-going mode;
- extra compiler arguments.

`Configuration: Toggle Keep-going`, `Configuration: Toggle Max Errors`, and
`Configuration: Toggle Subsystem` are available from the command palette for
quickly switching compiler behavior while working.

Use `Configuration > Select Compiler...` to choose a project-specific compiler
executable. MiniIDE stores local build settings in `.miniide.cfg`:

```ini
compiler=C:\path\to\mlc_win64.exe
profile=debug
keepGoing=true
maxErrors=20
subsystem=windows
extraArgs=
```

`Configuration > Reset Compiler to Default` resets builds to the default
compiler path. `Configuration > Build Profile: Debug/Release` switches the
active build profile. Optional profile overrides use keys such as:

```ini
debug.maxErrors=160
release.keepGoing=false
release.extraArgs=--trace-calls
```

`Configuration > Show Configuration` displays the effective compiler, entry
file, output file, import paths, and build options. `extraArgs` is appended to
the compiler command for advanced flags such as heap or tracing options.

## Main Commands

The command palette filters results as you type and supports label, alias,
shortcut, acronym, and fuzzy subsequence searches such as `qof` or `qopen` for
`Quick Open File`. Filtered results are ordered by match strength, so direct
label and alias hits stay ahead of acronym and fuzzy matches. Use the arrow
keys, Page Up/Down, Home, and End to move through filtered results.

File menu:

- `New Project...`: create a standard MiniLang project.
- `Open Project...`: open a `.mlproj` file or project directory.
- `Close Tab`: close the active editor tab.
- `Save`: save the active editor tab.
- `Save All` / `Ctrl+Shift+S`: save all dirty editable tabs.
- `Build`: compile the current project.
- `Run`: compile if needed, then run the project executable.
- `Run Tests`: build and run the configured `testEntry`.
- `Clean`: remove known build outputs and logs.
- `Rebuild`: clean and force a fresh build.
- `Stop`: terminate the active background build/run process.

Edit menu:

- `Find...` / `Ctrl+F`: search within the active editor tab.
- `Find Next` / `F3`: repeat the last search.
- `Select All` / `Ctrl+A`: select all text in the active editor tab.
- `Undo`, `Redo`, `Cut`, `Copy`, and `Paste` are available from the menu,
  editor context menu, and command palette.
- `Complete` / `Ctrl+Space`: show MiniLang keyword and project-symbol
  completions with symbol-kind labels plus prefix, substring, and fuzzy matches.
- `Format Document`: trim trailing whitespace and collapse excessive blank
  lines.
- `Window: Close Other Tabs` and `Window: Close All Tabs` are available from
  the command palette and tab context menu.
- `Output: Copy`, `Output: Select All`, and `Output: Clear` are available
  from the command palette and bottom log context menu.

Navigation menu:

- `Navigate Back` / `Alt+Left` and `Navigate Forward` / `Alt+Right`: move
  through explicit jump history.
- `Toggle Bookmark` / `Ctrl+F2`: add or remove a session bookmark on the
  current line.
- `Bookmarks` / `Shift+F2`: show session bookmarks in the results panel.
- `Next Bookmark` / `Alt+Down` and `Previous Bookmark` / `Alt+Up`: cycle
  through bookmarked locations.
- `Reveal Active File` / `Alt+F1`: select the active editor file in the
  project tree.
- `Outline`: show package/function/struct/const symbols for the active file,
  with function, type, constant, and scope totals in the panel title.
- `File Structure` / `Ctrl+F12`: show symbols in the active file.
- `Workspace Health`: summarize indexed files, symbols, imports, tests,
  inspections, diagnostics, severity totals, and an overall status.
- `TODOs`: list TODO/FIXME comments across project source files, with TODO and
  FIXME totals in the panel title.
- `Test Explorer`: list the configured test entry and discovered test-like
  functions, with configured, discovered, and missing totals in the panel title.
- `Project Symbols` and `Go to Symbol...` / `Ctrl+T`: browse or ranked-filter
  symbols across the project with prefix, substring, and fuzzy matches.
- `Go to Line...` / `Ctrl+G`: jump to a line in the active editor tab.
- `Go to Definition` / `F12`: jump to a matching project symbol.
- `Find References` / `Shift+F12`: list project references for the current
  symbol, with match totals in the panel title.
- `Related Tests`: find tests that import the active source file or match the
  `foo.ml` to `foo_test.ml` / `test_foo.ml` naming convention, with related
  file and symbol totals in the panel title.
- `Import Graph`: list project imports with resolved and unresolved totals in
  the panel title.
- `Call Hierarchy`: list definitions and references for the current symbol,
  with definition and reference totals in the panel title.
- `Code Inspections`: list lightweight project findings such as duplicate
  declarations, unused import aliases, and possibly unused symbols, with
  severity totals in the panel title.
- `Search Word in Project`: search the current word across project `.ml` files.
- `Problems`: show diagnostics from project analysis, code inspections, missing
  configured entry files, missing working directories, missing import paths,
  duplicate import aliases, and the last build log, with severity totals in the
  panel title.

Help menu:

- `Home`: open local project layout and shortcuts.
- `MiniLang Language Reference`: open the compiler README as rendered Markdown.
- `Search MiniLang Help...`: search the language reference and open rendered
  search results.

## Diagnostics And Results

Build diagnostics, symbol outline entries, project search results, and help
search results are displayed in the bottom results panel.

Problems open on selection. Compiler-log diagnostics open on click. Other
result lists open with a double-click.

Quick Open and project symbol search rank exact/prefix matches ahead of
substring and compact fuzzy matches, so short queries such as `mtest` can find
`tests\main_test.ml` without typing the full path.

## Markdown Help

MiniIDE renders Markdown help files into read-only editor tabs. The renderer
supports headings, inline emphasis, links, code spans, fenced MiniLang code
blocks, nested inline formatting, and theme-aware styling.

The language reference is resolved from the local compiler checkout:

```text
MiniLangCompilerML\README.md
```

If the compiler checkout is not present in the expected location, configure the
compiler path or place the compiler repository next to MiniIDE as described
above.

## License

MiniIDE is licensed under the Apache License, Version 2.0. See `LICENSE`.
