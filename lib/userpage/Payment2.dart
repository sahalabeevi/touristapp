import 'package:flutter/material.dart';

import 'Success.dart';

class paymentss extends StatelessWidget {
  const paymentss({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child:
      Container(decoration: BoxDecoration(color: Colors.blue,
          borderRadius: BorderRadius.only
            (topRight: Radius.circular(10),topLeft:Radius.circular(10), )),
        height: 70,child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Success ()));
              },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 50,width: 150,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,),
                    child: Center(child: Text("Pay",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
