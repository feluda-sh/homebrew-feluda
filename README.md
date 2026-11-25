# feluda Homebrew tap

Homebrew formulas for [feluda](https://github.com/feluda-sh/cli) — the
terminal-native operator surface for the Feluda AI code reviewer.

## Install

```bash
brew install feluda-sh/feluda/feluda
```

The formula is published automatically by the release workflow in
[`feluda-sh/cli`](https://github.com/feluda-sh/cli) on every `v*` tag.
It installs the `feluda` binary from the matching GitHub Release.

## Available versions

```bash
brew info feluda-sh/feluda/feluda
brew list --versions feluda-sh/feluda/feluda
```

To upgrade:

```bash
brew update && brew upgrade feluda-sh/feluda/feluda
```

## Supported platforms

The formula ships macOS and Linux binaries for both Apple Silicon and
Intel. Windows binaries are published on the
[GitHub Release](https://github.com/feluda-sh/cli/releases/latest) but
are not installable through Homebrew.

## Other install methods

See the [install guide](https://github.com/feluda-sh/cli/blob/main/docs/ops/install.md)
for the one-line installer, pre-built archives, and `cargo install
--path .` from source.

## License

The formula in this repository is licensed under the
[Apache-2.0 license](https://github.com/feluda-sh/cli/blob/main/LICENSE).
The `feluda` binary it installs carries the same license.
