import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../adminpage/Profile_ADMIN.dart';
import '../adminpage/home_ADMIN.dart';
import '../constant/providers.dart';

// class BottomNavADMIN extends StatelessWidget {
//   const BottomNavADMIN ({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final pages = [ Home_ADMIN (),Profile_ADMIN ()];
//     TouristProvider provider = Provider.of<TouristProvider>(context, listen: true);
//     return Scaffold(
//       bottomNavigationBar: Container(
//         height: 50,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.black12, width: 2),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               // enableFeedback: false,
//                 onPressed: () {
//                   provider.onItemTapped(0);
//                 },
//                 icon: provider.selectedIndex==0?Icon(Icons.home,color: Colors.blue,):Icon(Icons.home)),
//             IconButton(
//               // enableFeedback: false,
//                 onPressed: () {
//                   provider.onItemTapped(1);
//                 },
//                 icon: provider.selectedIndex==1?Icon(Icons.person,color: Colors.blue,):Icon(Icons.person)),
//
//
//           ],
//         ),
//       ),
//       body: pages[provider.selectedIndex],
//     );
//   }
// }