#!/usr/bin/tclsh

#
# Named arguments
#
# https://wiki.tcl-lang.org/page/Named+arguments
#
# Arguments:
#     args: expected parameters with their default values
#
# Variables:
#     upArgs: arguments really passed to the function
#
# Usage:
#
#   proc test {x y args} {
#       named -abc 1 -def 2
#
#       puts "-abc: $(-abc)"
#       puts "-def: $(-def)"
#   }
#
# An empty string is used if the last argument does not have an associated value.
#
proc named {args} {
    upvar args upArgs
    upvar "" ""    ;# anonymous array

    if {[llength $args] == 0} {
        return -code error -level 1 "empty argument list"
    }

    try {
        array set "" $args
    } trap {TCL ARGUMENT FORMAT} {} {
        return -code error -level 1 "expecting a list of name and default value pairs"
    }

    foreach {key value} $upArgs {
        if {![info exists ($key)]} {
            return -code error -level 2 "bad option '$key', should be one of: [lsort [array names {}]]"
        }
        set ($key) $value
    }
}
