import 'package:flutter/material.dart';


import '../constant/example.dart';
import '../models/bottomnavigation_ADMIN.dart';
import 'home_ADMIN.dart';

class Otp1 extends StatelessWidget {
  const Otp1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          children: [SizedBox(height: 70,),

            Text("Enter Your OTP",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

            SizedBox(height: 30,),
            Text("Please enter the verification code send"),
            Text("to +91 8534677896"),



            SizedBox(height: 150,),

            Center(
              child: Row(children: [SizedBox(width: 40,),

                Otppp(),
                SizedBox(width: 10,),
                Otppp(),
                SizedBox(width: 10,),
                Otppp(),
                SizedBox(width: 10,),
                Otppp()
              ],),
            ),
            SizedBox(height: 150,),
            Container(height: 55,width: 110,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.blue,),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Home_ADMIN() ));
                },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),

                    child: Text("Submit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),)))
          ],
        ),
      ),
    );
  }
}
