#!/bin/bash

SEARCH_WINDOW="thunar.Thunar"
ACTIVATE_ACTIVE_WINDOW_ID=$(wmctrl -xl | grep "${SEARCH_WINDOW}" | tail -n -1 | awk '{print $1}')
if [ -n "${ACTIVATE_ACTIVE_WINDOW_ID}" ]; then
	wmctrl -i -a ${ACTIVATE_ACTIVE_WINDOW_ID}
else
	thunar &
	wmctrl -i -a $(wmctrl -xl | grep "${SEARCH_WINDOW}" | tail -n -1 | awk '{print $1}')
fi