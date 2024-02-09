import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/constant/providers.dart';

import 'Description.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    TouristProvider provider = Provider.of<TouristProvider>(context,listen: false);

    return SafeArea(
      child: Scaffold(

        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [SizedBox(height: 10,),
            Row(
              children: [SizedBox(width: 10,),
                // InkWell(onTap: (){
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=> Tourplane()));
                // },
                //     child: Icon(Icons.arrow_back_outlined,size: 25,)),
                SizedBox(width: 8,),
                Text("Favourite",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
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
                        var item2= value.Typeplaces[index];
                        return InkWell(onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(images: item2.images,location: item2.location,
                            decription: item2.description,name: item2.type,ADULTS_price: item2.ADULTS_price,KIDS_price: item2.KIDS_price,
                            photo: item2.photo,)));
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

                                  margin: EdgeInsets.all(10),


                                  child: ClipRRect(borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(item2.photo,
                                    ),
                                  ),
                                ),

                                ListTile(
                                    title: Text(item2.type,style: TextStyle(color:
                                    Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                                    subtitle: Row(
                                      children: [Icon(Icons.location_on,size: 13,),
                                        Text(item2.location,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
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
      ),
    );
  }
}
