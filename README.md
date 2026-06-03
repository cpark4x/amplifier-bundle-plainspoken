# Plainspoken

A tiny Amplifier bundle that makes the AI talk like a normal human — plain language,
real substance, no technical or engineering jargon.

It's for people who want clear answers they can act on, without wading through code
talk, product names, and engineering detail they didn't ask for.

## What it does

The AI:

- Leads with the answer and what it means for *you* — you can stop after the first line.
- Uses plain words, but never dumbs down the thinking.
- Spells out the real trade-offs on every decision, and makes a recommendation.
- Makes the call instead of peppering you with questions.
- Warns you flat and clear before anything risky or irreversible.
- Drops all of it and gives you full technical detail the moment you say **"go deep."**

## Install

```bash
amplifier bundle add git+https://github.com/YOURNAME/amplifier-bundle-plainspoken@main
```

To have `/plain` available in every session on every machine, register it globally:

```yaml
# ~/.amplifier/settings.yaml
bundles:
  - source: git+https://github.com/YOURNAME/amplifier-bundle-plainspoken@main
```

## Two ways to use it

**On demand:** `/plain` turns it on, `/mode off` turns it off. Only one mode runs at a
time, so a workflow mode will bump it.

**Always on:** add the `plainspoken:behaviors/plainspoken-always-on` behavior to your
own bundle. It runs every turn and survives other modes. See `bundle.md` for the snippet.

## Customize

Every rule lives in one readable file: [`context/plain-talk.md`](context/plain-talk.md).
The mode and the always-on behavior both pull from it — edit that one file and both
update. Want your own spin without forking? Drop a `~/.amplifier/modes/plain.md` in your
home folder and it takes precedence.

## License

MIT
