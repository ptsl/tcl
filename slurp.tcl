#!/usr/bin/tclsh

namespace eval slurp {
    namespace export read readlines
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

    #
    # Read a whole file and return it as an array of lines.
    #
    # Usage:
    #
    #   set lines [slurp readlines /path/file]
    #
    proc readlines {path} {
        set fp [open $path r]
        try {
            # Use ::read to prevent recursion.
            return [split [::read -nonewline $fp] \n]
        } finally {
            close $fp
        }
    }
}
