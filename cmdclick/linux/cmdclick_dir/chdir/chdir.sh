#!bin/bash

CHDIR_SIGNAL_CODE=${INDEX_CODE}
CTRL_CHDIR_PATH="${SOURCE_DIR_PATH}/chdir"

while true :
do 
	if [ ${CHDIR_SIGNAL_CODE} -eq ${INDEX_CODE} ];then
		# lecho "CHDIR_INDEX_CODE: ${INDEX_CODE}"
		CHDIR_LOOP=0
		#if [ ! -e "${CMDCLICK_CONF_DELETE_CMD_PATH}" ];then touch "${CMDCLICK_CONF_DELETE_CMD_PATH}"; fi
		#if [ ! -e "${CMDCLICK_CONF_ADD_CMD_PATH}" ];then touch "${CMDCLICK_CONF_ADD_CMD_PATH}"; fi
		#if [ ! -e "${CMDCLICK_CONF_EDIT_CMD_PATH}" ];then touch "${CMDCLICK_CONF_EDIT_CMD_PATH}"; fi
		#index立ち上げ
		INDEX_TITLE_TEXT_MESSAGE=${INDEX_CD_DIR_CMD_MESSAGE}
		echo "${CMDCLICK_CONF_DIR_PATH}"
		input_cmd_index "${CMDCLICK_CONF_DIR_PATH}"
		CHDIR_SIGNAL_CODE=${SIGNAL_CODE}
		# lecho "AFTER_INDEX CHDIR_SIGNAL_CODE: ${CHDIR_SIGNAL_CODE}"
	fi

	if [ ${CHDIR_SIGNAL_CODE} -eq ${ADD_CODE} ]; then
		CHDIR_LOOP=0
		. ${CTRL_CHDIR_PATH}/exec_add_chdir.sh
		CHDIR_SIGNAL_CODE=${SIGNAL_CODE}
	fi

	if [ ${CHDIR_SIGNAL_CODE} -eq ${OK_CODE} ]; then
		CHDIR_LOOP=0
		INI_FILE_DIR_PATH=$CMDCLICK_CONF_DIR_PATH
		. ${SOURCE_DIR_PATH}/execute.sh
		echo "${GREP_INC_NUM}=1" > "${CMDCLICK_CONF_INC_CMD_PATH}"
		CHDIR_SIGNAL_CODE=${FORCE_EXIT_CODE} #${SIGNAL_CODE}
	fi

	if [ ${CHDIR_SIGNAL_CODE} -eq ${EDIT_CODE} ]; then
		CHDIR_LOOP=0
		INI_FILE_DIR_PATH=$CMDCLICK_CONF_DIR_PATH
		. ${SOURCE_DIR_PATH}/edit.sh
		CHDIR_SIGNAL_CODE=${SIGNAL_CODE} #${SIGNAL_CODE}
	fi

	if [ ${CHDIR_SIGNAL_CODE} -eq ${DELETE_CODE} ]; then
		CHDIR_LOOP=0
		INI_FILE_DIR_PATH=$CMDCLICK_CONF_DIR_PATH
		. ${SOURCE_DIR_PATH}/delete.sh
		CHDIR_SIGNAL_CODE=${SIGNAL_CODE}
	fi


	if [ ${CHDIR_SIGNAL_CODE} -ge ${FORCE_EXIT_CODE} ] || [ ${CHDIR_SIGNAL_CODE} -eq ${EXIT_CODE} ]; then
		CHDIR_LOOP=0
		SIGNAL_CODE=${INDEX_CODE}
		# lecho "chdir FORCE_EXIT_CODE ${EXIT_CODE} SIGNAL_CODE: ${CHDIR_SIGNAL_CODE}"
		break
	fi

	if [ ${CHDIR_LOOP} -eq 5 ]; then
		# lecho "EXIT_CODE: ${CHDIR_SIGNAL_CODE}"
		break
	fi
	CHDIR_LOOP=$(expr ${CHDIR_LOOP} + 1)
done