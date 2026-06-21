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

import "ui/commands.ml" as commands

// Print a failed assertion and return false.
function _assert_true(name, condition)
  if condition then return true end if
  print "FAIL: " + name
  return false
end function

// Return the index of a value in an array, or -1 when it is absent.
function _index_of(items, value)
  if typeof(items) != "array" then return -1 end if
  for i = 0 to len(items) - 1
    if items[i] == value then return i end if
  end for
  return -1
end function

// Return deterministic fake command IDs matching the palette metadata length.
function _fake_ids(count)
  ids = []
  for i = 0 to count - 1
    ids = ids + [1000 + i]
  end for
  return ids
end function

// Run focused command palette metadata and search regression checks.
function main(args)
  labels = commands.labels()
  search_texts = commands.search_texts()
  ids = _fake_ids(len(labels))

  ok = true
  if _assert_true("labels array exists", typeof(labels) == "array") == false then ok = false end if
  if _assert_true("search array exists", typeof(search_texts) == "array") == false then ok = false end if
  if _assert_true("labels are non-empty", len(labels) > 0) == false then ok = false end if
  if _assert_true("labels and search aliases stay aligned", len(labels) == len(search_texts)) == false then ok = false end if

  quick_idx = _index_of(labels, "File: Quick Open File")
  current_test_idx = _index_of(labels, "Build: Run Current Test File")
  definition_idx = _index_of(labels, "Navigation: Go to Definition")
  keep_idx = _index_of(labels, "Configuration: Toggle Keep-going")
  max_errors_idx = _index_of(labels, "Configuration: Toggle Max Errors")
  subsystem_idx = _index_of(labels, "Configuration: Toggle Subsystem")
  output_idx = _index_of(labels, "Output: Clear")
  if _assert_true("quick open label exists", quick_idx >= 0) == false then ok = false end if
  if _assert_true("current test label exists", current_test_idx >= 0) == false then ok = false end if
  if _assert_true("definition label exists", definition_idx >= 0) == false then ok = false end if
  if _assert_true("keep-going label exists", keep_idx >= 0) == false then ok = false end if
  if _assert_true("max errors label exists", max_errors_idx >= 0) == false then ok = false end if
  if _assert_true("subsystem label exists", subsystem_idx >= 0) == false then ok = false end if
  if _assert_true("output clear label exists", output_idx >= 0) == false then ok = false end if

  if keep_idx >= 0 then
    if _assert_true("pick finds keep-going by alias", commands.pick(ids, labels, search_texts, "keep going", 0) == ids[keep_idx]) == false then ok = false end if
  end if
  if max_errors_idx >= 0 then
    if _assert_true("pick finds max errors by alias", commands.pick(ids, labels, search_texts, "max errors", 0) == ids[max_errors_idx]) == false then ok = false end if
  end if
  if subsystem_idx >= 0 then
    if _assert_true("pick finds subsystem by alias", commands.pick(ids, labels, search_texts, "subsystem", 0) == ids[subsystem_idx]) == false then ok = false end if
    if _assert_true("pick finds subsystem by console alias", commands.pick(ids, labels, search_texts, "console", 0) == ids[subsystem_idx]) == false then ok = false end if
  end if
  if quick_idx >= 0 then
    if _assert_true("pick finds quick open by shortcut alias", commands.pick(ids, labels, search_texts, "ctrl p", 0) == ids[quick_idx]) == false then ok = false end if
    if _assert_true("pick finds quick open by acronym", commands.pick(ids, labels, search_texts, "qof", 0) == ids[quick_idx]) == false then ok = false end if
    if _assert_true("pick finds quick open by compact fuzzy query", commands.pick(ids, labels, search_texts, "qopen", 0) == ids[quick_idx]) == false then ok = false end if
  end if
  if current_test_idx >= 0 then
    if _assert_true("pick finds current test by acronym", commands.pick(ids, labels, search_texts, "rctf", 0) == ids[current_test_idx]) == false then ok = false end if
  end if
  if definition_idx >= 0 then
    if _assert_true("pick finds definition by fuzzy query", commands.pick(ids, labels, search_texts, "gtd", 0) == ids[definition_idx]) == false then ok = false end if
  end if
  if output_idx >= 0 then
    if _assert_true("pick finds output clear by label", commands.pick(ids, labels, search_texts, "Output: Clear", 0) == ids[output_idx]) == false then ok = false end if
  end if

  if _assert_true("empty query uses selected item", commands.pick(ids, labels, search_texts, "", 3) == ids[3]) == false then ok = false end if
  if _assert_true("missing query falls back to selected item", commands.pick(ids, labels, search_texts, "definitely missing", 4) == ids[4]) == false then ok = false end if
  if _assert_true("bad selected item returns zero", commands.pick(ids, labels, search_texts, "definitely missing", -1) == 0) == false then ok = false end if
  if _assert_true("invalid match index is false", commands.matches(labels, search_texts, -1, "") == false) == false then ok = false end if

  if ok then
    print "Command palette tests OK"
    return 0
  end if
  return 1
end function
