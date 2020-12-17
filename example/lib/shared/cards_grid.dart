import 'package:flutter/material.dart';
import 'constants.dart';

// It is not necessary to review or understand the code in this file in order
// to understand how to use the FlexColorScheme package demonstrated in
// the example.

// These widgets are only used in the sample to provide some additional
// content on the main page, just for demo purposes on the responsive page.
class CardsGrid extends StatelessWidget {
  const CardsGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint) {
        final int nrOfColumns =
            (constraint.maxWidth.toInt()) ~/ AppConst.minCardWidth.toInt();
        return GridView.builder(
          padding: const EdgeInsets.all(AppConst.edgePadding / 2),
          shrinkWrap: true,
          primary: false,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: nrOfColumns == 0 ? 1 : nrOfColumns,
            mainAxisSpacing: AppConst.edgePadding / 2,
            crossAxisSpacing: AppConst.edgePadding / 2,
            childAspectRatio: 1.4,
          ),
          itemCount: AppConst.maxCards,
          itemBuilder: (_, int index) => Card(
            clipBehavior: Clip.antiAlias,
            elevation: 1.5,
            child: _GridItem(
              title: 'Card ${index + 1}',
              color: Colors.primaries[index % Colors.primaries.length][
                  Theme.of(context).brightness == Brightness.light ? 600 : 300],
            ),
          ),
        );
      },
    );
  }
}

// Grid items for the gridview with cards, just as demo content.
class _GridItem extends StatelessWidget {
  const _GridItem({Key key, this.title, this.color}) : super(key: key);
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        ThemeData.estimateBrightnessForColor(color) == Brightness.light
            ? Colors.black87
            : Colors.white70;
    return Container(
      color: color,
      // padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title, style: TextStyle(color: textColor, fontSize: 18)),
          Icon(Icons.apps, color: textColor),
        ],
      ),
    );
  }
}
