#!/usr/bin/tclsh

#
# Decrement a variable.
#
proc decr {varName {decrement 1}} {
    upvar $varName var

    # Using [expr] makes sure that negative values of decrement work correctly.
    incr var [expr {-$decrement}]
}
