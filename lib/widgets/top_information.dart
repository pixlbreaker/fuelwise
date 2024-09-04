import 'package:flutter/material.dart';

class TopInformation extends StatelessWidget {
  TopInformation(this.topPrice);

  final double topPrice;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Current Price",
            style: themeData.textTheme.displaySmall,
          ),
          SizedBox(
            height: 6.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$" + topPrice.toString(),
                style: TextStyle(
                  color: themeData.cardTheme.color,
                  fontSize: 26.0,
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text("Location")),
            ],
          ),
          SizedBox(
            height: 2.0,
          ),
          Row(
            children: [
              Text(
                "+2.14%",
                style: TextStyle(
                  color: themeData.primaryColor,
                  fontSize: 16.0,
                ),
              ),
              Icon(
                Icons.upload_rounded,
                color: themeData.primaryIconTheme.color,
              )
            ],
          )
        ],
      ),
    );
  }
}
