import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/constant/function.daet.dart';
import 'package:touristapp/constant/providers.dart';

import 'Placess_USER.dart';
import 'booked.dart';


class Description extends StatelessWidget {
  List<String> images;
  String name;
  String location;
  String decription;
  String photo;
  String ADULTS_price;
  String KIDS_price;
  Description({super.key,required this.images,required this.name,
    required this.location,required this.decription,required this.photo,required this.ADULTS_price,
    required this.KIDS_price});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: InkWell(
                onTap: () {
                back(context);

                },
                child: Image.network(
                  photo,
                )),
          ),
          Positioned(
              top: 30,
              left: 20,
              child: Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.black,
              )),
          scroll(images,name,location,decription),
        ],
      ),


      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [SizedBox(height: 10,),
                  //Text("\$",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    Text("Adult  \$ $ADULTS_price",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                 // Text("/ADULT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  Text("Kid     \$ $KIDS_price",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ],
              ),

             Consumer<TouristProvider>(
                builder: (context,value,child) {
                  return InkWell(onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Booked(name: name,)));
                  },
                    child: Container(
                      height: 50,width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.blue,),
                      child: Center(child: Text("Book Now",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white))),
                    ),
                  );
                }
              )
            ],
          ),
        ),
        ),
      ),
    );
  }
}

scroll(List<String> img,String name,String location,String decription) {
  return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1.0,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black12,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "More ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text("Images",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 100,
                    child: Consumer<TouristProvider>(
                      builder: (context,value,child) {
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:img.length,
                          itemBuilder: (context,  index) {
                            return Container(margin: EdgeInsets.all(7),
                              height: 100,
                              width: 100,
                              color: Colors.white10,
                              child: ClipRRect(borderRadius: BorderRadius.circular(10),
                                  child: Image.network(img[index],fit: BoxFit.fill,)),
                            );
                          },
                        );
                      }
                    ),
                  ),
                Padding(
                  padding:  EdgeInsets.only(right:225),
                  child: Text(name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Icon(Icons.location_on,color: Colors.blue,),
                      Text(location,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(decription,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                )
              ],
            ),
          ),
        );
      });
}
