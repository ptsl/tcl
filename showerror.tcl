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
    set code [catch $script result options]

    if {$code == 0} {
        puts "result: $result"
    } else {
        puts "errmsg:    $result"
        puts "errorcode: [dict get $options "-errorcode"]"
    }
}
