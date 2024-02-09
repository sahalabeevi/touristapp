import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/providers.dart';
import '../models/bottomnavigation.dart';

// class EDIT_USER_PROFILE extends StatelessWidget {
//   const EDIT_USER_PROFILE({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//       SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 30,),
//             Consumer<TouristProvider>(builder: (context, value, child) {
//               return value.fileImage3!= null ? Center(
//                 child: CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 70,
//                   backgroundImage: FileImage(
//                     value.fileImage3!,
//                   ),
//                 ),
//               )
//                   : value.imageUrl3 != ""
//                   ? Center(
//                 child: InkWell(onTap: (){
//                   showBottomSheet2(context);
//                 },
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     radius: 70,
//                     backgroundImage: NetworkImage(value.imageUrl3),
//                   ),
//                 ),
//               )
//                   : Center(
//                 child: InkWell(onTap: (){
//                   showBottomSheet2(context);
//
//                 },
//                   child: CircleAvatar(
//                       backgroundColor: Colors.white,
//                       radius: 70,
//                       child: Icon(
//                         Icons.image,
//                         size: 90,
//                         color: Colors.grey.shade500,
//                       )),
//                 ),
//               );
//             }),
//             SizedBox(height: 20,),
//             Consumer<TouristProvider>(
//                 builder: (context,value,child) {
//                   return SizedBox(
//                     width: 300,
//                     child: TextField(
//
//                       controller: value.ProfilenameControllerUSER,
//
//                       decoration: InputDecoration(filled: true,
//
//                           fillColor: Colors.white.withOpacity(0.8),
//
//                           border: OutlineInputBorder(
//
//                               borderRadius: BorderRadius.circular(15)
//
//                           )
//
//                       ),
//
//                     ),
//                   );
//                 }
//             ),
//             SizedBox(height: 20,),
//             Consumer<TouristProvider>(
//                 builder: (context,value,child) {
//                   return SizedBox(
//                     width: 300,
//                     child: TextField(
//                       keyboardType: TextInputType.number,
//                       controller: value.ProfilephoneControllerUSER,
//
//                       decoration: InputDecoration(filled: true,
//
//                           fillColor: Colors.white.withOpacity(0.8),
//
//                           border: OutlineInputBorder(
//
//                               borderRadius: BorderRadius.circular(15)
//
//                           )
//
//                       ),
//
//                     ),
//                   );
//                 }
//             ),
//             SizedBox(height: 100,),
//             Consumer<TouristProvider>(
//                 builder: (context,value,child) {
//                   return InkWell(onTap: (){
//                     value.addProfileUSER();
//                     value.getProfileUSER();
//
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNav()));
//                   },
//                     child: Container(
//                       height: 50,width: 100,
//                       color: Colors.blue,
//                       child: Center(child: Text("Add",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
//                     ),
//                   );
//                 }
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// void showBottomSheet2(BuildContext context) {
//   TouristProvider provider =
//   Provider.of<TouristProvider>(context, listen: false);
//
//   showModalBottomSheet(
//       elevation: 10,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(10.0),
//             topRight: Radius.circular(10.0),
//           )),
//       context: context,
//       builder: (BuildContext bc) {
//         return Wrap(
//           children: <Widget>[
//             ListTile(
//                 leading: Icon(
//                   Icons.camera_enhance_sharp,
//                   color: Colors.black,
//                 ),
//                 title: const Text(
//                   'Camera',
//                 ),
//                 onTap: () =>
//                 {provider.getImagecamera3(), Navigator.pop(context)}),
//             ListTile(
//                 leading: Icon(Icons.photo, color: Colors.black),
//                 title: const Text(
//                   'Gallery',
//                 ),
//                 onTap: () =>
//                 {provider.getImagegallery3(), Navigator.pop(context)}),
//           ],
//         );
//
//       });
//   //ImageSource
// }