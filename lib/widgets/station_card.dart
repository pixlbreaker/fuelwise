import 'package:flutter/material.dart';
import 'package:fuelwise/models/gas_buddy_model.dart';

class StationCard extends StatelessWidget {
  final Results station;
  StationCard(this.station);
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                //return ResultDetail(station: this.station);
              },
            ),
          );
        },
        child: Container(
          height: 90,
          color: Color.fromRGBO(55, 66, 92, 0.4),
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Row(
            children: [
              Container(
                width: 40.0,
                child: Image.asset(
                  station.getImagePath(),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${station.toString()} (${station.name})",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "${station.prices[0]}",
                    style: themeData.textTheme.bodySmall,
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${station.prices[0]}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Text(
                        getResultProgress(station),
                        style: TextStyle(
                          color: station.trend == Trend.UP
                              ? kSuccessColor
                              : kDangerColor,
                          fontSize: 13.0,
                        ),
                      ),
                      Icon(
                        station.trend == Trend.UP
                            ? FlutterIcons.caret_up_faw
                            : FlutterIcons.caret_down_faw,
                        size: 14.0,
                        color: station.trend == Trend.UP
                            ? kSuccessColor
                            : kDangerColor,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          color: kDangerColor,
          icon: FlutterIcons.x_fea,
          foregroundColor: Colors.white,
          onTap: () => null,
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          color: kSuccessColor,
          icon: FlutterIcons.plus_fea,
          foregroundColor: Colors.white,
          onTap: () => null,
        ),
      ],
    );
  }
}

String getResultProgress(Result station) {
  String returnValue = "";

  if (station.trend == Trend.UP) {
    returnValue += "+";
  } else {
    returnValue += "-";
  }

  returnValue += "\$${station.amountProgress} (${station.percentProgress}%)";

  return returnValue;
}
