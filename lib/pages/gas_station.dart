import 'package:flutter/material.dart';

void main() {
  runApp(GasStationApp());
}

class GasStationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gas Station',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GasStationPage(),
    );
  }
}

class GasStationPage extends StatelessWidget {
  final String stationName = "FuelUp Gas Station";
  final String stationAddress = "123 Main St, Springfield";
  final Map<String, double> fuelPrices = {
    'Regular': 3.29,
    'Premium': 3.69,
    'Diesel': 3.99,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stationName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stationName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              stationAddress,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            Text(
              "Fuel Prices",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            ...fuelPrices.entries.map((entry) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    entry.key,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '\$${entry.value.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              );
            }).toList(),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Navigating to station details...")),
                );
              },
              child: Text('More Details'),
            ),
          ],
        ),
      ),
    );
  }
}
