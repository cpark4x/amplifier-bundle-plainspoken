---
bundle:
  name: plainspoken
  version: 1.0.0
  description: Plain-language communication style — /plain to activate, or always-on
  license: MIT

includes:
  - bundle: git+https://github.com/microsoft/amplifier-bundle-modes@main
---

# Plainspoken

Makes the AI talk like a normal human — plain language, real substance, no
technical or engineering jargon.

## Two ways to use it

**On demand (a switch):** type `/plain` to turn it on, `/mode off` to turn it off.
Good for everyday chats. Note: only one mode runs at a time, so a workflow mode
(like a superpowers phase) will bump it.

**Always on (no toggle):** add the always-on behavior to your own bundle. It rides
underneath everything — every session, every turn — and keeps working even while a
workflow mode is active:

```yaml
includes:
  - bundle: git+https://github.com/microsoft/amplifier-foundation@main
  - bundle: git+https://github.com/YOURNAME/amplifier-bundle-plainspoken@main
  - bundle: plainspoken:behaviors/plainspoken-always-on
```

## Make it yours

All the communication rules live in one file: `context/plain-talk.md`. Both the mode
and the always-on behavior pull from it, so change that one file and everything
updates. To override the rules for just yourself without forking, drop your own
`~/.amplifier/modes/plain.md` — your version wins.
