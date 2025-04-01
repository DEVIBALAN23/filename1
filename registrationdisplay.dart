// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../themes/theme_manager.dart';
//
// class registrationdisplay extends StatefulWidget {
//   String name;
//   String number;
//    registrationdisplay({required this.name,required this.number});
//
//   @override
//   State<registrationdisplay> createState() => _registrationdisplayState();
// }
//
// class _registrationdisplayState extends State<registrationdisplay> {
//   @override
//   Widget build(BuildContext context) {
//     final themeManager = Provider.of<ThemeManager>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registration data'),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 bool newValue =
//                 themeManager.themeMode == ThemeMode.light ? true : false;
//                 themeManager.toggleTheme(newValue);
//               },
//               icon: Icon((themeManager.themeMode == ThemeMode.dark)
//                   ? Icons.sunny
//                   : Icons.nightlight_round))
//         ],
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(10),
//         children: [
//           Card(
//               elevation: 3,
//               child: ListTile(
//                 leading: Icon(Icons.person, color: Colors.blue),
//                 title: Text(
//                   "Name: ${widget.name}",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold, color: Colors.white),
//                 ),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Icon(Icons.lock, size: 18, color: Colors.red),
//                         SizedBox(width: 5),
//                         Text(
//                           "Number: ${widget.number}",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }
