#!/usr/bin/env bash
set -euo pipefail

FORMULA="spotlighter.rb"

url=$(grep -E "^\s*url\s+\"" "$FORMULA" | cut -d\" -f2)
commit=""

if [[ "$url" =~ archive/([a-f0-9]{40})\.tar\.gz$ ]]; then
  commit="${BASH_REMATCH[1]}"
fi

if [ -z "$commit" ]; then
  echo "Could not parse commit from $FORMULA" >&2
  exit 1
fi

if ! curl -fsL -o /dev/null "https://api.github.com/repos/mvshmakov/spotlighter/commits/$commit"; then
  echo "Referenced commit $commit not found upstream" >&2
  exit 1
fi

if ! curl -fsI "$url" >/dev/null; then
  echo "Tarball URL $url is not accessible" >&2
  exit 1
fi

echo "Formula validation successful"
