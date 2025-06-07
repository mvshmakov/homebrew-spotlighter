# Repo Instructions

- Always run `make lint` and `make check` before committing any changes.
- Do not modify the CI workflow except to keep it in sync with these commands.
- When updating `spotlighter.rb`, ensure that the tarball URL references a valid commit in the upstream repository. The `make check` target verifies this automatically.
