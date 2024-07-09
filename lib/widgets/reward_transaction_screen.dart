// import 'package:flutter/material.dart';

// class TransactionList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         const Text(
//           'All Transactions',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         ListView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: 5, // Replace with dynamic count
//           itemBuilder: (context, index) {
//             return ListTile(
//               leading: CircleAvatar(
//                 backgroundColor: Colors.green,
//                 child: Icon(
//                   index % 2 == 0 ? Icons.call_received : Icons.call_made,
//                   color: Colors.white,
//                 ),
//               ),
//               title: Text('Aleem Sheikh'),
//               subtitle: Text('Rs. 360'),
//               trailing: Text('Today'),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
