#!/usr/bin/tclsh

namespace eval slurp {
    namespace export read readlines write writelines
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
    # Read a whole file and return it as a list of lines.
    #
    # Usage:
    #
    #   set lines [slurp readlines /path/file]
    #
    # The newline characters are discarded.
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

    #
    # Write a whole file.
    #
    # Usage:
    #
    #   slurp write /path/file "File content"
    #
    proc write {path text} {
        set fp [open $path w]
        try {
            puts -nonewline $fp $text
        } finally {
            close $fp
        }
    }

    #
    # Write a list of lines to a file.
    #
    # Usage:
    #
    #   slurp writelines /path/file {{Line 1} {Line 2} {Line 3}}
    #
    proc writelines {path lines} {
        set fp [open $path w]
        try {
            foreach line $lines {
                puts $fp $line
            }
        } finally {
            close $fp
        }
    }
}
