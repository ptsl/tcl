#!/usr/bin/tclsh

#
# Return ANSI escape color codes.
#
proc color {name} {
    set colors {
        normal       "\033\[0m"
        black        "\033\[0;30m"
        red          "\033\[0;31m"
        green        "\033\[0;32m"
        brown        "\033\[0;33m"
        blue         "\033\[0;34m"
        magenta      "\033\[0;35m"
        cyan         "\033\[0;36m"
        lightgray    "\033\[0;37m"
        darkgray     "\033\[1;30m"
        lightred     "\033\[1;31m"
        lightgreen   "\033\[1;32m"
        yellow       "\033\[1;33m"
        lightblue    "\033\[1;34m"
        lightmagenta "\033\[1;35m"
        lightcyan    "\033\[1;36m"
        white        "\033\[1;37m"
    }

    return [dict get $colors $name]
}

#
# ANSI escape color codes.
#
# Arguments:
#     which: a numeric color code, or a symbolic name
#
# Switches:
#     -bg:   set the background color
#
proc color {which args} {
    if {[string is digit -strict $which]} {
        if {$which > 255} {
            error "color number out of range: $which (expected: 0 <= n <= 255)"
        }

        if {"-bg" in $args} {
            return "\033\[48;5;${which}m"
        } else {
            return "\033\[38;5;${which}m"
        }
    }


    # set colors {
    #     normal       "\033\[0m"
    #     black        "\033\[0;30m"
    #     red          "\033\[0;31m"
    #     green        "\033\[0;32m"
    #     brown        "\033\[0;33m"
    #     blue         "\033\[0;34m"
    #     magenta      "\033\[0;35m"
    #     cyan         "\033\[0;36m"
    #     lightgray    "\033\[0;37m"
    #     darkgray     "\033\[1;30m"
    #     lightred     "\033\[1;31m"
    #     lightgreen   "\033\[1;32m"
    #     yellow       "\033\[1;33m"
    #     lightblue    "\033\[1;34m"
    #     lightmagenta "\033\[1;35m"
    #     lightcyan    "\033\[1;36m"
    #     white        "\033\[1;37m"
    # }

    # return [dict get $colors $symbolicName]
}
