// import 'package:flutter/material.dart';

// class SelectionListTile extends StatelessWidget {
//   const SelectionListTile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//                     width: MediaQuery.of(context).size.width * .9,
//                     height: MediaQuery.of(context).size.height * .12,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: Colors.blue[400],
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.black45,
//                           blurRadius: 5,
//                           offset: Offset(2, 2),
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     courseName[index].name,
//                                     style: const TextStyle(
//                                       fontSize: 20,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   Text(
//                                     courseName[index].description,
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.white70,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const Text(
//                                 "Score 10000",
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           const LinearProgressIndicator(
//                             value: 0.5,
//                             backgroundColor: Colors.white24,
//                             color: Colors.white,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//   }
// }
