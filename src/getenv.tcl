#!/usr/bin/tclsh

#
# Retrieve the value of an environment variable.
#
# The default value is returned if the environment variable is not defined.
#
# If the variable exists but is set to an empty string, it is returned as such.
#
proc getenv {varName {default {}}} {
    try {
        return $::env($varName)
    } trap {TCL READ VARNAME} {} {
        return $default
    }
}
