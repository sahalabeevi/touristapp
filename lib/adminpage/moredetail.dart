import 'package:flutter/material.dart';

import '../constant/example.dart';
import 'Bookedd.dart';
import 'costomers.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Row(
                children: [
                  InkWell(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Bookedd()));
                  },
                      child: Icon(Icons.arrow_back)),
                  SizedBox(width: 60,),
                  Center(child: Text("Booking details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),)),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 300,width: 330,
              child:Column(
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left:20),
                    child: Row(
                      children: [
                        Text("Location:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        SizedBox(width: 100,),
                        Text("Manali",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.blue),)
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
                        detailss("1.12.2023")
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
                        detailss("11:00 AM")
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
                        details("Total: "),
                        SizedBox(width: 130,),
                        detailss("\$135"),
                      ],
                    ),
                  ),

                  SizedBox(height: 14,),
                  Divider(height: 1,color: Colors.grey.withOpacity(1),),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        details("Peoples: "),
                        SizedBox(width: 130,),
                        detailss("6"),
                      ],
                    ),
                  ),
                  SizedBox(height: 14,),
                  Divider(height: 1,color: Colors.grey.withOpacity(1),),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        details("Payment Method "),
                        SizedBox(width:40,),
                        detailss("Credit cart"),
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
    );
  }
}
