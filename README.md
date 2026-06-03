# Plainspoken

You ask the AI a simple question and get back a wall of code talk — function names, tool
names, engineering detail you never asked for. You just wanted to know what to do next.

Plainspoken makes the AI talk like a smart friend instead of an engineer: the real answer
first, plain words, and the trade-offs of any decision spelled out so you can actually act.
The thinking stays sharp — only the jargon goes.

## What it looks like

**Without Plainspoken:**

> The context window fills and triggers compaction, so I'll persist state to a hooks-based
> JSONL event log to survive truncation across the session lifecycle.

**With Plainspoken:**

> Long chats eventually run out of room and start dropping the earliest stuff. I'll save
> your work to a file as we go, so nothing gets lost.

Same answer. One of them you can use.

## Quick start

```bash
amplifier bundle add git+https://github.com/cpark4x/amplifier-bundle-plainspoken@main
```

Start your next session and type `/plain`. That's it — the AI talks plainly until you type
`/mode off`. Takes about thirty seconds to set up.

## Two ways to use it

- **On demand** — `/plain` turns it on, `/mode off` turns it off. Best for everyday chats.
  Only one mode runs at a time, so a workflow mode will bump it.
- **Always on** — add the always-on behavior to your own bundle. It rides underneath every
  session and keeps working even while another mode is active:

```yaml
includes:
  - bundle: git+https://github.com/microsoft/amplifier-foundation@main
  - bundle: git+https://github.com/cpark4x/amplifier-bundle-plainspoken@main
  - bundle: plainspoken:behaviors/plainspoken-always-on
```

## What it won't do

It won't dumb things down — say **"go deep"** any time and you get the full technical detail
on demand. It won't soften real warnings — anything risky or irreversible still gets a blunt
heads-up first. And it's a strong nudge, not a guarantee: it keeps the rules in front of the
AI on every turn, which makes slipping rare, not impossible.

## Make it yours

Every rule lives in one readable file: [`context/plain-talk.md`](context/plain-talk.md). The
switch and the always-on version both pull from it, so edit that one file and both update.
Want your own spin without forking? Drop a `~/.amplifier/modes/plain.md` in your home folder
and yours wins.

## Built by

[Chris Park](https://www.linkedin.com/in/chrispark) — Microsoft Office of the CTO, AI
Incubation. Built because clear answers beat clever ones.
