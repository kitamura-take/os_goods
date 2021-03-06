#!/bin/bash

LANG="ja_JP.UTF-8"
LOOP=0
# echo "BEFORE_EDIT_INI_GUI SIGNAL_CODE: ${SIGNAL_CODE}"
# echo "BEFORE_CHECK_INI_FILE INI_FILE_DIR_PATH: ${INI_FILE_DIR_PATH}"
# echo "BEFORE_CHECK_INI_FILE EXECUTE_FILE_NAME: ${EXECUTE_FILE_NAME}"
# echo "BEFORE_CHECK_INI_FILE EDIT_FILE_PATH: ${EDIT_FILE_PATH}"
EDIT_FILE_PATH="${INI_FILE_DIR_PATH}/${EXECUTE_FILE_NAME}"
check_ini_file "${INI_FILE_DIR_PATH}/${EXECUTE_FILE_NAME}"
case "${SIGNAL_CODE}" in 
	"${CHECK_ERR_CODE}") SIGNAL_CODE=${INDEX_CODE};;
	*) edit_ini_gui "${EXECUTE_FILE_NAME}" ;;
esac
SIGNAL_CODE=${INDEX_CODE}
# echo "AFTER_EDIT_INI_GUI SIGNAL_CODE: ${SIGNAL_CODE}"