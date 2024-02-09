import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/constant/loginprovider.dart';
import 'package:touristapp/constant/providers.dart';

import '../constant/example.dart';
import '../constant/function.daet.dart';
import 'EDIT_USER_PROFILE.dart';
import 'Register.dart';
import 'loginn.dart';

class Profile extends StatelessWidget {
  const Profile({super.key,});

  @override
  Widget build(BuildContext context) {
    TouristProvider provider = Provider.of<TouristProvider>(context,listen: false);
    LoginProvider log_provider = Provider.of<LoginProvider>(context,listen: false);

    return Scaffold(
      body: Column(
        children: [
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
        children: [
          SizedBox(height: 30,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Register(from: 'EDIT',oldid: log_provider.userId)));
              },
                  child: Text("Edit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.white10,
                        elevation: 20,
                        content:  Text(
                            "Do you want to Logout ?",style: TextStyle(
                            fontSize:17,

                            fontFamily:'ink nut',
                            fontWeight: FontWeight.w700,
                            color: Colors.yellow)),
                        actions: <Widget>[
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  FirebaseAuth auth = FirebaseAuth.instance;
                                  auth.signOut();
                                  callNextReplacement(context, Login());
                                },
                                child: Container(
                                  height: 45,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color:Colors.red ,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x26000000),
                                          blurRadius: 2.0, // soften the shadow
                                          spreadRadius: 1.0, //extend the shadow
                                        ),
                                      ] ),
                                  child: Center(child:  Text("yes",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                                ),
                              ),
                              TextButton(
                                  onPressed: (){
                                    finish(context);
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 90,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.pink,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x26000000),
                                          blurRadius: 2.0, // soften the shadow
                                          spreadRadius: 1.0, //extend the shadow
                                        ),
                                      ],
                                    ),
                                    child: Center(child: Text("No",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                                  ))
                            ],
                          )

                        ],
                      ),
                    );
                  },
                  child: Text("Logout",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
              ) ,
            ],),


        SizedBox(height: 60,),
        Consumer<TouristProvider>(
          builder: (context,value,child) {
            return CircleAvatar(radius: 100,
                backgroundImage: NetworkImage(value.imageUrl7),);
          }
        ),

        SizedBox(height: 50,),
        Column(
          children: [
            Row(
              children: [SizedBox(width: 40,),
                Text("Name :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Consumer<TouristProvider>(
                  builder: (context,value,child) {
                    return Text(value.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),);
                  }
                )
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [SizedBox(width: 40,),
                Text("Phone :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Consumer<TouristProvider>(
                    builder: (context,value,child) {
                      return Text(value.phone,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),);
                    }
                )

              ],
            ),
            SizedBox(height: 150,),

          ],
        ),

        ],
    ),
      ),
        ],
      ),
    );
  }
}
