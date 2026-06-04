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

## Three ways to use it

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

- **One word, every time** — the simplest path, for anyone who just wants plain answers.
  Install it with a single line:

  ```bash
  curl -fsSL https://raw.githubusercontent.com/cpark4x/amplifier-bundle-plainspoken/main/install.sh | bash
  ```

  Then type `amplifier_plain` instead of `amplifier` to start a session with plain talk already
  on — it stays on the whole session, even while other modes run. The first run is a little slow
  while it sets up; after that it's quick. (You'll need Amplifier installed first; the installer
  checks and tells you if it's missing.)

  Rather read the script before running it? Download it, look it over, then run it:

  ```bash
  curl -fsSL https://raw.githubusercontent.com/cpark4x/amplifier-bundle-plainspoken/main/install.sh -o install.sh
  less install.sh
  bash install.sh
  ```

## What it won't do

It won't dumb things down — say **"go deep"** any time and you get the full technical detail
on demand. It won't soften real warnings — anything risky or irreversible still gets a blunt
heads-up first. And it's a strong nudge, not a guarantee: it keeps the rules in front of the
AI on every turn, which makes slipping rare, not impossible.

## Beyond Amplifier

The same rules ship as a portable skill in [`skills/plainspoken`](skills/plainspoken), so you can
get plain talk in other assistants too — Cursor, GitHub Copilot, Codex, Gemini CLI. Install it
with the open Agent Skills tool:

```bash
npx skills add cpark4x/amplifier-bundle-plainspoken
```

On Cursor and Copilot it can run on every turn; on Codex and Claude Code you call it up by name.

## Make it yours

Inside Amplifier, every rule lives in one readable file — [`context/plain-talk.md`](context/plain-talk.md).
Both the `/plain` switch and the always-on version pull from it, so edit that one file and they
both update. (The portable skill keeps its own copy of the same rules, so if you change one,
change the other.) Want your own spin without forking? Drop a `~/.amplifier/modes/plain.md` in
your home folder and yours wins.

## Built by

[Chris Park](https://www.linkedin.com/in/chrispark) — Microsoft Office of the CTO, AI
Incubation. Built because clear answers beat clever ones.
