#!/usr/bin/tclsh

namespace eval table {
    namespace export column row
    namespace ensemble create

    #
    # Return the index-th row as a list.
    #
    # Usage:
    #
    #   set table {
    #       {1 11 111}
    #       {2 22 222}
    #       {3 33 333}
    #   }
    #
    #   table row $table 0 -> {1 11 111}
    #   table row $table 1 -> {2 22 222}
    #   table row $table 2 -> {3 33 333}
    #
    #   # out of range
    #   table row $table 3 -> {}
    #
    #   # special indices
    #   table row $table end -> {3 33 333}
    #   table row $table 5-4 -> {2 22 222}
    #
    #   # special cases
    #   table row {} 0 -> {}
    #
    proc row {table index} {
        return [lindex $table $index]
    }

    #
    # Return the index-th column as a list.
    #
    # Usage:
    #
    #   set table {
    #       {1 11 111}
    #       {2 22 222}
    #       {3 33 333}
    #   }
    #
    #   table column $table 0 -> {1 2 3}
    #   table column $table 1 -> {11 22 33}
    #   table column $table 2 -> {111 222 333}
    #
    #   # out of range
    #   table column $table 3 -> {{} {} {}}    ;# Different from table row.
    #
    #   # special indices
    #   table column $table end -> {111 222 333}
    #   table column $table 5-4 -> {11 22 33}
    #
    #   # special cases
    #   table column {} 0 -> {}
    #
    # Missing values are returned as empty strings.
    #
    #   set table {
    #       {1}
    #       {2 22}
    #       {3 33 333}
    #   }
    #
    #   table column $table 1 -> {{} 22 33}
    #   table column $table 2 -> {{} {} 333}
    #
    proc column {table index} {
        return [lmap row $table {lindex $row $index}]
    }
}
