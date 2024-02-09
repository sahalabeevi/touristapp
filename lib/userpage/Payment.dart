import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/constant/providers.dart';

import '../constant/example.dart';
import '../constant/function.daet.dart';
import 'Payment2.dart';
import 'booked.dart';

class Payment extends StatefulWidget {
   Payment({super.key});


  @override
  State<Payment> createState() => _PaymentState();
}
List<String> options=[
  "Cardit cart/Debit cart",
  "Google pay",
];
class _PaymentState extends State<Payment> {
  String currentOption =options[0];


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TouristProvider provider = Provider.of<TouristProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [SizedBox(height: 10,width: 7,),
                Row(
                  children: [
                    InkWell(onTap: (){
                      back(context);
                    },
                        child: Icon(Icons.arrow_back,size: 30,)),
                    Center(child: Padding(
                      padding: const EdgeInsets.only(left: 85),
                      child: Text("Payment",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                    )),
                  ],
                ),
                SizedBox(height: 30,),
                Text("Choose Your payment",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                Text("method",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),


                RadioListTile(value:options[0],title:const  Text("Cardit cart/Debit cart",
                  style: TextStyle(fontSize:16,fontWeight: FontWeight.bold ),),
                    groupValue:currentOption, onChanged:(value){
                      setState(() {
                        currentOption= value.toString();
                      });
                    }),
                RadioListTile(value:options[1],title: const Text("Google pay",
                    style:   TextStyle(fontSize:16,fontWeight: FontWeight.bold )),

                    groupValue:currentOption, onChanged:(value){
                      setState(() {
                        currentOption= value.toString();

                      });
                    }),
                SizedBox(height: 10,),
                Center(child: Text("Booking details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),)),
                SizedBox(height: 10,),
                Container(
                  height: 305,width: 330,
                  child:Column(
                    children: [
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left:20),
                        child: Row(
                          children: [
                            Text("Location:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                            SizedBox(width: 100,),


                            Consumer<TouristProvider>(
                              builder: (context,value,child) {
                                return Text(value.pay_map["TYPE_NAME"].toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.blue),);
                              }
                            )


                          ],
                        ),
                      ),

                      SizedBox(height: 7,),
                      Divider(height: 1,color: Colors.grey.withOpacity(1),),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            details("Date:"),
                            SizedBox(width: 130,),
                            Consumer<TouristProvider>(
                              builder: (context,value,child) {
                                return detailss("");
                              }
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 7,),
                      Divider(height: 1,color: Colors.grey.withOpacity(1),),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            details("Time:"),
                            SizedBox(width: 127,),
                            Consumer<TouristProvider>(
                              builder: (context,value,child) {
                                return detailss("");
                              }
                            )
                          ],
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
                                Text("Adults",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                SizedBox(height: 10,),
                                Text("Kids",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),)
                              ],
                            ),
                            SizedBox(width: 45,),
                            Column(
                              children: [
                                details("Counts"),
                                SizedBox(height: 8,),
                                Consumer<TouristProvider>(
                                  builder: (context,value,child) {
                                    return Text("",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),);
                                  }
                                ),
                                SizedBox(height: 10,),
                               Consumer<TouristProvider>(
                                  builder: (context,value,child) {
                                    return Text("",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),);
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
                                    return Text("\$",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue),);
                                  }
                                ),
                                SizedBox(height: 10,),
                                Consumer<TouristProvider>(
                                  builder: (context,value,child) {
                                    return Text("\$",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.blue),);
                                  }
                                )
                              ],
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 14,),
                      Divider(height: 1,color: Colors.grey.withOpacity(1),),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 200),
                        child: Row(
                          children: [
                            details("Total= "),
                           Consumer<TouristProvider>(
                              builder: (context,value,child) {
                                return detailss("\$");
                              }
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 1,
                      color: Colors.grey.withOpacity(1),
                      offset: Offset(0, 2)
                    )]
                  ),
                )

              ],
            ),
          ),
        ),
        bottomNavigationBar:paymentss(),

      ),
    );
  }
}
