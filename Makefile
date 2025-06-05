SHELLCHECK_OPTS := -x
SHFMT_OPTS := -i 2 -d

FILES := spotlighter

.PHONY: lint format

lint:
	shfmt $(SHFMT_OPTS) $(FILES)
	shellcheck $(SHELLCHECK_OPTS) $(FILES)

format:
	shfmt -w -i 2 $(FILES)
