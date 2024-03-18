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
    # Refer to text.test (Test cases) for a more detailed description of the behavior.
    #
    proc splitlines {text} {
        set lines [split $text \n]

        if {[string index $text end] eq "\n"} {
            set lines [lrange $lines 0 end-1]
        }

        return $lines
    }
}
