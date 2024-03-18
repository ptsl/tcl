#!/usr/bin/tclsh

namespace eval slurp {
    namespace export read readlines write writelines edit editlines
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
            # The final newline is written only if 'text' contains it.
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

    #
    # Edit a file using a regular expression.
    #
    # Usage:
    #
    #   slurp edit /path/file aaa bbb
    #
    # The file remains unchanged if the pattern does not match.
    # The pattern is matched against the string in multi-line mode (-line).
    # All found matches are replaced (-all).
    # Matching occurs in case-sensitive mode.
    #
    proc edit {path pattern repl} {
        if {[regsub -all -line -- $pattern [read $path] $repl result]} {
            write $path $result
        }
    }

    #
    # Modify a file by applying a regular expression to each line individually.
    #
    # Usage:
    #
    #   slurp editlines /path/file aaa bbb
    #
    # Multi-line patterns are intentionally not functional.
    #
    proc editlines {path pattern repl} {
        set lines [readlines $path]

        set result {}
        set count 0

        foreach line $lines {
            # The newLine variable is still assigned, even if the regexp does not match.
            if {[regsub -all -- $pattern $line $repl newLine]} {
                incr count
            }

            lappend result $newLine
        }


        if {$count > 0} {
            writelines $path $result
        }
    }
}
