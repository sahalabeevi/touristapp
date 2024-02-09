// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:touristapp/userpage/Description.dart';
//
// import 'constant/providers.dart';
// import 'models/bottomnavigation.dart';
//
// class placess2 extends StatelessWidget {
//   const placess2({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     TouristProvider provider = Provider.of<TouristProvider>(context,listen: false);
//
//     return SafeArea(
//       child: Scaffold(
//         body: Column(crossAxisAlignment: CrossAxisAlignment.start,
//           children: [SizedBox(height: 10,),
//             Row(
//               children: [SizedBox(width: 10,),
//                 InkWell(onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>  BottomNav()));
//                 },
//                     child: Icon(Icons.arrow_back_outlined,size: 25,)),
//                 SizedBox(width: 8,),
//                 Text("Family Trip",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
//               ],
//             ),
//             SizedBox(height: 10,),
//             Flexible(
//               fit: FlexFit.tight,
//               child: Consumer<TouristProvider>(
//                   builder: (context,value,child) {
//                     return GridView.builder(itemCount:value.Typeplaces.length,
//
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
//                             mainAxisSpacing: 20,
//                             crossAxisSpacing: 20,
//                             childAspectRatio: 0.8,mainAxisExtent:186
//                         ), itemBuilder: (BuildContext context,int index){
//                           var item2= value.Typeplaces[index];
//                           return InkWell(onTap: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(images: item2.images,location: item2.location,
//                               decription: item2.description,name: item2.type,
//                               photo: item2.photo,)));
//                           },
//                             child: Container(
//                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,
//                                   boxShadow: [
//
//                                     BoxShadow(blurRadius: 2,color: Colors.grey,
//                                         offset: Offset(0,1)),
//
//                                   ]
//                               ),
//
//                               child: Column(
//                                 children: [
//
//                                   Container(
//
//                                     margin: EdgeInsets.all(6),
//
//
//                                     child: ClipRRect(borderRadius: BorderRadius.circular(10),
//                                       child: SizedBox(height: 100,
//                                           child: Image.network(item2.photo,fit: BoxFit.fill,)),
//                                     ),
//                                   ),
//
//                                   ListTile(
//                                       title: Text(item2.type,style: TextStyle(color:
//                                       Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
//                                       subtitle: Row(
//                                         children: [Icon(Icons.location_on,size: 13,),
//                                           Text(item2.location,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
//                                         ],
//                                       ),
//
//                                       trailing: Icon(Icons.favorite_border,color: Colors.red,)
//                                   )
//                                 ],
//
//
//
//
//                               ),
//                             ),
//                           );
//                         }
//                     );
//                   }
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
