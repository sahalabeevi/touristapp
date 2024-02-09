import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/userpage/welcome.dart';

import '../constant/function.daet.dart';
import '../constant/loginprovider.dart';
import 'loginn.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth auth = FirebaseAuth.instance;
    var loginUser = auth.currentUser;

    LoginProvider loginProvider=Provider.of<LoginProvider>(context,listen: false);


    Timer( Duration(seconds: 4), () {

      if (loginUser == null) {

        callNextReplacement(context, Login());
      }
      else {
        loginProvider.userAuthorisation(loginUser?.phoneNumber, context);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text("WANDERLUSTERS",style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 35,color: Colors.black,fontFamily: "FontMain"),),
        ),
      ),
    );
  }
}
