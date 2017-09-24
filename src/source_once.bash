source_once() {
  local filepath="$1:?"
  if [[ -v "_sourced_${filepath}" ]]; then
    return
  fi

  # shellcheck disable=SC1090
  source "$filepath"
  readonly "_sourced_${filepath}"=1
}
