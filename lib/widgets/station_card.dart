import 'package:flutter/material.dart';
import 'package:fuelwise/models/gas_buddy_model.dart';
import 'package:fuelwise/pages/stations_page.dart';

class StationCard extends StatelessWidget {
  final Results station;
  StationCard(this.station);
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: themeData.primaryColorDark,
          borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return StationPage(station: station);
              },
            ),
          );
        },
        child: Container(
          height: 90,
          color: themeData.cardTheme.shadowColor,
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Row(
            children: [
              Container(
                width: 40.0,
                child: Image.asset(
                  "assets/images/subaru.jpg",
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
                    "${station.name}",
                    style: themeData.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "${station.address.line1}",
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
                    "\$${station.prices[0].credit.price ?? 0}",
                    style: themeData.textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: const [Icon(Icons.gas_meter)],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
