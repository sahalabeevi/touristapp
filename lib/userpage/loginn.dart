import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/constant/function.daet.dart';
import 'package:touristapp/constant/loginprovider.dart';

import 'Register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          "assets/images/img_10.png",
        ),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "WANDERLUSTERS",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white,
                        fontFamily: "FontMain"),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Consumer<LoginProvider>(
                    builder: (context,value,child) {
                      return SizedBox(
                        width: 300,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [LengthLimitingTextInputFormatter(10)],
                          controller: value.Loginphnnumber,
                          decoration: InputDecoration(
                              labelText: "Phone",
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      );
                    }
                  ),
                  const SizedBox(
                    height: 190,
                  ),
                  Consumer<LoginProvider>(
                    builder: (context,value,child) {
                      return InkWell(onTap: () {
                        value.sendotp(context);
                      },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          height: 55,
                          width: 110,
                          child: Center(
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                  color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue),
                        ),
                      );
                    }
                  ), Container(
                    height: 55,
                    width: 110,
                    child: ElevatedButton(
                        onPressed: () {
                          callNext(context, Register(from: "NEW",oldid: "",));

                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: const Text(
                          "Create",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.white),
                        )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue),
                  ),

                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
