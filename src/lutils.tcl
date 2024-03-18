#!/usr/bin/tclsh

#
# Print list items on separate lines.
#
# Arguments:
#     mylist: a list to print
#     indent: a number of spaces to indent the items with (default: no indent)
#
proc lprint {mylist {indent 0}} {
    set whitespace [string repeat " " $indent]

    foreach item $mylist {
        puts [string cat $whitespace $item]
    }
}
