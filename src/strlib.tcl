#!/usr/bin/tclsh

namespace eval strlib {
    namespace export endswith splitlines startswith
    namespace ensemble create

    #
    # Return 1 if string ends with the suffix, otherwise return 0.
    #
    # Use the -nocase option for case-insensitive matching.
    #
    # Usage:
    #
    #   endswith efgh abcdefgh
    #   endswith eFgH AbCdEfGh -nocase
    #
    proc endswith {suffix string args} {
        if {"-nocase" in $args} {
            return [string match -nocase *$suffix $string]
        } else {
            return [string match *$suffix $string]
        }
    }

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
    # Return 1 if string starts with the prefix, otherwise return 0.
    #
    # Use the -nocase option for case-insensitive matching.
    #
    # Usage:
    #
    #   startswith abcd abcdefgh
    #   startswith aBcD AbCdEfGh -nocase
    #
    proc startswith {prefix string args} {
        if {"-nocase" in $args} {
            return [string match -nocase $prefix* $string]
        } else {
            return [string match $prefix* $string]
        }
    }
}
