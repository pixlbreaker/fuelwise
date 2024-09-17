import 'package:flutter/material.dart';

class TopInformation extends StatelessWidget {
  TopInformation(this.topPrice, this.topName);

  final String topName;
  final double topPrice;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          topName,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 6.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$" + topPrice.toString(),
                style: themeData.textTheme.bodyLarge),
          ],
        ),
        SizedBox(
          height: 2.0,
        ),
      ]),
    );
  }
}
