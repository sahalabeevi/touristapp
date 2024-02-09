import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/constant/providers.dart';
import '../constant/example.dart';


class Costomers extends StatelessWidget {
  const Costomers({super.key});

  @override
  Widget build(BuildContext context) {

    TouristProvider provider = Provider.of<TouristProvider>(context,listen: false);
    return
      SafeArea(
        child: Scaffold(appBar: AppBar(
          title: text("Users")

        ),

          body: Consumer<TouristProvider>(
            builder: (context,value,child) {
              print("vwdcvwdcvdb"+value.Typeregister.length.toString());
              return ListView.builder(

                  itemCount:value.Typeregister.length,

                  itemBuilder:(BuildContext context,int index){
                    var item5 = value.Typeregister[index];
                    return  Container(

                      height: 170,
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
                              child: Text(item5.name,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                            ),),
                          SizedBox(height: 10,),
                          Container(height: 50,width: 240, decoration: BoxDecoration(color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 13,left: 10),
                              child: Text(item5.phone,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                            ),),
                          SizedBox(height: 10,),


                        ],
                      ),


                    );
                  } );
            }
          ),
        ),
      );

  }
}
