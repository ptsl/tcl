#!/usr/bin/tclsh

#
# Read and write files using a Lisp pattern.
#
# Usage:
#
#   with-open-file /path/file r fp {
#     set line [gets $fp]
#   }
#
proc with-open-file {path mode fpVarName block} {
    upvar 1 $fpVarName fp

    set fp [open $path $mode]

    try {
        uplevel 1 $block
    } finally {
        close $fp
    }
}
