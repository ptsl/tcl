#!/usr/bin/tclsh

namespace eval strlib {
    namespace export splitlines startswith
    namespace ensemble create

    #
    # Split text into lines.
    #
    # If the text ends with '\n', the last element is removed from the result to ensure
    # that the function does not produce an empty string after the last line.
    #
    # Examples:
    #
    #   strlib splitlines aaa\nbbb\nccc\n -> {aaa bbb ccc}
    #   strlib splitlines aaa\nbbb\nccc   -> {aaa bbb ccc}
    #   strlib splitlines aaa\nbbb\n      -> {aaa bbb}
    #   strlib splitlines aaa\nbbb        -> {aaa bbb}
    #   strlib splitlines aaa\n           -> {aaa}
    #   strlib splitlines aaa             -> {aaa}
    #   strlib splitlines \n\n\n          -> {{} {} {}}
    #   strlib splitlines \n\n            -> {{} {}}
    #   strlib splitlines \n              -> {{}}
    #   strlib splitlines {}              -> {}
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
    #   strlib startswith abcdefgh abcd
    #
    proc startswith {text prefix} {
        set length [string length $prefix]
        return [string equal -length $length $text $prefix]
    }
}
