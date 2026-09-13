---
name: code-review
description: Review FlexColorScheme pull requests, branches, or selected diffs for behavior regressions, API compatibility, and incomplete Playground integration. Use for review requests, not as a mandatory workflow for every edit.
---

# Code review

Establish the requested diff and its actual base; preserve the author's working tree. Read enough surrounding implementation to demonstrate each finding. Focus on actionable regressions introduced by the change and clearly separate pre-existing SDK migration issues.

## Review lenses

- Public API: default flips, changed null semantics, required/renamed parameters, exports, light/dark factory symmetry, and convenience API forwarding.
- Data objects: construction, copying, equality, hash, and diagnostic coverage for new configuration fields.
- Themes: explicit overrides versus fallbacks, brightness, M2/M3, surface/on-color contrast, seeded palette consistency, and platform adaptation. Use [package development](../package-development/SKILL.md) to locate affected tests.
- Playground: new settings need initialization, persistence, reset, import allowlisting, appropriate controls, both theme builders, and emitted code. Follow the [property checklist](../themes-playground-development/references/property-checklist.md); a visible UI change alone is insufficient.
- Generated code: verify actual emitted Dart and the configured theme behavior. A fragment may exist but be absent from one assembly branch. Use the [generation skill](../themes-playground-code-generation/SKILL.md).
- Documentation: default and compatibility claims must match implementation. Flag new unsupported Flutter imports and missing regression coverage where they affect the change. Flag `[Symbol]` in function or factory **parameter-level** `///` comments (they do not resolve; body comments should use `## [paramName]` catalogs with `[Symbol]`, while parameter blurbs use backticks). Flag unresolved comment references that should use `@docImport`, `[Class.member]` qualification, or backticks for literals, non-dependencies, and removed APIs.

Report findings by severity, with affected location, triggering scenario, concrete consequence, and an adoptable correction or validation case. Use the output format appropriate to the review destination. Do not manufacture findings, fixed issue counts, or a 100% coverage gate. If the diff is sound, say so and identify any material verification limits.
