# materials-intake-skill — project rules

- Language: the skill (`materials-intake/SKILL.md`), the README, commit messages and PR titles are
  in English. The skill makes the agent write everything the owner reads in the owner's language;
  eval prompts stay in the language a real owner would use.
- The skill holds the order of work, the owner's rules on folders, git and secrets, and the
  formats of the inventory, the digest and the report. It does not re-teach what the model
  already knows and does not repeat the owner's global rules.
- `SKILL.md` stays under 500 lines; the frontmatter description stays within 1024 characters and
  uses only the fields the skill-creator validator accepts.
- feature-blueprint (`nyxandro/feature-blueprint-skill`) loads this skill at its first step and
  relies on the paths `inbox/README.md` and `inbox/processed/digest.md` and on the report points
  handed back to a calling skill. Change them in both skills together.
- After any change to `materials-intake/`, rebuild `dist/materials-intake.skill` with the
  skill-creator packager (it leaves `evals/` out) and commit it together with the change.
