#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /work/shared/users/ugrad/dnd29/hdc_DDY/hdc_isolet/out.prj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
