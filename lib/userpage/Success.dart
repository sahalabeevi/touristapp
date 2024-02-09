import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Center(
          child: Column(
            children: [
              Center(
                child: Container(height: 100,width: 100,

                child: Icon(Icons.check,color: Colors.white,size: 50,),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(360),color: Colors.blue,),),
              ),
              SizedBox(height: 20,),
              Text("Payment Success",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),)
            ],
          ),
          
        ),
        
      )
    );
  }
}
