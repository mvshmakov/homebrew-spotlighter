# spotlighter

Manage Spotlight indexing exclusions from the command line.

## Homebrew installation

```bash
brew tap mvshmakov/spotlighter
brew install spotlighter
```

If you prefer installing directly from the formula file, run:

```bash
brew install https://raw.githubusercontent.com/mvshmakov/homebrew-spotlighter/main/spotlighter.rb
```

## Usage

Run `spotlighter add` to scan the current directory for common development
folders such as `node_modules` or Python virtual environments and add them to
the Spotlight exclusions list:

```bash
spotlighter add
```

To process a different directory:

```bash
spotlighter add -d ~/Projects/myapp
```

Rebuild the exclusions from scratch:

```bash
spotlighter -f add
```

Check the current indexing status:

```bash
spotlighter check
```

View existing exclusions:

```bash
spotlighter show
```

For all available commands, run:

```bash
spotlighter -h
```

Generate shell completion scripts:

```bash
spotlighter completions bash > /usr/local/etc/bash_completion.d/spotlighter
spotlighter completions zsh > /usr/local/share/zsh/site-functions/_spotlighter
```
