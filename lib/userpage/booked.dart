import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/constant/function.daet.dart';
import 'package:touristapp/constant/loginprovider.dart';
import 'package:touristapp/constant/providers.dart';
import '../constant/example.dart';
import 'Payment.dart';

class Booked extends StatelessWidget {
  String name;
  // String book_DATE;
  // String book_TIME;
  // String Adults_count;
  // String child_count;
  // String Adults_price;
  // String child_price;
  // String Total_price;
  // String place;
   Booked({super.key,
    required this.name,
     //   required this.book_DATE,required this.book_TIME,required this.Adults_count,required this.child_count,
  // required this.Adults_price,required this.child_price,required this.Total_price,required this.place
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TouristProvider provider = Provider.of<TouristProvider>(context,listen: false);
   LoginProvider log_provider = Provider.of<LoginProvider>(context,listen: false);
    return    SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,
          leading: InkWell( onTap: (){
               back(context);
          },
              child: Icon(Icons.arrow_back,color: Colors.black,)),
          title: Text("Book a Trip",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),),
          centerTitle: true,),
        body: Column(
          children: [SizedBox(height: 10,),
            Column(
              children: [
                Text("Amazing stuff waiting for your friends/family",style: TextStyle(fontSize: 14,
                    fontWeight: FontWeight.bold),),
                Text("you're just one step away from a new adventre",style: TextStyle(fontSize: 14,
                    fontWeight: FontWeight.bold)
                )
              ],
            ),
            SizedBox(height: 20,),

            Text("Your Details",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                height: 360,width: 330,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 1,
                        color: Colors.grey.withOpacity(1),
                        offset: Offset(0, 2)
                    )]
                ),
                child:Column(
                  children: [


                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(left:20),
                      child: Row(
                        children: [
                          Text("Location:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                          SizedBox(width: 100,),
                          Text(name,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.blue),)
                        ],
                      ),
                    ),

                    SizedBox(height: 7,),
                    Divider(height: 1,color: Colors.grey.withOpacity(1),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Consumer<TouristProvider>(
                        builder: (context,value,child) {
                          return Row(
                            children: [
                              details("Date:"),
                              SizedBox(width: 130,),

                              InkWell( onTap: (){
                                value.selectDate(context);
                              },
                                  child: Icon(Icons.calendar_month,color: Colors.blue,)),
SizedBox(width: 3,),
                              Text(value.dateController.text),


                            ],
                          );
                        }
                      ),
                    ),
                    SizedBox(height: 7,),
                    Divider(height: 1,color: Colors.grey.withOpacity(1),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child:Consumer<TouristProvider>(
                        builder: (context,value,child) {
                          return Row(
                            children: [
                              details("Time:"),
                              SizedBox(width: 127,),
                              InkWell(onTap: (){
                                value.selectTime(context);
                              },
                                  child: Icon(Icons.access_time,color: Colors.blue,)),
                              SizedBox(width: 3,),
                              Text(value.timeController.text),

                            ],
                          );
                        }
                      ),
                    ),

                    SizedBox(height: 7,),
                    Divider(height: 1,color: Colors.grey.withOpacity(1),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [

                          Column(
                            children: [
                              details("Catagaries"),
                              SizedBox(height: 8,),
                              Text("Adults",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                              SizedBox(height: 10,),
                              Text("Kids",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                            ],
                          ),
                          SizedBox(width: 45,),
                          Column(
                            children: [
                              details("Counts"),
                              SizedBox(height: 8,),
                              Consumer<TouristProvider>(
                                builder: (context1,value,child) {
                                  return Row(
                                    children: [
                                     InkWell(onTap: ()
                                     {
                                       // add();
                                       value.adult_count++;
                                       value.Increment(value.adult_count, value.adultPrice_basic,"adult");
                                     },
                                     child:Icon(Icons.add_circle_outline,size: 17,) ,),
                                      SizedBox(width: 4,),
                                      Text(value.adult_count.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue),),
                                      SizedBox(width: 4,),
                                      InkWell(onTap: (){
                                        if(value.adult_count>0)
                                        {value.adult_count--;}
                                        //value.adult_count>0?value.adult_count--:null;
                                        value.decrement(value.adult_count, value.adultPrice_basic, "adult");
                                      },
                                        child:Icon(Icons.remove_circle_outline,size: 17,) ,),
                                    ],
                                  );
                                }
                              ),
                              SizedBox(height: 10,),

                              Consumer<TouristProvider>(
                                builder: (context,value,child) {
                                  return Row(
                                    children: [
                                      InkWell(onTap: (){
                                        // add1();
                                        value.child_count++;
                                        value.Increment(value.child_count, value.childPrice_basic,"child");
                                      },
                                        child:Icon(Icons.add_circle_outline,size: 17,) ,),
                                      SizedBox(width: 4,),
                                      Text(value.child_count.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue),),
                                      SizedBox(width: 4,),
                                      InkWell(onTap: (){
                                        if(value.child_count>0)
                                      value.child_count--;
                                      value.decrement(value.child_count, value.childPrice_basic, "child");
                                      },
                                        child:Icon(Icons.remove_circle_outline,size: 17,) ,),
                                    ],
                                  );
                                }
                              ),
                            ],
                          ),

                          SizedBox(width: 45,),
                          Column(
                            children: [
                              detailss("Price"),
                              SizedBox(height: 8,),
                              Consumer<TouristProvider>(
                                builder: (context,value,child) {
                                  return Text("\$${value.adult_totalamnt}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue),);
                                }
                              ),
                              SizedBox(height: 10,),
                              Consumer<TouristProvider>(
                                builder: (context,value,child) {
                                  return Text("\$${value.child_totalamnt}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue),);
                                }
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 14,),
                    Divider(height: 1,color: Colors.grey.withOpacity(1),),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: Row(
                        children: [
                          details("Total= "),
                          Consumer<TouristProvider>(
                            builder: (context,value,child) {
                              return detailss("\$${value.total_amnt}");
                            }
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            // Flexible(
            //   fit: FlexFit.tight,
            //   child: GridView.builder(itemCount:image.length,
            //
            //       padding: EdgeInsets.symmetric(horizontal: 10),
            //       gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
            //           mainAxisSpacing: 10,
            //           crossAxisSpacing: 10,
            //           mainAxisExtent:80
            //       ), itemBuilder: (BuildContext context,int index){
            //         return
            //           Container(
            //
            //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,
            //                 boxShadow: [BoxShadow(blurRadius:1 ,color: Colors.blue)]
            //             ),
            //             child: ClipRRect(borderRadius: BorderRadius.circular(10),
            //               child:
            //               Stack(children: [Positioned(left: 15,top: 8,right: 15,
            //                   child: Image.asset(image[index],scale: 2,)),
            //                 Positioned(bottom: 17,left: 19,
            //                     child: Text(trips[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),))
            //               ]),
            //
            //
            //             ),
            //           );
            //
            //       }
            //   ),
            // ),
          ],
        ),
        bottomNavigationBar:  BottomAppBar(
          child: Container(decoration: BoxDecoration(color: Colors.blue,
              borderRadius: BorderRadius.only
                (topRight: Radius.circular(10),topLeft:Radius.circular(10), )),
            height: 70,child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                 Consumer<TouristProvider>(
                    builder: (context,value,child) {
                      return InkWell(onTap: (){
                        value.addDETAIL(context, name);
                        value.getUserPay_detail(log_provider.userId);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment (
                      //     book_DATE: book_DATE,
                      //     book_TIME:book_TIME,Adults_count: Adults_count,child_count: child_count,Adults_price: Adults_price,
                      // child_price: child_price, Total_price: Total_price, place: place,
                        )));
                        value.clearfn6();
                        value.get_DETAIL();
                      },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 50,width: 150,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,),
                            child: Center(child: Text("Booked",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue))),
                          ),
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}

//
// class Booked extends StatefulWidget {
//   const Booked({super.key});
//
//   @override
//   State<Booked> createState() => _BookedState();
// }
//
// class _BookedState extends State<Booked> {
//   int value =0;
// int value2 =0;
//   void add (){
//     setState(() {
//     value ++;
//     });
//   }
//
//   void subtract (){
//     setState(() {
//       value --;
//     });
//   }
//
//
//   void add1 (){
//     setState(() {
//       value2 ++;
//     });
//   }
//
//   void subtract1 (){
//     setState(() {
//       value2 --;
//     });
//   }
// DateTime _dateTime =DateTime.now();
//   void _showDatePicker(){
//    showDatePicker(context: context,
//        initialDate: DateTime.now(),
//        firstDate: DateTime(2000),
//        lastDate:DateTime(2099)
//    ).then((value) {
//      setState(() {
//        _dateTime =value!;
//      });
//    });
//   }

    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    // TouristProvider provider = Provider.of<TouristProvider>(context,listen: false);

//       SafeArea(
//       child: Scaffold(
//         appBar: AppBar(backgroundColor: Colors.white,
//           leading: InkWell( onTap: (){
//                back(context);
//           },
//               child: Icon(Icons.arrow_back,color: Colors.black,)),
//           title: Text("Book a Trip",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),),
//           centerTitle: true,),
//         body: Column(
//           children: [SizedBox(height: 10,),
//             Column(
//               children: [
//                 Text("Amazing stuff waiting for your friends/family",style: TextStyle(fontSize: 14,
//                     fontWeight: FontWeight.bold),),
//                 Text("you're just one step away from a new adventre",style: TextStyle(fontSize: 14,
//                     fontWeight: FontWeight.bold)
//                 )
//               ],
//             ),
//             SizedBox(height: 20,),
//
//             Text("Your Details",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
//             SizedBox(height: 15,),
//             Padding(
//               padding: const EdgeInsets.only(left: 15),
//               child: Container(
//                 height: 360,width: 330,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [BoxShadow(blurRadius: 1,
//                         color: Colors.grey.withOpacity(1),
//                         offset: Offset(0, 2)
//                     )]
//                 ),
//                 child:Column(
//                   children: [
//
//
//                     SizedBox(height: 30,),
//                     Padding(
//                       padding: const EdgeInsets.only(left:20),
//                       child: Row(
//                         children: [
//                           Text("Location:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
//                           SizedBox(width: 100,),
//                           Text("Manali",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.blue),)
//                         ],
//                       ),
//                     ),
//
//                     SizedBox(height: 7,),
//                     Divider(height: 1,color: Colors.grey.withOpacity(1),),
//                     SizedBox(height: 20,),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Consumer<TouristProvider>(
//                         builder: (context,value,child) {
//                           return Row(
//                             children: [
//                               details("Date:"),
//                               SizedBox(width: 130,),
//
//                               InkWell( onTap: (){
//                                 value.selectDate(context);
//                               },
//                                   child: Icon(Icons.calendar_month,color: Colors.blue,)),
// SizedBox(width: 3,),
//                               Text(value.dateController.text),
//
//
//                             ],
//                           );
//                         }
//                       ),
//                     ),
//                     SizedBox(height: 7,),
//                     Divider(height: 1,color: Colors.grey.withOpacity(1),),
//                     SizedBox(height: 20,),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child:Consumer<TouristProvider>(
//                         builder: (context,value,child) {
//                           return Row(
//                             children: [
//                               details("Time:"),
//                               SizedBox(width: 127,),
//                               InkWell(onTap: (){
//                                 value.selectTime(context);
//                               },
//                                   child: Icon(Icons.access_time,color: Colors.blue,)),
//                               SizedBox(width: 3,),
//                               Text(value.timeController.text),
//
//                             ],
//                           );
//                         }
//                       ),
//                     ),
//
//                     SizedBox(height: 7,),
//                     Divider(height: 1,color: Colors.grey.withOpacity(1),),
//                     SizedBox(height: 20,),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Row(
//                         children: [
//
//                           Column(
//                             children: [
//                               details("Catagaries"),
//                               SizedBox(height: 8,),
//                               Text("Adults",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
//                               SizedBox(height: 10,),
//                               Text("Kids",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
//                             ],
//                           ),
//                           SizedBox(width: 45,),
//                           Column(
//                             children: [
//                               details("Counts"),
//                               SizedBox(height: 8,),
//                               Consumer<TouristProvider>(
//                                 builder: (context1,value,child) {
//                                   return Row(
//                                     children: [
//                                      InkWell(onTap: ()
//                                      {
//                                        // add();
//                                        value.adult_count++;
//                                        value.Increment(value.adult_count, value.adultPrice_basic,"adult");
//                                      },
//                                      child:Icon(Icons.add_circle_outline,size: 17,) ,),
//                                       SizedBox(width: 4,),
//                                       Text(value.adult_count.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue),),
//                                       SizedBox(width: 4,),
//                                       InkWell(onTap: (){
//                                         if(value.adult_count>0)
//                                         {value.adult_count--;}
//                                         //value.adult_count>0?value.adult_count--:null;
//                                         value.decrement(value.adult_count, value.adultPrice_basic, "adult");
//                                       },
//                                         child:Icon(Icons.remove_circle_outline,size: 17,) ,),
//                                     ],
//                                   );
//                                 }
//                               ),
//                               SizedBox(height: 10,),
//
//                               Consumer<TouristProvider>(
//                                 builder: (context,value,child) {
//                                   return Row(
//                                     children: [
//                                       InkWell(onTap: (){
//                                         // add1();
//                                         value.child_count++;
//                                         value.Increment(value.child_count, value.childPrice_basic,"child");
//                                       },
//                                         child:Icon(Icons.add_circle_outline,size: 17,) ,),
//                                       SizedBox(width: 4,),
//                                       Text(value.child_count.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue),),
//                                       SizedBox(width: 4,),
//                                       InkWell(onTap: (){
//                                         if(value.child_count>0)
//                                       value.child_count--;
//                                       value.decrement(value.child_count, value.childPrice_basic, "child");
//                                       },
//                                         child:Icon(Icons.remove_circle_outline,size: 17,) ,),
//                                     ],
//                                   );
//                                 }
//                               ),
//                             ],
//                           ),
//
//                           SizedBox(width: 45,),
//                           Column(
//                             children: [
//                               detailss("Price"),
//                               SizedBox(height: 8,),
//                               Consumer<TouristProvider>(
//                                 builder: (context,value,child) {
//                                   return Text("\$${value.adult_totalamnt}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue),);
//                                 }
//                               ),
//                               SizedBox(height: 10,),
//                               Consumer<TouristProvider>(
//                                 builder: (context,value,child) {
//                                   return Text("\$${value.child_totalamnt}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue),);
//                                 }
//                               )
//                             ],
//                           ),
//
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 14,),
//                     Divider(height: 1,color: Colors.grey.withOpacity(1),),
//                     SizedBox(height: 10,),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 200),
//                       child: Row(
//                         children: [
//                           details("Total= "),
//                           Consumer<TouristProvider>(
//                             builder: (context,value,child) {
//                               return detailss("\$${value.total_amnt}");
//                             }
//                           ),
//                         ],
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20,),
//             // Flexible(
//             //   fit: FlexFit.tight,
//             //   child: GridView.builder(itemCount:image.length,
//             //
//             //       padding: EdgeInsets.symmetric(horizontal: 10),
//             //       gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
//             //           mainAxisSpacing: 10,
//             //           crossAxisSpacing: 10,
//             //           mainAxisExtent:80
//             //       ), itemBuilder: (BuildContext context,int index){
//             //         return
//             //           Container(
//             //
//             //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,
//             //                 boxShadow: [BoxShadow(blurRadius:1 ,color: Colors.blue)]
//             //             ),
//             //             child: ClipRRect(borderRadius: BorderRadius.circular(10),
//             //               child:
//             //               Stack(children: [Positioned(left: 15,top: 8,right: 15,
//             //                   child: Image.asset(image[index],scale: 2,)),
//             //                 Positioned(bottom: 17,left: 19,
//             //                     child: Text(trips[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),))
//             //               ]),
//             //
//             //
//             //             ),
//             //           );
//             //
//             //       }
//             //   ),
//             // ),
//           ],
//         ),
//         bottomNavigationBar:  BottomAppBar(
//           child: Container(decoration: BoxDecoration(color: Colors.blue,
//               borderRadius: BorderRadius.only
//                 (topRight: Radius.circular(10),topLeft:Radius.circular(10), )),
//             height: 70,child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 children: [
//                  Consumer<TouristProvider>(
//                     builder: (context,value,child) {
//                       return InkWell(onTap: (){
//                         value.addDETAIL(context);
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment ()));
//                         value.clearfn6();
//                       },
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: Container(
//                             height: 50,width: 150,
//                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,),
//                             child: Center(child: Text("Booked",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue))),
//                           ),
//                         ),
//                       );
//                     }
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         )
//       ),
//     );
//   }
// }


