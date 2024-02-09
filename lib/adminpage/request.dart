import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/constant/providers.dart';

import '../constant/example.dart';

class Request extends StatelessWidget {
  const Request({super.key});

  @override
  Widget build(BuildContext context) {

    TouristProvider provider = Provider.of<TouristProvider>(context,listen: false);
    return Scaffold(appBar: AppBar(
        title: text("request")

    ),
      body:Consumer<TouristProvider>(
        builder: (context,value,child) {
          return ListView.builder(
            shrinkWrap: true,
              itemCount:value.Typeregister.length,

              itemBuilder:(BuildContext context,int index){
                var item3 = value.Typeregister[index];
                return  Container(

                  height: 220,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue,),
                  margin: EdgeInsets.only(top: 40,right: 30,left: 30),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(height: 50,width: 240,
                        decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),

                        child: Padding(
                          padding: const EdgeInsets.only(top: 13,left: 10),
                          child: Text(item3.name,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        ),),
                      SizedBox(height: 10,),
                      Container(height: 50,width: 240, decoration: BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 13,left: 10),
                          child: Text(item3.phone,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        ),),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child:Consumer<TouristProvider>(
                          builder: (context,value,child) {
                            return Row(
                              children: [
                                InkWell(onTap: (){
                                  print("hcvhjgcgdc");
                                  value.acceptRequest(item3.id,item3.name,item3.phone,context);
                                },
                                  child: Container(height: 40,width:120 , decoration: BoxDecoration(color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                    child: Center(child: Text("Accept",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                InkWell(onTap: (){
                                  value.declineRequest(item3.id,context);
                                },
                                  child: Container(height: 40,width:120 , decoration: BoxDecoration(color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                    child: Center(child: Text("Decline",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                                  ),
                                ),
                              ],
                            );
                          }
                        ),
                      ),

                    ],
                  ),


                );
              } );
        }
      ),
    );
  }
}



