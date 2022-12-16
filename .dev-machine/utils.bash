fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059

  printf "\\n$fmt\\n" "$@" >&2
}

quietly_run() {
  if [[ "${VERBOSE:=0}" -eq 1 ]]; then
    "$@"
  else
    "$@" >> "/dev/null" 2>&1
  fi
}
