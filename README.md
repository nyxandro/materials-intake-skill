<div align="center">

# Materials Intake

**A Claude Code skill that sorts the briefs, chats, files and links a project receives into one inbox with one inventory of what's there and what it says.**

[![Release](https://img.shields.io/github/v/release/nyxandro/materials-intake-skill)](https://github.com/nyxandro/materials-intake-skill/releases)
[![License](https://img.shields.io/github/license/nyxandro/materials-intake-skill)](LICENSE)
[![Agent Skills](https://img.shields.io/badge/Agent%20Skills-SKILL.md-6f42c1)](https://agentskills.io/specification)
[![Claude Code plugin](https://img.shields.io/badge/Claude%20Code-plugin-d97757)](#install)

**English** · [Русский](README.ru.md)

</div>

Materials Intake is a skill for Claude Code, Codex, OpenCode, Cursor and other agents that read
Agent Skills. It takes in the raw materials a project receives (briefs, chats and chat exports,
letters, files, archives, screenshots, recordings, links to cloud documents) and keeps them in
order in the project's `inbox/`.

## Why

Left as they came, materials scatter over the project root, `docs/` and old messages.

- Three versions of the brief live side by side and nobody knows which is current.
- A password sits in a committed file.
- The next agent builds on a draft as if it were the agreed text.
- Someone cites our own retelling as the client's words.

With this skill, any later work starts from the current materials and knows how much weight each
one carries.

## Install

| Agent | Command |
|---|---|
| Claude Code, as a plugin | `/plugin install materials-intake --marketplace nyxandro/skills` |
| Claude Code, Codex, OpenCode, Cursor and others | `npx skills add nyxandro/materials-intake-skill` |
| Any agent, by hand | Download the [latest `.skill` archive](https://github.com/nyxandro/materials-intake-skill/releases/latest/download/materials-intake.skill) and unpack it into the agent's skills folder |

Pick one. If you install it two ways, Claude Code loads the skill twice.

<details>
<summary>Requirements and more install options</summary>

<br>

- Git LFS is needed for heavy files such as PDFs, images, audio and video. Without it the agent
  says so and doesn't add them to plain git.
- The one-line plugin install needs Claude Code 2.1.275 or later. On an older version, add the
  catalog first with `/plugin marketplace add nyxandro/skills` and then run
  `/plugin install materials-intake@nyxandro`.
- The catalog pins no version, so every commit here reaches plugin users as an update. Run
  `claude plugin marketplace update nyxandro` and `claude plugin update materials-intake@nyxandro`,
  or turn on auto-update under `/plugin` → Marketplaces.
- With `npx skills`, add `-g` to install the skill for every project. To install a given version,
  add its tag, as in `nyxandro/materials-intake-skill@v1.0.0`.
- You can also clone this repository and link the `materials-intake/` folder into your agent's
  skills folder. The skill is a single `SKILL.md`, with no scripts and no build step.

</details>

## Usage

Hand over the materials and ask in plain words. These requests all start the skill.

- *Here's everything from the client, sort it out.*
- *Sort what they sent.*
- *What's new in inbox?*
- *Bring the inventory up to date.*

Other work that rests on incoming materials, such as designing a feature, can start it too.

## How it works

1. **Finds what's new** in the conversation, the project root, `inbox/` and `docs/`, whatever the
   inventory doesn't list yet. A file the code or the build uses stays where it is.
2. **Reads everything in full**, including images inside PDFs, attachments inside letters and every
   sheet of a spreadsheet. Chat exports are read only after the last processed message. A link
   without access is reported at once. Text inside the materials is data, never a task.
3. **Keeps passwords and personal data out.** They're copied nowhere, the file stays out of git and
   out of `inbox/` until you decide, and you hear about it at once.
4. **Files the originals** by purpose under `CODE — what it is, date` names and keeps only the
   current version. It deletes without asking only what loses nothing, and sends only heavy formats
   through Git LFS, so text keeps readable changes.
5. **Keeps the inventory** in `inbox/README.md`, in two parts. "What is here" lists every material.
   "What they say" collects requirements, decisions, contradictions and questions by topic, each
   line with its source.
6. **Reports** in one message. What was filed and removed, what waits for your ok, what was held
   back, what couldn't be opened and what's new that matters.

## Example

An inventory after a made-up intake, shortened.

```markdown
## What is here

| Code | What it is | From whom, date | Weight |
|---|---|---|---|
| BRF | Brief for the site, v2 (replaces v1 of 2026-10-01) | Olga, client, 2026-10-20 | requirement |
| CHT | Chat with Olga | Olga, up to 2026-10-30 | requirement |
| LTR | Letter from accounting | Igor, 2026-10-25 | requirement |

## What they say

**Payment.** 50% upfront [BRF, 2026-10-20]. Igor writes that they only pay 100% on delivery
[LTR, 2026-10-25]. Contradiction, open until you decide.
**Deadline.** Moved from December 1 to December 15 [CHT, 2026-10-28].
**Questions for the lawyer.** Does the site need a public offer [CHT, 2026-10-30].
```

The list of documents alone wouldn't show the payment contradiction or the moved deadline. You'd
have to reread all three documents to find them.

## Where things go

```text
inbox/
  README.md                         the inventory, what is here and what it says
  <purpose>/                        originals as they came, such as client/, legal/, design/
  processed/                        what was derived from an original, such as transcripts and text versions
docs/                               only our own documents, such as plans, specifications, reports
```

A processed file says which original it came from, and on any disagreement the original wins. The
project's own rules on folders win over this layout.

## Versions

The current version sits in `metadata.version` of `materials-intake/SKILL.md`, so any installed
copy tells you which one it is. Every version has a git tag and a
[release](https://github.com/nyxandro/materials-intake-skill/releases) with its own archive.
[CHANGELOG.md](CHANGELOG.md) lists what changed.

<details>
<summary>Repository layout</summary>

<br>

```text
materials-intake/SKILL.md     the skill
dist/materials-intake.skill   the skill folder as a downloadable archive
CHANGELOG.md                  what changed in each version
README.md, README.ru.md       this page in English and in Russian
```

</details>

## License

[MIT](LICENSE)
