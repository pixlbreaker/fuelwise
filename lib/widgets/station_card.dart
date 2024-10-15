import 'package:flutter/material.dart';
import 'package:fuelwise/models/gas_buddy_model.dart';
import 'package:fuelwise/pages/stations_page.dart';

class StationCard extends StatelessWidget {
  
  // Station and lat, long information
  final Results station;
  final double lat;
  final double lng;
  StationCard(this.station, this.lat, this.lng);


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
                  return StationPage(station: station, lat: lat, lng: lng);
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
