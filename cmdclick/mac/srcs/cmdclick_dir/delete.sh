#!/bin/bash

LOOP=0
# lecho "BEFORE_DELETE_CMD SIGNAL_CODE: ${SIGNAL_CODE}"
DELETE_FILE_PATH="${INI_FILE_DIR_PATH}/${EXECUTE_FILE_NAME}"
# lecho "BEFORE_DELETE_CMD DELETE_FILE_PATH: ${DELETE_FILE_PATH}"
INDEX_TITLE_TEXT_MESSAGE=${DELETE_CMD_INDEX_MESSAGE}
case "${SIGNAL_CODE}" in 
	"${DELETE_CODE}") delete_cmd ;;
esac
SIGNAL_CODE=${INDEX_CODE}
# lecho "AFTER_DELETE_CMD SIGNAL_CODE: ${SIGNAL_CODE}"