// import 'package:flutter/material.dart';

// class Grid extends StatelessWidget {
//   const Grid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.orange,
//         title: Text('Grid'),
//       ),
//       body: GridView.builder(
//           itemCount: 8,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisSpacing: 8,
//               mainAxisSpacing: 6,
//               crossAxisCount: 2,
//               // mainAxisExtent: 400      //** size height increse */
//               childAspectRatio: 2 / 2.1 //** size height increse */
//               ),
//           itemBuilder: (_, index) {
//             return Padding(
//               padding: const EdgeInsets.only(left: 3, right: 3),
//               child: Card(
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Container(
//                   // height: 260,
//                   decoration: BoxDecoration(
//                       color: Colors.orange,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: 135,
//                         decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10))),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Text('  Brand'),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('  1200'),
//                           //  Text('cuting')
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }
