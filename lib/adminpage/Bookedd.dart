import 'package:flutter/material.dart';


import '../constant/example.dart';
import '../models/bottomnavigation_ADMIN.dart';
import 'home_ADMIN.dart';
import 'moredetail.dart';

class Bookedd extends StatelessWidget {
  const Bookedd({super.key});

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Home_ADMIN()));
        },
            child: Icon(Icons.arrow_back)),
          title: text("Booked"),),
        body: ListView.builder(itemCount:2,

            itemBuilder:(BuildContext context,int index){
              return  Container(

                height: 220,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue,),
                margin: EdgeInsets.only(top: 40,right: 30,left: 30),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(height: 50,width: 240,
                    decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),

                    child: Padding(
                      padding: const EdgeInsets.only(top: 13,left: 10),
                      child: Text("Name",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                    ),),
                    SizedBox(height: 10,),
                    Container(height: 50,width: 240, decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13,left: 10),
                      child: Text("Phone",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                    ),),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 65),
                      child: InkWell(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>More()));
                      },
                        child: Container(height: 40,width:120 , decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                          child: Center(child: Text("More Details",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),

                  ],
                ),
              );
            } ),
      ),
    );
  }
}
