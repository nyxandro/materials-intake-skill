# Changelog

The current version is `metadata.version` in `materials-intake/SKILL.md`. Every version is tagged
`vX.Y.Z` in git and published as a GitHub release with its own `.skill` archive. Versions are
numbered MAJOR.MINOR.PATCH.

- **PATCH** (1.0.1) is a fix or clearer wording. The skill behaves the same.
- **MINOR** (1.1.0) is a new or changed rule.
- **MAJOR** (2.0.0) changes the folder layout, the inventory format or how the skill works with
  the owner.

## [1.1.0] - 2026-11-06

### Changed

- The description says what the skill does and when to use it, without retelling the steps of
  the work. With the steps in the description, the model can follow them and skip the body of the
  skill, as Superpowers' tests showed. The trigger phrases are unchanged.

## [1.0.0] - 2026-11-06

The first published version.

### Changed

- One inventory file instead of two. `inbox/README.md` now has two parts, "What is here" (one row
  per material) and "What they say" (requirements, decisions, contradictions and questions by
  topic). The separate `inbox/processed/digest.md` is gone. In a project kept the old way, the
  intake moves the old digest into the inventory and removes the file.
- The skill names no other skill. Recordings are transcribed the way the owner's or the project's
  rules set, and the skill works the same whether the owner or other work calls it.
- The description is shorter, 908 characters.

### Removed

- `AGENTS.md`, `CLAUDE.md` and the eval cases are no longer kept in the repository.

## Before 1.0.0

- **2026-11-05.** First version, taken out of feature-blueprint. Take in a project's incoming
  materials and keep one inventory and one digest (`f5d974c`).
