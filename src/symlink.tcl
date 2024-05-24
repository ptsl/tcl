#!/usr/bin/tclsh

namespace eval symlink {
    namespace export read
    namespace ensemble create

    #
    # Retrieve the target of a symbolic link.
    #
    # This proc is a wrapper around 'file readlink'.
    # In case of an error, it returns an empty string instead of throwing an exception.
    # An empty string is illegal as a symlink target, so it can be used to indicate an error.
    #
    proc read {path} {
        try {
            return [file readlink $path]
        } on error {} {
            return ""
        }
    }
}
