---
name: code-documentation
description: Write or update FlexColorScheme dartdoc, README, changelog, and example explanations when public behavior or documentation changes. Verify defaults, color precedence, null semantics, and Material-specific behavior against implementation.
---

# Code documentation

Document the requested scope. Preserve useful explanations; correct stale claims without rewriting unrelated prose.

- Explain purpose, defaults, interactions, and effective fallback behavior for public APIs. Distinguish `null` (often delegation to another default) from explicit false or zero, and explain light/dark or M2/M3 differences when they affect callers.
- Verify claims against the constructor and the consuming implementation. `FlexSubThemesData` field defaults alone may not describe the eventual widget appearance. Trace `FlexColorScheme` and the corresponding `FlexSubThemes` method.
- Document `toTheme` and `toScheme` as getters; `FlexThemeData.light` / `.dark` return `ThemeData` directly. Keep factory and convenience API explanations consistent.
- Use resolvable `[Symbol]` references in `///` dartdoc. In ordinary `//` comments use backticks. Do not add imports solely to make a documentation reference resolve.
- Prefer concise examples that clarify an interaction. Current 9.x examples use the SDK-decoupled UI packages. Do not copy stale generated Playground imports as authoritative API examples.
- Get version and SDK requirements from pubspecs, formatting from analyzer configuration, and exported types from the barrel. Avoid static counts of schemes, properties, or tests.
- Use direct English, one Markdown paragraph or bullet per source line, and normal fenced code blocks. Explain non-obvious color math and precedence where it is implemented.

User-facing changes may need README/example updates and a changelog entry. Follow the existing release sections (`Package`, `Test`, `Themes Playground`) and applicable tags such as `BREAKING`, `NEW`, `FIX`, `CHANGE`, `CHORE`. Do not add package release notes for routine agent-tooling edits unless requested.

Consumer tutorials live in the portable [consumer skill](../flex-color-scheme/SKILL.md). Internal navigation belongs in the [architecture guide](../../../docs/guides/architecture.md). Validate links and snippets; do not claim analysis passed when migration failures prevented verification.
