import 'package:flutter/material.dart';

import 'loginn.dart';
class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(decoration: BoxDecoration(image:
    DecorationImage(image: AssetImage("assets/images/img_41.png",),fit: BoxFit.cover,)),
    child: Scaffold(backgroundColor: Colors.transparent,
      body:
      Column(children: [SizedBox(height: 200,),
        Center(
          child: Text("WANDERLUSTERS",style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 35,color: Colors.black,fontFamily: "FontMain"),),
        ),
SizedBox(height: 300,),
          Container(height: 50,width: 150,
              child:  ElevatedButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Login() ));
              },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),

                  child: Text("Get start",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),)),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.blue),

            ),


      ],),
    ),);

  }
}

