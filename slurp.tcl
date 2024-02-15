#!/usr/bin/tclsh

namespace eval slurp {
    namespace export read
    namespace ensemble create

    #
    # Read a whole file and return its content.
    #
    # Usage:
    #
    #   set text [slurp read /path/file]
    #
    proc read {path} {
        set fp [open $path r]
        try {
            # Use ::read to prevent recursion.
            return [::read $fp]
        } finally {
            close $fp
        }
    }
}
