#!/usr/bin/tclsh

namespace eval text {
    namespace export splitlines startswith
    namespace ensemble create

    #
    # Split the text into lines.
    #
    # If the text ends with '\n', the last element is removed from the result to ensure
    # that the function does not produce an empty string after the last line.
    #
    # Examples:
    #
    #   text splitlines aaa\nbbb\nccc\n -> {aaa bbb ccc}
    #   text splitlines aaa\nbbb\nccc   -> {aaa bbb ccc}
    #   text splitlines aaa\nbbb\n      -> {aaa bbb}
    #   text splitlines aaa\nbbb        -> {aaa bbb}
    #   text splitlines aaa\n           -> {aaa}
    #   text splitlines aaa             -> {aaa}
    #   text splitlines \n\n\n          -> {{} {} {}}
    #   text splitlines \n\n            -> {{} {}}
    #   text splitlines \n              -> {{}}
    #   text splitlines {}              -> {}
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
    #   text startswith abcdefgh abcd
    #
    proc startswith {text prefix} {
        set length [string length $prefix]
        return [string equal -length $length $text $prefix]
    }
}
