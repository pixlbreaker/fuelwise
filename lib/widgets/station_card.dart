import 'package:flutter/material.dart';
import 'package:fuelwise/models/gas_buddy_model.dart';
import 'package:fuelwise/pages/stations_page.dart';

class StationCard extends StatelessWidget {
  final Results station;
  StationCard(this.station);
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Card(
      color: themeData.primaryColorDark,
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(station.name),
        subtitle: Text(station.address.line1),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return StationPage(station: station);
                },
              ),
            );
          },
          child: Text('More Details'),
        ),
      ),
    );
  }
}
