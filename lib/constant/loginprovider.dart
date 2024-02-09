import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/constant/providers.dart';
import 'package:touristapp/userpage/otp.dart';


import '../adminpage/home_ADMIN.dart';
import '../models/bottomnavigation.dart';

import '../models/bottomnavigation_ADMIN.dart';
import '../userpage/Homepage.dart';
import 'function.daet.dart';

class LoginProvider extends ChangeNotifier {

String login_userId="";

  TextEditingController Loginphnnumber=TextEditingController();
  TextEditingController otpverifycontroller = TextEditingController();

  String VerificationId = "";
  TextEditingController otp_verbify = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;


  bool loader =false;
  void sendotp(BuildContext context) async {
    loader = true;
    notifyListeners();
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${Loginphnnumber.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context)
            .showSnackBar( SnackBar(
          backgroundColor: Colors.white,
          content: Text(
              "Verification Completed",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w800,)),
          duration:
          Duration(milliseconds: 3000),
        ));
        if (kDebugMode) {}
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content:
            Text("Sorry, Verification Failed"),
            duration: Duration(milliseconds: 3000),
          ));
          if (kDebugMode) {

          }

        }
      },

      codeSent: (String verificationId, int? resendToken) {
        VerificationId = verificationId;
        loader =false;
        notifyListeners();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Otp(),
            ));
        ScaffoldMessenger.of(context)
            .showSnackBar( SnackBar(
          backgroundColor: Colors.white,
          content: Text(
              "OTP sent to phone successfully",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w600,)),
          duration:
          Duration(milliseconds: 3000),
        ));
        Loginphnnumber.clear();
        log("Verification Id : $verificationId");

      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }
  void verify(BuildContext context) async {
print("aaaaaaaaaaaaaaaaaaaaa");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: otpverifycontroller.text);
    await auth.signInWithCredential(credential).then((value) {
      print("zzzzzzzzzzzzzzzzzzzzzz");
      final user = value.user;
      if (user != null) {
        userAuthorisation(user.phoneNumber, context);

      } else {
        if (kDebugMode) {
        }
      }
    });
  }
  String userId='';
String loginphone='';
  void userAuthorisation(String? phone,BuildContext context,){

    String loginType='';
    String name='';


    db.collection("USERS").where("MOBILE_NUMBER",isEqualTo: phone).get().then((value){
      if(value.docs.isNotEmpty){
        for(var e in value.docs){
          Map<dynamic, dynamic> map = e.data();
          loginType= map["TYPE"].toString();
          name= map["NAME"].toString();
          loginphone= map["MOBILE_NUMBER"].toString();
          userId = map["USER_ID"].toString();

          if(loginType == "ADMIN"){


            callNextReplacement(context,Home_ADMIN());
          }else{

            callNextReplacement(context, BottomNav(userid: userId,));
          }
        }
      }
    });
  }
  void clearLogin(){

    Loginphnnumber.clear();
    otpverifycontroller.clear();


  }
}
