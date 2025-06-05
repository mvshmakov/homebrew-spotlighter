# spotlighter

Manage Spotlight indexing exclusions from the command line.

## Homebrew installation

```bash
brew tap mvshmakov/spotlighter https://github.com/mvshmakov/spotlighter
brew install spotlighter
```

If you prefer installing directly from the formula file, run:

```bash
brew install https://raw.githubusercontent.com/mvshmakov/spotlighter/main/spotlighter.rb
```

## Usage

Run `spotlighter add` to scan the current directory for development folders (like
`node_modules` or Python virtual environments) and add them to the Spotlight
exclusions list:

```bash
spotlighter add
```

View existing exclusions:

```bash
spotlighter show
```

For all available commands, run:

```bash
spotlighter -h
```
