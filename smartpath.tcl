#!/usr/bin/tclsh

namespace eval smartpath {
    namespace export new abs rel
    namespace ensemble create

    #
    # Create a new smart path.
    #
    # Usage:
    #
    #   set smpath [smartpath new /aaa/bbb ccc/ddd]
    #
    # The smart path is represented as a list of two values (abs, rel).
    #
    proc new {prefix rel} {
        if {[file pathtype $prefix] ne "absolute"} {
            error "prefix: expected an absolute path"
        }

        if {[file pathtype $rel] ne "relative"} {
            error "rel: expected a relative path"
        }

        set abs [file join $prefix $rel]

        return [list $abs $rel]
    }

    #
    # Return the smart path as an absolute path.
    #
    # Usage:
    #
    #   smartpath abs $smpath
    #
    proc abs {smpath} {
        return [lindex $smpath 0]
    }

    #
    # Return the relative part of the smart path.
    #
    # Usage:
    #
    #   smartpath rel $smpath
    #
    proc rel {smpath} {
        return [lindex $smpath 1]
    }
}
