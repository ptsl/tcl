#!/usr/bin/tclsh

#
# A Python-like print command.
#
# Prints all arguments separated with spaces, ending with a newline character.
# If no arguments are provided, only the newline character is printed.
#
proc print {args} {
    puts [join $args " "]
}
