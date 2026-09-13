# Fresh checkouts and worktrees

The package root and `example/` are separate Flutter packages. From a fresh checkout or worktree, run:

```bash
./scripts/setup_worktree.sh
```

The script resolves its own checkout root, optionally copies `example/android/local.properties` from the main checkout (or `ROOT_WORKTREE_PATH`), and runs dependency resolution in both packages. It leaves an existing destination `local.properties` untouched. The script prefers `fvm flutter` when FVM is available and otherwise uses `flutter` on PATH. Verify that the selected SDK satisfies both pubspecs; `.fvmrc` currently selects `stable`.

No editor-specific worktree hooks or `.worktreeinclude` are installed by this setup. Run the script manually unless you have independently configured an integration. It does not create branches, commit, or change global SDK settings.

For Claude Code, also run `./scripts/sync_claude_code_config.sh` in each checkout. Generated mirrors are local to that checkout. See [script documentation](../../scripts/README.md).

## Checks and example entrypoint

Use the same SDK selection consistently. The following commands show the plain Flutter form; prefix with `fvm` when using FVM:

```bash
flutter test test/flex_sub_themes_test.dart
cd example
flutter run -d chrome lib/example5_themes_playground/main.dart
```

Package tests do not require a simulator. If running several apps, use separate devices and available ports. Git worktrees do not isolate simulator state or persisted app settings; use disposable settings for import/reset experiments.

The example currently contains iOS and macOS Podfiles. Do not assume a Swift Package Manager-only setup or blindly add/remove CocoaPods configuration; inspect the selected platform project when a native build is part of the task. Ordinary documentation work needs no native build.

During the ongoing SDK migration, successful worktree setup does not establish that tests, analysis, or example builds pass. Report checks actually run and keep unrelated migration failures out of the task.
