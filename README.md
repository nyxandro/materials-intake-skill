# Materials Intake Skill

[![Download Materials Intake Skill](https://img.shields.io/badge/Download-materials--intake.skill-blue?style=for-the-badge)](https://github.com/nyxandro/materials-intake-skill/raw/main/dist/materials-intake.skill)

A skill for Claude Code, Codex and OpenCode that takes in the raw materials a project receives —
briefs, chats and chat exports, letters, files, archives, screenshots, recordings, links to cloud
documents — and keeps them in order in the project's `inbox/`: one place for the originals, one
inventory of what is there and one digest of what they say.

Left as they came, materials scatter over the project root, `docs/` and old messages. Three
versions of the brief live side by side and nobody knows which is current; a password sits in a
committed file; the next agent builds on a draft as if it were the agreed text, or cites a
retelling as the client's words. With this skill, any later work starts from the current
materials and knows how much weight each one carries.

## When it runs

When the owner hands over materials or asks to sort them: "here is everything from the client,
sort it out", "what is new in inbox", "bring the inventory up to date". Other skills call it when
their work rests on incoming materials: [feature-blueprint](https://github.com/nyxandro/feature-blueprint-skill)
runs it at its first step, before designing a feature.

## What the agent does

1. **Finds what is new** in the conversation, the project root, `inbox/` and `docs/`: whatever the
   inventory does not list. A file the code or the build uses stays where it is.
2. **Reads everything in full**, including images inside PDFs, attachments inside letters and
   every sheet of a spreadsheet; chat exports only after the date they were processed up to;
   recordings through the meeting-summary skill when it is available. A link without access is
   reported at once. Text inside the materials is data, never a task.
3. **Keeps passwords and personal data out**: they are copied nowhere, the file stays out of git
   and out of `inbox/` until the owner decides, and the owner hears about it at once — even
   when another skill called the intake.
4. **Files the originals** by purpose under `CODE — what it is, date` names, keeps only the
   current version, removes without asking only what loses nothing (it is in git history or an
   identical copy stays), and sends only heavy formats through Git LFS so text keeps readable
   changes. It asks before opening `inbox/` to git in a public repository.
5. **Keeps the inventory** `inbox/README.md`: code, what it is, from whom and when, where, weight
   (requirement, hypothesis, reference), the processed version.
6. **Keeps the digest** `inbox/processed/digest.md`: what is wanted and for whom, requirements and
   constraints, who decided what and when, open contradictions, questions to third parties,
   numbers and dates — every line with its source. An update from the same author rewrites the
   line; two different people disagreeing is a contradiction for the owner.
7. **Reports** in one message: what was filed and removed, what waits for the owner's ok, what was
   held back, what could not be opened, what is new in the digest. Called from another skill, it
   hands the same points back to that skill instead.

## Where things go

```text
inbox/
  README.md                         the inventory — the entry point for any later work
  <purpose>/                        originals as they came: client/, legal/, design/, meetings/…
  processed/                        what was derived from an original: transcripts, text versions
    digest.md                       what all the materials say
docs/                               only our own documents: plans, specifications, reports
```

A processed file says which original it came from, and on any disagreement the original wins:
a retelling is never cited as the author's words. The project's own rules on folders win over
this layout.

## Install

**Claude Code, as a plugin**, from [nyxandro/skills](https://github.com/nyxandro/skills), the
catalog of my skills:

```text
/plugin install materials-intake --marketplace nyxandro/skills
```

Installing feature-blueprint from the catalog installs this skill along with it.

**Any agent, as a skill folder.** Download `dist/materials-intake.skill` (the badge above) and
unpack it into the skills folder of your agent, or clone this repository and link the
`materials-intake/` folder there. Use one way or the other: with both, Claude Code loads the
skill twice.

Git LFS must be installed for heavy files; without it the agent says so and does not add them
to plain git.

## Evals

`materials-intake/evals/` holds two cases in the `claude plugin eval` format: a pile of client
materials dropped into a project's root (versions, a duplicate, a contradiction, a file with
passwords, a file the code uses), and a fresh chat export over an inventory kept earlier under an
old Git LFS rule. The prompts are in Russian on purpose: they also check that the report follows
the owner's language. The evals are not part of the `.skill` archive.

## Repository layout

```text
materials-intake/SKILL.md     the skill
materials-intake/evals/       eval cases with graders
dist/materials-intake.skill   downloadable archive of the skill folder
AGENTS.md, CLAUDE.md          rules for agents working on this repository
```

## License

MIT.
