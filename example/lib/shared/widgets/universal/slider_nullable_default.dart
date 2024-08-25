import 'package:flutter/material.dart';

/// A discrete [Slider] that is nullable.
///
/// The Slider can be set to a [value] that is one step below the [min] value.
/// When the Slider is set to this value, it instead of the set value
/// ill display the [valueDefaultLabel].
///
/// For this value, the [onChanged] callback will be called with a null return
/// value.
///
/// The [value] is expected to be in the range of [min] and [max] or null.
///
/// When [value] is null, the Slider will display the
/// [valueDefaultLabel] and use the value step one below the min value as
/// the Slider position and actually used value.
///
/// The [onChanged] callback is required, the is a separate
/// [enabled] flag to enable or disable the Slider.
///
/// This is a Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class SliderNullableDefault extends StatelessWidget {
  const SliderNullableDefault({
    super.key,
    this.value,
    required this.onChanged,
    required this.enabled,
    this.title,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions = 100,
    this.valueDisplayScale = 1,
    this.valueDecimalPlaces = 2,
    this.valueHeading,
    this.valueDefaultLabel = 'default',
    this.valueUnitLabel = '',
    this.valueDefaultDisabledLabel,
  })  : assert(min < max, 'Min $min must be smaller than max $max'),
        assert(
            (value == null) || (value >= min && value <= max),
            'Value $value is not null or not between '
            'minimum $min and maximum $max');

  /// The currently selected value for this slider.
  ///
  /// The slider's thumb is drawn at a position that corresponds to this value.
  final double? value;

  /// Called during a drag when the user is selecting a new value for the slider
  /// by dragging.
  ///
  /// The slider passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the slider with the new
  /// value.
  ///
  /// If null, the slider will be displayed as disabled.
  ///
  /// The callback provided to onChanged should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt.
  final ValueChanged<double?> onChanged;

  /// Whether this slider is enabled.
  ///
  /// Set to false to disable the Slider, it will be displayed as disabled
  /// along with the title and value trailing labels.
  final bool enabled;

  /// The main heading content of the Slider tile.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// The minimum value the user can select.
  ///
  /// Defaults to 0.0. Must be less than or equal to [max].
  ///
  /// If the [max] is equal to the [min], then the slider is disabled.
  final double min;

  /// The maximum value the user can select.
  ///
  /// Defaults to 1.0. Must be greater than or equal to [min].
  ///
  /// If the [max] is equal to the [min], then the slider is disabled.
  final double max;

  /// The number of discrete divisions.
  ///
  /// Typically used with built in
  /// label to show the current discrete value.
  ///
  /// Only discrete Slider is supported so
  /// [divisions] must be greater than 0.
  final int divisions;

  /// A display scaling value for the displayed value.
  ///
  /// Typically used to show fractions as % numbers on the Slider.
  /// The [value] and callback [onChanged] will still be in the input
  /// scale.
  ///
  /// Defaults to 0, no scaling.
  final int valueDisplayScale;

  /// Number of decimal places to display the value.
  ///
  /// Defaults to 0.
  final int valueDecimalPlaces;

  /// A label used to show as the unit of the value.
  ///
  /// Defaults to an empty string, now unit shown.
  final String valueUnitLabel;

  /// A heading to show above the value display in the trailing part of
  /// the Slider.
  final String? valueHeading;

  /// THe value to display when the value is null, meaning below the min value,
  /// on the Slider, it is shown both in the label and the trailing value.
  final String valueDefaultLabel;

  /// THe value to display when the value is disabled and null, meaning below
  /// the min value, on the Slider, it is shown both in the label and the
  /// trailing value.
  ///
  /// If not defined, defaults to the [valueDefaultLabel].
  final String? valueDefaultDisabledLabel;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    // The value of a discrete step.
    final double step = (max - min) / (divisions <= 0 ? 1 : divisions);
    // THe effective min value, one step below given min, this value is used
    // to show default label and return null when selected.
    final double effectiveMin = min - step;

    return ListTile(
      enabled: enabled,
      title: title,
      subtitle: Slider(
        min: effectiveMin * valueDisplayScale,
        max: max * valueDisplayScale,
        divisions: divisions + 1,
        label: enabled
            ? value == null ||
                    (value ?? effectiveMin * valueDisplayScale) <
                        min * valueDisplayScale
                ? valueDefaultLabel
                : (value! * valueDisplayScale)
                    .toStringAsFixed(valueDecimalPlaces)
            : valueDefaultDisabledLabel ?? valueDefaultLabel,
        value: value == null || !enabled
            ? effectiveMin * valueDisplayScale
            : value! * valueDisplayScale,
        onChanged: enabled
            ? (double value) {
                onChanged(value < min * valueDisplayScale
                    ? null
                    : value / valueDisplayScale);
              }
            : null,
      ),
      trailing: Padding(
        padding: const EdgeInsetsDirectional.only(end: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (valueHeading != null)
              Text(valueHeading!, style: theme.textTheme.bodySmall),
            Text(
              enabled
                  ? value == null ||
                          (value ?? effectiveMin * valueDisplayScale) <
                              min * valueDisplayScale
                      ? valueDefaultLabel
                      // ignore: lines_longer_than_80_chars
                      : '${(value! * valueDisplayScale).toStringAsFixed(valueDecimalPlaces)}$valueUnitLabel'
                  : valueDefaultDisabledLabel ?? valueDefaultLabel,
              style: theme.textTheme.bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
