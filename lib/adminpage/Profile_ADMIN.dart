import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/function.daet.dart';
import '../constant/providers.dart';
import '../userpage/loginn.dart';
import 'Editprofile.dart';

// class Profile_ADMIN extends StatelessWidget {
//   const Profile_ADMIN({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // TouristProvider provider = Provider.of<TouristProvider>(context,listen: false);
//     // provider.getData();
//     return Scaffold(
//
//       body:  Container(
//           color: Colors.white,
//           child:  Column(
//             children: [
//               SizedBox(height: 50,),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20),
//                 child: SizedBox(width: 400,
//                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//
//                       Consumer<TouristProvider>(
//                           builder: (context,value,child) {
//                             return InkWell( onTap: (){
//
//                               // value.clearfn2();
//                               // Navigator.push(context, MaterialPageRoute(builder: (context)=>Editprofile(name: value.Nameprofile,phone: value.Phoneprofile,)));
//                             },
//                                 child: Text("Edit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),));
//                           }
//                       ),
//                       InkWell(
//                           onTap: () {
//                             showDialog(
//                               context: context,
//                               builder: (context) => AlertDialog(
//                                 backgroundColor: Colors.white10,
//                                 elevation: 20,
//                                 content:  Text(
//                                     "Do you want to Logout ?",style: TextStyle(
//                                     fontSize:17,
//
//                                     fontFamily:'ink nut',
//                                     fontWeight: FontWeight.w700,
//                                     color: Colors.yellow)),
//                                 actions: <Widget>[
//                                   Row(
//                                     children: [
//                                       TextButton(
//                                         onPressed: () {
//                                           FirebaseAuth auth = FirebaseAuth.instance;
//                                           auth.signOut();
//                                           callNextReplacement(context, Login());
//                                         },
//                                         child: Container(
//                                           height: 45,
//                                           width: 90,
//                                           decoration: BoxDecoration(
//                                               color:Colors.red ,
//                                               borderRadius: BorderRadius.circular(8),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Color(0x26000000),
//                                                   blurRadius: 2.0, // soften the shadow
//                                                   spreadRadius: 1.0, //extend the shadow
//                                                 ),
//                                               ] ),
//                                           child: Center(child:  Text("yes",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
//                                         ),
//                                       ),
//                                       TextButton(
//                                           onPressed: (){
//                                             finish(context);
//                                           },
//                                           child: Container(
//                                             height: 45,
//                                             width: 90,
//
//                                             decoration: BoxDecoration(
//                                               borderRadius: BorderRadius.circular(8),
//                                               color: Colors.pink,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Color(0x26000000),
//                                                   blurRadius: 2.0, // soften the shadow
//                                                   spreadRadius: 1.0, //extend the shadow
//                                                 ),
//                                               ],
//                                             ),
//                                             child: Center(child: Text("No",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
//                                           ))
//                                     ],
//                                   )
//
//                                 ],
//                               ),
//                             );
//                           },
//                           child: Text("Logout",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
//                       ) ,
//                     ],
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 60,),
//               Consumer<TouristProvider>(
//                   builder: (context,value,child) {
//                     return Container(height: 200,width: 200,
//                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(360),color:Colors.blue ),
//                       child:Text("sahala")
//
//                     );
//                   }
//               ),
//               SizedBox(height: 50,),
//               Column(
//                 children: [
//                   // Row(
//                   //   children: [
//                   //     SizedBox(width: 40,),
//                   //     Consumer<TouristProvider>(
//                   //         builder: (context,value,child) {
//                   //           return Text(value.Nameprofile,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),);
//                   //         }
//                   //     )
//                   //   ],
//                   // ),
//                   SizedBox(height: 15,),
//                   // Consumer<TouristProvider>(
//                   //     builder: (context,value,child) {
//                   //       return Row(
//                   //         children: [SizedBox(width: 40,),
//                   //           Text(value.Phoneprofile,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
//                   //
//                   //         ],
//                   //       );
//                   //     }
//                   // ),
//                   SizedBox(height: 150,),
//                   // Container(height: 55,width: 110,
//                   //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.blue,),
//                   //     child: ElevatedButton(onPressed: (){
//                   //
//                   //     },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//                   //
//                   //         child: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),)))
//
//                 ],
//               ),
//
//             ],
//           )
//       ),
//     );
//   }
// }
