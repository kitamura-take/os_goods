desk_con2=$(echo "[2] :desk: 2022/06/28/2107: [difbk] integrate diff & refuctor sch")
val2="../old_create_open_linux/2022/06/28/2107/bukup_create/create_open_linux/dirs/usrlocalbin/difbk_dir/difbk_lib/include_difbk_function.sh.difbk.gz";desk_con1=$(echo "[1] 2022/06/29/1324: [difbk] bug fix (diff & bk ignore exclude)");val1="../old_create_open_linux/2022/06/29/1324/bukup_create/create_open_linux/dirs/usrlocalbin/difbk_dir/difbk_lib/include_difbk_function.sh.difbk.gz";diff_con=$(colordiff -u <(zcat  "${val2}") <(zcat  "${val1}")); case "${diff_con}" in "") ;; *) echo "[1;38;5;94m[3] (2022/06/28/2107: [difbk] integrate diff & refuctor sch) ../old_create_open_linux/2022/06/28/2107/[0m" && echo -e "[38;5;88m${desk_con2}[0m\n[38;5;88m[2] ${val2}[0m\n[38;5;2m${desk_con1}[0m\n[38;5;2m[1] ${val1}[0m\n${diff_con}";;esac 
desk_con2=$(echo "[2] :desk: 2022/06/27/2145: [difbk] suttle bug fix & refuctor")
val2="../old_create_open_linux/2022/06/27/2145/bukup_create/create_open_linux/dirs/usrlocalbin/difbk_dir/exec_dfbk_bk.sh.difbk.gz";desk_con1=$(echo "[1] 2022/06/29/1324: [difbk] bug fix (diff & bk ignore exclude)");val1="../old_create_open_linux/2022/06/29/1324/bukup_create/create_open_linux/dirs/usrlocalbin/difbk_dir/exec_dfbk_bk.sh.difbk.gz";diff_con=$(colordiff -u <(zcat  "${val2}") <(zcat  "${val1}")); case "${diff_con}" in "") ;; *) echo "[1;38;5;94m[3] (2022/06/28/2107: [difbk] integrate diff & refuctor sch) ../old_create_open_linux/2022/06/28/2107/[0m" && echo -e "[38;5;88m${desk_con2}[0m\n[38;5;88m[2] ${val2}[0m\n[38;5;2m${desk_con1}[0m\n[38;5;2m[1] ${val1}[0m\n${diff_con}";;esac 
desk_con2=$(echo "[2] :desk: 2022/06/28/2107: [difbk] integrate diff & refuctor sch")
val2="../old_create_open_linux/2022/06/28/2107/bukup_create/create_open_linux/dirs/usrlocalbin/difbk_dir/exec_dfbk_diff.sh.difbk.gz";desk_con1=$(echo "[1] 2022/06/29/1324: [difbk] bug fix (diff & bk ignore exclude)");val1="../old_create_open_linux/2022/06/29/1324/bukup_create/create_open_linux/dirs/usrlocalbin/difbk_dir/exec_dfbk_diff.sh.difbk.gz";diff_con=$(colordiff -u <(zcat  "${val2}") <(zcat  "${val1}")); case "${diff_con}" in "");; *) echo "(2022/06/28/2107: [difbk] integrate diff & refuctor sch) ../old_create_open_linux/2022/06/28/2107/" && echo -e "[38;5;88m[2] ${desk_con2}[0m\n[38;5;88m[2] ${val2}[0m\n[38;5;2m[1] ${desk_con1}[0m\n[38;5;2m[1] ${val1}[0m\n${diff_con}";;esac 
