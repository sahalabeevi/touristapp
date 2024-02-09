import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/adminpage/placess2.dart';


import '../constant/function.daet.dart';
import '../constant/providers.dart';
import '../models/bottomnavigation_ADMIN.dart';
import 'home_ADMIN.dart';

class Placesss extends StatelessWidget {
  const Placesss({super.key});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TouristProvider provider = Provider.of<TouristProvider>(context,listen: false);
    provider.getTypeplaces();
    return SafeArea(
      child: Scaffold(
        body:  Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [SizedBox(height: 10,),
            Row(
              children: [SizedBox(width: 10,),
                InkWell(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_ADMIN()));
                },
                    child: Icon(Icons.arrow_back_outlined,size: 25,)),
                SizedBox(width: 8,),
                Text("Places",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            ),
            SizedBox(height: 10,),
            Flexible(
              fit: FlexFit.tight,
              child: Consumer<TouristProvider>(
                builder: (context,value,child) {
                  return GridView.builder(itemCount:value.Typeplaces.length,

                      padding: EdgeInsets.symmetric(horizontal: 10),
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.8,mainAxisExtent:186
                      ), itemBuilder: (BuildContext context,int index){
                        var item1 = value.Typeplaces[index];

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
                                                  value.editplace(value.Typeplaces[index].id );
                                                  print(value.Typeplaces[index].id+"kjjjj");
                                                  callNext(context, Plasess2(from: 'EDIT',pid :value.Typeplaces[index].id ,));

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
                                                provider.Deletetplace(value.Typeplaces[index].id,context);
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

                                ]
                            ),

                            child: Column(
                              children: [

                                Container(

                                  margin: EdgeInsets.all(6),


                                  child: ClipRRect(borderRadius: BorderRadius.circular(10),
                                    child:  SizedBox(height: 100,
                                        child: Image.network(item1.photo,fit: BoxFit.cover,)),
                                  ),
                                ),

                                ListTile(
                                    title: Text(item1.type,style: TextStyle(color:
                                    Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                                    subtitle: Row(
                                      children: [Icon(Icons.location_on,size: 13,),
                                        Text(item1.location,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
                                      ],
                                    ),

                                    trailing: Icon(Icons.favorite,color: Colors.red,)
                                )




                              ],
                            ),


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
                value.clearfn1();
               value.getType();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Plasess2(from: "NEW",pid: "",)));
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