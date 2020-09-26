#!/bin/bash

# https://github.com/dakuten/taskwarrior-polybar

# TODO: Fix active task not showing when change context
# current_context=`task _get rc.context`

# task context none > /dev/null 2>&1

active_desc=`task rc.verbose: rc.report.active.columns:description rc.report.active.labels:1 limit:1 active`
active_id=`task rc.verbose: rc.report.active.columns:id rc.report.active.labels:1 limit:1 active`

most_urgent_desc=`task rc.verbose: rc.report.next.columns:description rc.report.next.labels:1 limit:1 next`
most_urgent_id=`task rc.verbose: rc.report.next.columns:id rc.report.next.labels:1 limit:1 next`
# most_urgent_due=`task rc.verbose: rc.report.next.columns:due.relative rc.report.next.labels:1 limit:1 next`

if [ -n "$active_id" ]
then
    echo "$active_id" > /tmp/tw_polybar_id
    echo "(active) id: $active_id - $active_desc"
else
    echo "$most_urgent_id" > /tmp/tw_polybar_id
    echo "id: $most_urgent_id - $most_urgent_desc"
fi

# task context $current_context > /dev/null 2>&1
