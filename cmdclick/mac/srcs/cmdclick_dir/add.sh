#!/bin/bash

# lecho "BEFORE_CREATE_COMMAND_FORM SIGNAL_CODE: ${SIGNAL_CODE}"
LOOP=0
CMD_CLICK_ADD_TITLE="${ADD_COMMAND_MESSAGE}"
create_command_form
# lecho "AFTER_CREATE_COMMAND_FORM SIGNAL_CODE: ${SIGNAL_CODE}"
SIGNAL_CODE=${INDEX_CODE}
# lecho "AFTER_ADD_CMD_INI_FILE SIGNAL_CODE: ${SIGNAL_CODE}"