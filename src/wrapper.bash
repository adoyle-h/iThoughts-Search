## script wrapper

Wrapper__interrupt() {
    # @description signal handler for SIGINT
    echo "SIGINT caught"
    exit
}

Wrapper__termination() {
    # @description signal handler for SIGTERM
    echo "SIGTERM caught"
    exit
}

Wrapper__exit() {
    # @description signal handler for end of the program (clean or unclean).
    # probably redundant call, we already call the cleanup in main.
    exit
}

# DESC: Handler for unexpected errors
Wrapper__catch_err() {
  # Disable the error trap handler to prevent potential recursion
  trap - ERR

  # Consider any further errors non-fatal to ensure we run to completion
  set +o errexit
  set +o pipefail

  local exit_code=${1:-1}

  echo "Exception: catch error with exit_code=$exit_code"

  # Exit with failure status
  if [[ $# -eq 1 && $exit_code =~ ^[0-9]+$ ]]; then
    exit "$exit_code"
  else
    exit 1
  fi
}


# DESC: Generic script initialisation
Wrapper_init() {
  # Useful paths
  readonly orig_cwd="$PWD"
  readonly script_path="${BASH_SOURCE[0]}"
  readonly script_dir="$(dirname "$script_path")"
  readonly script_name="$(basename "$script_path")"
}

Wrapper_gen_completion() {
  cat "$script_completion"
}

wrapper() {
  trap Wrapper__interrupt INT
  trap Wrapper__termination TERM
  trap Wrapper__exit EXIT
  trap Wrapper__catch_err ERR

  local entrypoint=main
  local filepath=$1
  local _args=(${@:2})

  Wrapper_init

  [[ ${2:-} == '--completion' ]] && Wrapper_gen_completion && exit 0

  "$filepath" "${_args[@]}"
}
