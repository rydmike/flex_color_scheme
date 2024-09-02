import 'package:flutter/material.dart';

/// A [ListTile] with a [Slider] either in [title] or in [subtitle]
/// position that can never return null.
///
/// The Slider value is displayed as a trailing widget.
///
/// This is a Flutter "Universal" Widget that only depends on the SDK and
/// can be dropped into any application.
class ListTileSlider extends StatelessWidget {
  const ListTileSlider({
    super.key,
    this.title,
    this.subtitle,
    this.sliderLabel,
    this.dense = false,
    this.min = 0.0,
    this.max = 100.0,
    this.divisions,
    this.valueDecimals = 0,
    this.enabled = true,
    //
    required this.value,
    this.onChanged,
  });

  /// The primary content of the Slider list tile.
  ///
  /// Typically a [Text] widget.
  ///
  /// This should not wrap. To enforce the single line limit, use
  /// [Text.maxLines].
  ///
  /// If both [title] and [subtitle] are null, the [Slider]
  /// will be placed in the [ListTile]'s title position.
  final Widget? title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  ///
  /// If both [title] is not null and [subtitle] are is null, the [Slider]
  /// will be placed in the [ListTile]'s subtitle position.
  ///
  /// If both [title] and [subtitle] are not null, the [Slider] will
  /// be placed in the [ListTile]'s subtitle position, in a [Column] below
  /// the [subtitle].
  final Widget? subtitle;

  /// Use dense style for the ListTile.
  final bool dense;

  /// A label placed above the slider value shown as trailing widget.
  final String? sliderLabel;

  /// The minimum value the slider can have.
  final double min;

  /// The maximum value the slider can have.
  final double max;

  /// The number of discrete divisions.
  ///
  /// If null, set to ([max]- [min]).toInt().
  final int? divisions;

  /// The number of decimals to show for the value.
  ///
  /// Defaults to 0.
  final int valueDecimals;

  /// Whether this list tile and slider operation is interactive.
  final bool enabled;

  /// The current value of the slider.
  ///
  /// It is shown as the value of the slider in the ListTile trailing property.
  final double value;

  /// Called when the user starts selecting a new value for the slider.
  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    // For now using hard coded style selection for sliderLabel.
    final TextStyle style = Theme.of(context).textTheme.bodySmall!;

    final Slider slider = Slider(
      min: min,
      max: max,
      divisions: divisions ?? (max - min).toInt(),
      label: value.toStringAsFixed(valueDecimals),
      value: value,
      onChanged: enabled
          ? (double value) {
              onChanged?.call(value);
            }
          // Sett to null to also disable the Slider in the ListTile.
          : null,
    );

    return ListTile(
      enabled: enabled,
      dense: dense,
      title: (title == null && subtitle == null) ? slider : title,
      subtitle: (title != null && subtitle == null)
          ? slider
          : (subtitle != null)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    subtitle!,
                    slider,
                  ],
                )
              : null,
      trailing: Padding(
        // For now using hard coded padding for sliderLabel.
        padding: const EdgeInsets.only(right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            if (sliderLabel != null) Text(sliderLabel!, style: style),
            Text(
              value.toStringAsFixed(valueDecimals),
              style: style.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
