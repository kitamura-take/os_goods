#!/bin/bash
opt_number=0
# option analsys -----------------------------------------------------
alt_option="alt"
general_con=$(echo "${GENERAL_OPTION}" | tr ',' '\n' | tr '|' '\t')
alt_option_con=($(read_opt_val "${general_con}" "${alt_option}"))
# ---------------------------------------------------------------------
case "${#alt_option_con[@]}" in "2") opt_number=1;; esac
case "${opt_number}" in 
	"1")
		# get desti dir path --------------------------------------------
		desti_dir_name="${alt_option_con[0]}"
		sed_desti_dir_name="${desti_dir_name//\//\\\/}"
		case "${alt_option_con[1]}" in 
			"") echo "must be specified buckup dir name"; exit 0 ;;
			"-")	
				case "$(echo "${alt_option_con[0]}" | rga "/")" in "");;
					*) echo echo "must be specified buckup dir path"; exit 0;; esac
				desti_buckup_dir_name="${OLD_PREFIX}_${alt_option_con[0]}" ;;
			*) desti_buckup_dir_name="${alt_option_con[1]}" ;; esac
		sed_desti_buckup_dir_name="${desti_buckup_dir_name//\//\\\/}"
		# -----------------------------------------------------------------
		# mkdir to desti --------------------------------------------------
		bk_dir_paths=$(fd -IH -t d . "${BUCK_UP_DIR_PATH}" | sed "s/^${SED_TARGET_PAR_DIR_PATH}//" | sort -r)
		mkdir_cmd_path="${DFBK_SETTING_DIR_PATH}/mrg_mkdir_cmd.sh"
		echo "${bk_dir_paths}" | replace_desti_path "${sed_desti_dir_name}" "${sed_desti_buckup_dir_name}" | sed -r 's/(.*)/mkdir -p "\.\.\1" \&/' | sed "$ a wait" > "${mkdir_cmd_path}" ;wait
		bash "${mkdir_cmd_path}"; wait
		# -----------------------------------------------------------------
		# cp to desti -----------------------------------------------------
		cp_cmd_path="${DFBK_SETTING_DIR_PATH}/mrg_cp_cmd.sh"
		bk_file_paths=$(fd -IH -t f . "${BUCK_UP_DIR_PATH}" | sed "s/^${SED_TARGET_PAR_DIR_PATH}//" | sort -r)
		bk_file_dest_paths=$(echo "${bk_file_paths}" | replace_desti_path "${sed_desti_dir_name}" "${sed_desti_buckup_dir_name}")
		paste <(echo "${bk_file_paths}")  <(echo "${bk_file_dest_paths}") | sed -r 's/^(.*)\t(.*)$/cp -arvf "\.\.\1" "\.\.\2" \&/' | sed "$ a wait" > "${cp_cmd_path}"; wait
		bash "${cp_cmd_path}"; wait
		# -----------------------------------------------------------------
		# remage merge list -----------------------------------------------
		remake_mrg_ls_cmd_path="${DFBK_SETTING_DIR_PATH}/remake_mrg_ls_cmd.sh"
		cat <(echo 'sed_desti_dir_name='${sed_desti_dir_name}';sed_desti_buckup_dir_name='${sed_desti_buckup_dir_name}'; replace_desti_path(){ cat "/dev/stdin"  | sed -r "s/^(\/'${BUCK_UP_DIR_NAME}'\/[0-9]{4}\/[0-9]{2}\/[0-9]{2}\/[0-9]{4}\/'${BACKUP_CREATE_DIR_NAME}')\/'${TARGET_DIR_NAME}'/\1\/${1}/" | sed "s/\/\//\//g" | sed "s/^\/'${BUCK_UP_DIR_NAME}'/\/${2}/";}') \
		<(echo "${bk_file_dest_paths}" | rga "^/${desti_buckup_dir_name}/[0-9]{4}/[0-9]{2}/[0-9]{2}/[0-9]{4}/${BUCKUP_MERGE_CONTENSTS_LIST_DIR_NAME}/${BUCKUP_MERGE_CONTENSTS_LIST_FILE_NAME}" | sed -r 's/(.*)/mrg_ls_path="\.\.\1" \&\& mrg_ls_con\=\$(zcat "\$\{mrg_ls_path\}"\) \&\& paste \<\(echo "\$\{mrg_ls_con\}"\)  \<\(echo "\$\{mrg_ls_con\}" \| cut \-f2  \| replace_desti_path "\$\{sed_desti_dir_name\}" "\$\{sed_desti_buckup_dir_name\}"\) \| sed -r "s\/^\(\.\*\)\\t\(\.\*\)\\t\(\.\*\)\$\/\\1\\t\\3\/" \| gzip -c \> "\$\{mrg_ls_path\}" \&/') | sed "$ a wait" > "${remake_mrg_ls_cmd_path}"
		bash "${remake_mrg_ls_cmd_path}"
		# -----------------------------------------------------------------
esac
exit 0