// Copyright 2026 Nils Kopal
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package ui.commands

// Command palette display metadata and search helpers.

import std.string as s

// Return the display labels exposed by the command palette.
function labels()
  return [
    "File: Open Project", "File: Quick Open File", "File: Recent Files", "File: New Project", "File: Reload Project", "File: Close Tab", "File: Save", "File: Save All", "Window: Close Other Tabs", "Window: Close All Tabs", "Output: Copy", "Output: Select All", "Output: Clear",
    "Build: Clean", "Build: Build", "Build: Rebuild", "Build: Run", "Build: Stop", "Build: Run Tests", "Build: Run Current Test File", "Build: Run Related Test File",
    "Edit: Undo", "Edit: Redo", "Edit: Find", "Edit: Find Next", "Edit: Select All", "Edit: Rename Symbol Preview", "Edit: Complete", "Edit: Format Document",
    "Navigation: Back", "Navigation: Forward", "Navigation: Toggle Bookmark", "Navigation: Bookmarks", "Navigation: Next Bookmark", "Navigation: Previous Bookmark", "Navigation: Reveal Active File", "Navigation: Outline", "Navigation: File Structure", "Navigation: Workspace Health", "Navigation: TODOs", "Navigation: Test Explorer", "Navigation: Related Tests", "Navigation: Import Graph", "Navigation: Call Hierarchy", "Navigation: Symbol Info", "Navigation: Code Inspections", "Navigation: Project Index", "Navigation: Project Symbols", "Navigation: Go to Symbol",
    "Navigation: Go to Line", "Navigation: Go to Definition", "Navigation: Find References", "Navigation: Search Word in Project", "Navigation: Problems",
    "Configuration: Compile Settings", "Configuration: Build Profile Debug", "Configuration: Build Profile Release",
    "Configuration: Theme Dark", "Configuration: Theme Light", "Configuration: Select Compiler", "Configuration: Reset Compiler",
    "Configuration: Toggle Keep-going", "Configuration: Reload Configuration", "Configuration: Show Configuration",
    "Help: Home", "Help: MiniLang Language Reference", "Help: Search MiniLang Help", "Help: About MiniIDE",
  ]
end function

// Return additional search aliases for command palette labels.
function search_texts()
  return [
    "file open project workspace ctrl o", "file quick open find file ctrl p", "file recent files switch ctrl e", "file new project create", "file reload project refresh", "file close tab ctrl w editor", "file save ctrl s", "file save all ctrl shift s", "window close other tabs editor", "window close all tabs editor", "output log copy results", "output log select all results", "output log clear results",
    "build clean", "build compile f5", "build rebuild clean compile", "build run execute f6", "build stop cancel", "build test tests f7", "build test current file ctrl f7", "build test related file ctrl shift f7",
    "edit undo ctrl z revert", "edit redo ctrl y repeat", "edit find search ctrl f", "edit find next f3", "edit select all ctrl a", "edit rename symbol refactor f2 preview", "edit complete autocomplete ctrl space", "edit format document",
    "navigation back alt left history previous", "navigation forward alt right history next", "navigation toggle bookmark ctrl f2 marker favorite", "navigation bookmarks shift f2 markers favorites", "navigation next bookmark alt down marker favorite", "navigation previous bookmark alt up marker favorite", "navigation reveal active file project tree select alt f1", "navigation outline symbols current file", "navigation file structure ctrl f12 current symbols", "navigation workspace health dashboard status diagnostics", "navigation todo todos fixme tasks", "navigation test explorer tests runner", "navigation related tests current file", "navigation import graph imports dependencies", "navigation call hierarchy callers references", "navigation symbol info quick documentation inspect", "navigation code inspections unused symbols lint analysis", "navigation project index imports files", "navigation project symbols", "navigation goto symbol ctrl t",
    "navigation goto line ctrl g", "navigation goto definition f12", "navigation find references shift f12", "navigation search word project", "navigation problems diagnostics errors warnings",
    "configuration compile settings compiler build", "configuration build profile debug", "configuration build profile release",
    "configuration theme dark", "configuration theme light", "configuration compiler select", "configuration compiler reset default",
    "configuration toggle keep going compiler errors", "configuration reload", "configuration show",
    "help home welcome", "help minilang language reference", "help search minilang language", "help about miniide",
  ]
end function

// Return true when a command palette entry matches the query.
function matches(labels, search_texts, idx, query)
  if typeof(labels) != "array" or idx < 0 or idx >= len(labels) then return false end if
  if typeof(query) != "string" or query == "" then return true end if
  extra = ""
  if typeof(search_texts) == "array" and idx < len(search_texts) then extra = search_texts[idx] end if
  q = s.toLowerAscii(query)
  hay = s.toLowerAscii(labels[idx] + " " + extra)
  return s.indexOf(hay, q, 0) >= 0
end function

// Return the command selected by query or list selection.
function pick(ids, labels, search_texts, query, selected)
  if typeof(ids) != "array" or typeof(labels) != "array" or len(ids) <= 0 then return 0 end if
  if typeof(query) != "string" then query = "" end if
  query = s.trim(query)
  if query == "" and selected >= 0 and selected < len(ids) then return ids[selected] end if
  count = len(ids)
  if len(labels) < count then count = len(labels) end if
  for i = 0 to count - 1
    if matches(labels, search_texts, i, query) then return ids[i] end if
  end for
  if selected >= 0 and selected < len(ids) then return ids[selected] end if
  return 0
end function
