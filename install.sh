#!/usr/bin/env bash
#
# Plainspoken installer — puts the `amplifier_plain` command on your PATH so you
# can start a plain-talk Amplifier session by typing one word.
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/cpark4x/amplifier-bundle-plainspoken/main/install.sh | bash
#
# Prefer to read it first (recommended):
#   curl -fsSL https://raw.githubusercontent.com/cpark4x/amplifier-bundle-plainspoken/main/install.sh -o install.sh
#   less install.sh
#   bash install.sh

set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/cpark4x/amplifier-bundle-plainspoken/main"
SCRIPT_URL="${REPO_RAW}/bin/amplifier_plain"
INSTALL_DIR="${HOME}/.local/bin"
TARGET="${INSTALL_DIR}/amplifier_plain"

ok()   { printf '  \xe2\x9c\x93 %s\n' "$1"; }
info() { printf '    %s\n' "$1"; }
warn() { printf '  ! %s\n' "$1" >&2; }
die()  { printf '\nPlainspoken install failed: %s\n\n' "$1" >&2; exit 1; }

printf '\nInstalling Plainspoken (amplifier_plain)...\n\n'

# curl is needed to fetch the command.
command -v curl >/dev/null 2>&1 || die "curl is required but was not found."

# Amplifier must already be installed — Plainspoken runs on top of it.
# Detect and direct; never bootstrap someone else's toolchain.
if ! command -v amplifier >/dev/null 2>&1; then
  warn "Amplifier isn't installed yet."
  info "Plainspoken runs on top of Amplifier, so install that first:"
  info "  https://github.com/microsoft/amplifier"
  info "Then run this installer again."
  die "Amplifier not found on your PATH."
fi
ok "Found Amplifier"

# Download the command to a temp file, sanity-check it, then move into place.
mkdir -p "${INSTALL_DIR}"
tmp="$(mktemp)"
trap 'rm -f "${tmp}"' EXIT
curl -fsSL "${SCRIPT_URL}" -o "${tmp}" || die "could not download amplifier_plain."
head -n 1 "${tmp}" | grep -q '^#!/usr/bin/env bash' \
  || die "the downloaded file doesn't look right; nothing was installed."
mv "${tmp}" "${TARGET}"
chmod +x "${TARGET}"
ok "Installed to ${TARGET}"

# Make sure the install folder is somewhere the shell will look for commands.
case ":${PATH}:" in
  *":${INSTALL_DIR}:"*)
    ok "${INSTALL_DIR} is on your PATH"
    NEEDS_PATH=0
    ;;
  *)
    NEEDS_PATH=1
    ;;
esac

printf '\nDone.\n\n'
if [ "${NEEDS_PATH}" = "1" ]; then
  warn "One more step: ${INSTALL_DIR} isn't on your PATH yet."
  info "Add this line to your shell startup file (~/.zshrc or ~/.bashrc),"
  info "then open a new terminal window:"
  info ""
  info "  export PATH=\"\$HOME/.local/bin:\$PATH\""
  info ""
fi
printf 'Start a plain-talk session any time with:\n\n  amplifier_plain\n\n'
printf 'To remove it later:  rm %s\n\n' "${TARGET}"
