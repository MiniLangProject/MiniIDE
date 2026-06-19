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

/*
This is the main entrance of our minilang program
*/
// Run the program entry point.
function main(args)
  a = array(100,bytes(100,1))
  for each x in a
    for each y in x
    print "Hello from MiniIDE"
    value = 21 * 2
    if value == 42 then
      print "MiniLang is ready: " + y
    else
      print "Unexpected value"
    end if
  end for
  end for
  return 0
end function
