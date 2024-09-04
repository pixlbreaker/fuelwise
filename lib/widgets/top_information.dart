import 'package:flutter/material.dart';

class TopInformation extends StatelessWidget {
  TopInformation(this.topPrice);

  final double topPrice;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Current Price",
          style: themeData.textTheme.headlineLarge,
        ),
        SizedBox(
          height: 6.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$" + topPrice.toString(),
                style: themeData.textTheme.bodyLarge),
            FilledButton(
              onPressed: () {},
              child: Text("Location"),
              style: themeData.elevatedButtonTheme.style,
            ),
          ],
        ),
        SizedBox(
          height: 2.0,
        ),
      ]),
    );
  }
}
