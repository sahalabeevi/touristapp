import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:touristapp/constant/loginprovider.dart';
import 'package:touristapp/constant/providers.dart';
// import 'package:touristapp/userpage/plans.dart';
// import 'package:pinput/pinput.dart';
import '../constant/example.dart';
import '../models/bottomnavigation.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String _code="";
    return SafeArea(
      child: Scaffold(
body:
        SingleChildScrollView(
          child: Column(
            children: [SizedBox(height: 70,),

                  Text("Enter Your OTP",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

                  SizedBox(height: 30,),
                  Text("Please enter the verification code send"),
                  Text("to +9895591513"),



SizedBox(height: 150,),

              Center(
                child: Consumer<LoginProvider>(
                    builder: (context,vale,child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child:PinFieldAutoFill(controller: vale.otpverifycontroller,
                          decoration: UnderlineDecoration(
                            textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                            colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
                          ),
                          currentCode: _code,
                          onCodeSubmitted: (code) {
                          },
                          onCodeChanged: (code) {
                            if (code!.length == 6) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              vale.verify(context);

                            }
                          },
                        ),
                        // OtpTextField(
                        //   numberOfFields: 5,
                        //   borderColor: Color(0xFF512DA8),
                        //   //set to true to show as box or false to show as dash
                        //   showFieldAsBox: true,
                        //   //runs when a code is typed in
                        //   onCodeChanged: (String code) {
                        //     //handle validation or checks here
                        //   },
                        //   //runs when every textfield is filled
                        //   onSubmit: (String verificationCode){
                        //   vale.verify(context);
                        //   }, // end on(Submit
                        // ),
                      );
                    }
                ),
              ),
              SizedBox(height: 150,),
              Container(height: 55,width: 110,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.blue,),
                child: ElevatedButton(onPressed: (){
                },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),

                    child: Text("Submit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),)))
            ],
          ),
        ),
      ),
    );
  }
}

class PinTheme {
}
