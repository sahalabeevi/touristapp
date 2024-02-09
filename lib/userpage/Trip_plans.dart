import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/providers.dart';
import 'Placess_USER.dart';



class Tripplance extends StatelessWidget {
  String userid;
   Tripplance({super.key,required this.userid});

  @override
  Widget build(BuildContext context) {
    TouristProvider provider = Provider.of<TouristProvider>(context,listen: false);
    provider.getType();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body:  Column(
          children: [SizedBox(height: 5,),
            Text("Trip plans",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Flexible(
              fit: FlexFit.tight,
              child: Consumer<TouristProvider>(
                  builder: (context,value,child) {
                    return GridView.builder(itemCount:value.TypeList.length,

                        padding: EdgeInsets.symmetric(horizontal: 10),
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.8,
                          mainAxisExtent:166,


                        ), itemBuilder: (BuildContext context,int index){
                          var item = value.TypeList[index];
                          return InkWell(onTap: () {print(value.TypeList[index].id.toString()+"pzooxo");
                            value.getallplacestypes(value.TypeList[index].id.toString());
                            // if(index==0) {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>placess(type: item.type, userid: userid,)));
                            // }
                          },
                            child: Container(

                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,
                                    boxShadow: [

                                      BoxShadow(blurRadius: 2,color: Colors.grey,
                                          offset: Offset(0,1)),

                                    ]
                                ),
                                child:


                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [

                                    SizedBox(height: 100,
                                        child: Image.network(item.photo,fit: BoxFit.fill,)),
                                    Text(item.type,style: TextStyle(
                                        fontSize: 20,fontWeight: FontWeight.bold
                                    ),),],
                                )

                            ),
                          );
                        }
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
