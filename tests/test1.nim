# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest
import sugar
import OptsParser
test "can work":
  var loud = false;
  var text = "hi";

  var eParser = makeOptParser(colmunSize=13, spaceSize=2):
    setBanner("ptVoid parser!")
    addOpt("-s", "--say", "text to say"):
      text = "passed"
    addOpt("-l", "--loudly", "says it loudly"):
      loud = true
    addOpt("-s", "", "short only!"):
      echo "short"
    # empty info means its hidden in showOpts
    addOpt("?s", "?secert", ""):
      echo "you found the secert option"
  eParser.showOpts()
  eParser.parse()
  check true
