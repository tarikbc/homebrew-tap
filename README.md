# tarikbc/homebrew-tap

A Homebrew tap for [browser2zen](https://github.com/tarikbc/browser2zen).

## Install

```bash
brew tap tarikbc/tap
brew install --cask browser2zen
```

That's it. After installation, launch `browser2zen` from Spotlight or
`/Applications`. First-run notes (the unsigned-app dialog dance) are in
[the project README](https://github.com/tarikbc/browser2zen#macos-apple-silicon).

## Update

```bash
brew upgrade --cask browser2zen
```

The cask is updated automatically on every browser2zen release via
GitHub Actions (`.github/workflows/release.yml` in the main repo opens
a PR here with the new version + sha256 on each tag push).

## Uninstall

```bash
brew uninstall --cask browser2zen
```

This removes the app and the `~/Library/Application Support/browser2zen`
support directory. Your Zen Browser profile and any backups
browser2zen wrote alongside it are left untouched.

## Why a tap and not the official homebrew-cask?

A submission to `homebrew/homebrew-cask` is also in flight; this tap is
the fast path while that PR is reviewed. Once the cask lands upstream,
both routes will keep working in lockstep.

## Casks

- [`browser2zen`](Casks/browser2zen.rb)
