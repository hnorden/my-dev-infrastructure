#!/usr/bin/awk

# https://www.gnu.org/software/gawk/manual/gawk.html

# https://www.gnu.org/software/gawk/manual/gawk.html#Multiple-Line
BEGIN {
    # record separator
    # "":       Records are separated by runs of blank lines. 
    # "\n":     Records are separated by the newline character (default).
    # regexp:   Records are separated by occurrences of characters that match regexp. Leading and trailing matches of regexp delimit empty records. (This is a gawk extension; it is not specified by the POSIX standard.)
    RS = "\n";

    # field separator
    # " ":      Default - As a special exception, this value means that any sequence of spaces, TABs, and/or newlines is a single separator.
    FS = "\n";
}

{
    #print "all in one:" $0;
    #print "cols 1-3  :" $1 "-" $2 "-" $3;

    if(NR % 2 == 0) {
        #print prev "--" $0;
        #system("echo " prev "-- \"" $0 "\"");        # '$0' containing a ';' needs to be masked
        #system("etcdctl put " prev " -- " $0);
        #system("etcdctl put " prev " -- \"" $0 "\""); # --debug=true
        system("etcdctl " etcdParams " put " prev " -- \"" $0 "\""); # --debug=true
    } else {
        prev=$0;
    }
}

END {

}
