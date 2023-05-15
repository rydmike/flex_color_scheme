### Archived changelog entry

> The Dart package site [pub.dev](https://pub.dev/) restricts the size of the main [CHANGELOG.md](https://github.com/rydmike/flex_color_scheme/blob/master/CHANGELOG.md) file size to maximum 128kB. To work around this limitation, older change entries have been moved into individual files linked from the main changelog.

## 1.1.1

**December 31, 2020**

**NEW**

* Added a `defaultError` modifier that enables the built-in schemes to use the Material design guide's default dark
  error color when using the `toDark` method to compute a dark scheme from a light scheme.
  The `toDark` method can be used without the `defaultError` scheme modifier, but then the
  error color also changes with the other computed dark scheme colors when using `toDark` method
  and the level adjustment. This is not necessarily the desired behavior. The fix enables the alternative more often
  desired behavior and ensures that the dark error color just uses the default value. For custom schemes that do not
  specify a custom error color for their light scheme and thus default to the Material Guide's standard error color,
  the fix is not needed. Example 5 demonstrates the use case of `defaultError` as well.

**EXAMPLES**

* Updated example 5 to include UI that can be used to vary the computed dark themes white blend percentage level.
  This was added to better demonstrate the `toDark` feature.

**DOCS**

* Major documentation review and updates.
