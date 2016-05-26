#!/usr/bin/env bash

export PEPP_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
export DOCOPTS="${PEPP_PATH}/external/docopts"

pepp() {
	local pepp_help="\
Pepp meta CLI.

Usage:
	pepp update

Options:
	-h | --help  Show this help"

	pepp-update() {
		git -C "${PEPP_PATH}" pull
	}

	eval "$("${DOCOPTS}" -h "${pepp_help}" : "$@")"

	if [[ "${update}" ]]; then
		pepp-update
	fi
}
