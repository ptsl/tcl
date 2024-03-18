#!/usr/bin/tclsh

namespace eval text {
    namespace export splitlines
    namespace ensemble create

    #
    # Split the text into lines.
    #
    # If the text ends with '\n', the last element is removed from the result to ensure
    # that the function does not produce an empty string after the last line.
    #
    # Test cases:
    #
    #   text splitlines aaa\nbbb\nccc\n -> {aaa bbb ccc} (removed {})
    #   text splitlines aaa\nbbb\nccc   -> {aaa bbb ccc}
    #   text splitlines aaa\nbbb\n      -> {aaa bbb}     (removed {})
    #   text splitlines aaa\nbbb        -> {aaa bbb}
    #   text splitlines aaa\n           -> {aaa}         (removed {})
    #   text splitlines aaa             -> {aaa}
    #   text splitlines \n\n\n          -> {{} {} {}}    (removed {})
    #   text splitlines \n\n            -> {{} {}}       (removed {})
    #   text splitlines \n              -> {{}}          (removed {})
    #   text splitlines {}              -> {}
    #
    proc splitlines {text} {
        set lines [split $text \n]

        if {[string index $text end] eq "\n"} {
            set lines [lrange $lines 0 end-1]
        }

        return $lines
    }
}
