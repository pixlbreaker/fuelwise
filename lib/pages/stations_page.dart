// import 'package:flutter/material.dart';
// import 'package:fuelwise/models/gas_buddy_model.dart';

// class StationListPage extends StatelessWidget {
//   final GasBuddyModel gasBuddyModel;

//   StationListPage({required this.gasBuddyModel});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Stations'),
//       ),
//       body: ListView.builder(
//         itemCount: gasBuddyModel.data.locationBySearchTerm.stations.count,
//         itemBuilder: (context, index) {
//           final station =
//               gasBuddyModel.data.locationBySearchTerm.stations[index];
//           return Card(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(station.name,
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                   SizedBox(height: 5),
//                   Text("Fuels: ${station.fuels.join(', ')}"),
//                   SizedBox(height: 5),
//                   ...station.prices.map((price) => Text(
//                         "${price.nickname} - \$${price.price} (Posted: ${price.postedTime})",
//                         style: TextStyle(fontSize: 16),
//                       )),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
