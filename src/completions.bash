_itmz_get_available_dirs() {
  local dirs=($(find "$ITMZ_DIR" -not -name '\.*' -and -type d -depth 1 -exec basename {} \;))
  echo "${dirs[@]}"
}


_comp_itmz() {
  local dir_list
  dir_list=$(_itmz_get_available_dirs)
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "${dir_list[@]}" -- $cur) )
}

complete -F _comp_itmz itmz
