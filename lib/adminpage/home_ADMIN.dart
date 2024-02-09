import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/adminpage/request.dart';
import 'package:touristapp/adminpage/types.dart';
import '../constant/example.dart';
import '../constant/function.daet.dart';
import '../constant/providers.dart';
import '../userpage/loginn.dart';
import 'Bookedd.dart';
import 'Placess.dart';
import 'costomers.dart';

class Home_ADMIN extends StatelessWidget {
  const Home_ADMIN({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
          color: Colors.white,
          child:Center(
            child: Column(
              children: [

                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
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
                      ),
                    ],
                  ),
                ) ,
                SizedBox(height: 100,),
                Consumer<TouristProvider>(
                  builder: (context,value,child) {
                    return InkWell(onTap: (){
                        value.getRegister();
                      value.clearfn5();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Request()));
                    },
                        child: Lists("request"));
                  }
                ),

                SizedBox(height: 22,),
                Consumer<TouristProvider>(
                  builder: (context,value,child) {
                    return InkWell(onTap: (){
                      value.getCustomerInfo();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Costomers()));
                    },
                        child: Lists("Users"));
                  }
                ),
                SizedBox(height: 29,),
                InkWell(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Bookedd()));
                },
                    child: Lists("Booked")),
                SizedBox(height: 29,),
                Consumer<TouristProvider>(
                    builder: (context,value,child) {
                      return InkWell(onTap: (){
                        value.getType();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Types()));
                      },
                          child: Lists("Type"));
                    }
                ),
                SizedBox(height: 29,),
                Consumer<TouristProvider>(
                    builder: (context,value,child) {
                      return InkWell(onTap: (){
                        value.getTypeplaces();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Placesss()));
                      },
                          child: Lists("Places"));
                    }
                ),
                SizedBox(height: 29,),



              ],
            ),
          )




      ),
    );
  }
}
