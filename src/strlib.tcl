#!/usr/bin/tclsh

#
# Split text into lines.
#
# If the text ends with '\n', the last element is removed from the result to ensure
# that the function does not produce an empty string after the last line.
#
# Examples:
#
#   splitlines aaa\nbbb\nccc\n -> {aaa bbb ccc}
#   splitlines aaa\nbbb\nccc   -> {aaa bbb ccc}
#   splitlines aaa\nbbb\n      -> {aaa bbb}
#   splitlines aaa\nbbb        -> {aaa bbb}
#   splitlines aaa\n           -> {aaa}
#   splitlines aaa             -> {aaa}
#   splitlines \n\n\n          -> {{} {} {}}
#   splitlines \n\n            -> {{} {}}
#   splitlines \n              -> {{}}
#   splitlines {}              -> {}
#
proc splitlines {text} {
    set lines [split $text \n]

    if {[string index $text end] eq "\n"} {
        set lines [lrange $lines 0 end-1]
    }

    return $lines
}

#
# Return 1 if the string starts with the given prefix; otherwise, return 0.
#
# Usage:
#
#   startswith abcdefgh abcd
#
proc startswith {text prefix} {
    set length [string length $prefix]
    return [string equal -length $length $text $prefix]
}
