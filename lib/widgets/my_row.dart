// import 'package:flutter/material.dart';

// class MyRow extends StatelessWidget {
//   final String code;
//   final String nama;
//   final String tanggal;

//   const MyRow({
//     super.key,
//     required this.code,
//     required this.nama,
//     required this.tanggal,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           CircleAvatar(
//             radius: 24,
//             backgroundColor: Colors.lightBlue,
//             child: Text(
//               code,
//               style: const TextStyle(color: Colors.white),
//             ),
//           ),
//           Expanded(
//               child: Container(
//             margin: const EdgeInsets.only(left: 12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   nama,
//                   style: const TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.w600),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(top: 2),
//                   child: Text(tanggal),
//                 ),
//               ],
//             ),
//           )),
//         ],
//       ),
//     );
//   }
// }
