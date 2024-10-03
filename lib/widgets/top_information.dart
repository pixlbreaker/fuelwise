import 'package:flutter/material.dart';

class TopInformation extends StatelessWidget {
  TopInformation(this.topPrice, this.topName, this.topAddress);

  final String topName;
  final double topPrice;
  final String topAddress;

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
            Text(
              topAddress,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
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
