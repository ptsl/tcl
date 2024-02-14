#!/usr/bin/tclsh

#
# Show the error message and error code of the provided script.
#
# Arguments:
#     script: a script to evaluate
#
# Usage:
#
#     showerror {expr 2 + 2}
#     showerror {expr 2 / 0}
#     showerror {file copy aaa bbb}
#
proc showerror {script} {
    set ret [catch $script result options]

    if {$ret == 0} {
        puts "result: $result"
    } else {
        puts "errmsg:    $result"
        puts "errorcode: [dict get $options "-errorcode"]"
    }
}
