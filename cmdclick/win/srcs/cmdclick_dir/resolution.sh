#!/bin/bash

LOOP=0
# lecho "BEFORE_RESOLUTION_CMD SIGNAL_CODE: ${SIGNAL_CODE}"
# lecho "BEFORE_RESOLUTION_CMD INI_FILE_DIR_PATH: ${INI_FILE_DIR_PATH}"
# lecho "BEFORE_RESOLUTION_CMD EXECUTE_FILE_NAME: ${EXECUTE_FILE_NAME}"
resolution_cmd
SIGNAL_CODE=${INDEX_CODE}
# lecho "AFTER_RESOLUTION_CMD SIGNAL_CODE: ${SIGNAL_CODE}"