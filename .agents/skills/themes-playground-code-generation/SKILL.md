---
name: themes-playground-code-generation
description: Change or verify Dart emitted by FlexColorScheme Themes Playground, including new property output, default omission, light/dark parity, and ColorScheme exports. Use when generated code must reproduce configured theme behavior.
---

# Playground code generation

Read the [generator map and validation recipe](references/generation-and-validation.md). Theme generation is handwritten string assembly; creating a fragment does not automatically emit it.

For a new setting, also follow [Playground development](../themes-playground-development/SKILL.md). Keep stored settings, preview builders, and emitted consumer arguments aligned.

- Verify the public parameter name, type, and effective default against the installed/local package implementation.
- Preserve distinctions between null, false, zero, and explicit overrides. Omit an argument only when omission reproduces the intended consumer behavior. `Store` defaults are UI/reset values, not the omission condition.
- Inspect both light and dark fragment assembly and feature gates (`useSubThemes`, seeding, M2/M3, adaptive). Match API ordering and existing section organization.
- Compile the actual output and compare affected ThemeData/ColorScheme fields when the SDK baseline permits. String-presence checks alone do not prove correct behavior.
- Keep simulator-only state, controller types, and Playground theme extensions out of consumer output unless explicitly required by the feature. Emit `FlexAdaptive.*()` via `AdaptiveResponse.code`, never `AdaptiveResponse` itself.

The generator currently emits `package:flutter/material.dart` and `package:flutter/cupertino.dart` imports, while this checkout uses `material_ui` and `cupertino_ui`. Report that as a limit. Do not silently rewrite output in a validation harness and then report the emitted code as passing. Changing unrelated generator behavior is a separate task.
