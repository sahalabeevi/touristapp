import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/adminpage/types2.dart';

import '../constant/function.daet.dart';
import '../constant/providers.dart';

class Types extends StatelessWidget {
  const Types({super.key});

  @override
  Widget build(BuildContext context) {
    TouristProvider provider = Provider.of<TouristProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        body:
        Column(
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
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.8,mainAxisExtent: 170
                      ), itemBuilder: (BuildContext context,int index){
                    var item = value.TypeList[index];
                        return InkWell(
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                backgroundColor: Color(0xffD9D9D9),

                                content:Text("Are you sure want to edit or delete?",
                                  style: TextStyle(
                                    fontSize: 15,
                                    // fontFamily: 'Futura',
                                    color:  Color(0xff35103B),
                                  ),),
                                actions: [
                                  Row(
                                    children: [
                                      Consumer<TouristProvider>(
                                          builder: (context,value,child) {
                                            return TextButton(
                                                onPressed: () {
                                                  finish(context);
                                                  value.editType(value.TypeList[index].id );
                                                  print(value.TypeList[index].id+"kjjjj");
                                                  callNext(context, Type2(from: 'EDIT',sid :value.TypeList[index].id ,));

                                                },
                                                child: Text("EDIT",
                                                  style: TextStyle(fontSize: 15,  fontFamily: 'Futura',color:Color(0xff35103B)
                                                  ),));
                                          }
                                      ),

                                      Consumer<TouristProvider>(
                                          builder: (context,value,child) {
                                            return TextButton(
                                              onPressed: () {
                                                provider.Deletetype(value.TypeList[index].id,context);
                                                finish(context);

                                              },

                                              child: Text("DELETE",
                                                style: TextStyle(fontSize: 15,  fontFamily: 'Futura',color:Color(0xffFF0000)
                                                ),),
                                            );
                                          }
                                      ),

                                    ],
                                  ),
                                ],



                              ),
                            );
                          },
                          child: Container(

                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,
                                  boxShadow: [

                                    BoxShadow(blurRadius: 2,color: Colors.grey,
                                        offset: Offset(0,1)),

                                  ],
                              ),
                              child: Column(
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
        floatingActionButton: Consumer<TouristProvider>(
          builder: (context,value,child) {
            return FloatingActionButton(
              onPressed: (){
               value.clearfn();

                Navigator.push(context, MaterialPageRoute(builder: (context)=>Type2(from: "NEW",sid: "",)));
              },
              backgroundColor: Colors.blue,
              child: Icon(Icons.add),
            );
          }
        ),
      ),
    );
  }
}
