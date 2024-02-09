



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../adminpage/request.dart';

Widget myplance( Color myColor){
  return  Container(
    color:myColor ,

    child:         Column(
      children: [

        SizedBox(height: 10,),
        GridView.count(crossAxisCount: 2,childAspectRatio: 0.8,
          shrinkWrap: true,
          children: [
            for(int i=1; i<8;)
              Container(decoration: BoxDecoration(
                  color: myColor,borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: myColor.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 8,
                    )
                  ]
              ),
                child:Column(
                  children: [],
                ) ,
              )
          ],)
      ],
    ),
  );
}

Widget text(String name){
  return Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize:
  20,color: Colors.black,fontFamily: "FontMain"));
}
Widget Lists(String name){
  return Container(height: 60,width: 220,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue),
  child: Center(child: Text(name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),);
}

Widget profile(){
  return Column(
    children: [
      SizedBox(height: 60,),
      Container(height: 200,width: 200,child: Icon(Icons.person,color: Colors.black,size: 130,),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(360),color:Colors.blue ),),
      SizedBox(height: 50,),
      Column(
        children: [
          Row(
            children: [SizedBox(width: 40,),
             Text("Name :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [SizedBox(width: 40,),
              Text("Phone :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ],
          ),
          SizedBox(height: 150,),
          Container(height: 55,width: 110,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.blue,),
              child: ElevatedButton(onPressed: (){

              },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),

                  child: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),)))

        ],
      ),

    ],
  );
}
Widget text1(String name){
  return Padding(
    padding: const EdgeInsets.only(left: 14),
    child: Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize:
    20,color: Colors.black,)),
  );
}
Widget Otppp(){
  return     SizedBox(width: 60,
    child: TextField(
      decoration: InputDecoration(filled: true,
          fillColor: Colors.blue,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)

          )
      ),

    ),
  );
}
Widget details(String name){
  return
    Text(name,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),);
}

Widget detailss(String name){
return
  Text(name,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.blue),);
}


// Flexible(
// fit: FlexFit.tight,
// child: GridView.builder(itemCount:moviePosters.length,
// padding: EdgeInsets.symmetric(horizontal: 10),
// gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
// mainAxisSpacing: 20,
// crossAxisSpacing: 20,
// childAspectRatio: 0.8,
//
// ), itemBuilder: (BuildContext context,int index){
// return Container(
//
// decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,
// image: DecorationImage(image: AssetImage(moviePosters[index]),
//
// ),
//
//
// boxShadow: [
//
// BoxShadow(blurRadius: 2,color: Colors.grey,
// offset: Offset(0,1)),
//
// ]
// ),
// child: Stack(children: [
// Container(height: 50,width: 50,),
// Positioned(right: 20,left: 30,bottom:10,
// child: Text(chat[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))]),
//
// );
// }
// ),
// ),
// ElevatedButton(onPressed: (){
// Navigator.push(context,MaterialPageRoute(builder: (context)=>Oto() ));
// },
//
// child:),

// Flexible(
// fit: FlexFit.tight,
// child: GridView.builder(itemCount:moviePosters.length,
//
// padding: EdgeInsets.symmetric(horizontal: 10),
// gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
// mainAxisSpacing: 20,
// crossAxisSpacing: 20,
// childAspectRatio: 0.8,
//
//
// ), itemBuilder: (BuildContext context,int index){
// return Container(
//
// decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,
// boxShadow: [
//
// BoxShadow(blurRadius: 2,color: Colors.grey,
// offset: Offset(0,1)),
//
// ]
// ),
// child: Column(
// children: [
// Container(
// margin: EdgeInsets.all(10),
// child: Image.asset(moviePosters[index],scale:2,),
// ),
//
// Padding(
// padding: const EdgeInsets.only(bottom: 10),
// child: Container(
// child: Text(chat[index],style: TextStyle(
// fontSize: 20,fontWeight: FontWeight.bold
// ),),
// ),
// )
// ],
// )
//
// );
// }
// ),
// ),

// Text("Manali",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
// SizedBox(height: 5,),
// Row(
// children: [
// Icon(Icons.location_on,color: Colors.blue,),
// Text("India"),
// ],
// ),
// SizedBox(height: 15,),
// Text("Today, as you reach Manali,you will"),
// Text("be transferred to the hotel,with the"),
// Text("help of one of/ /our trusted agents"),
// Text("who will receive you at the railway"),
// Text("station/bus station.Now as you"),
// Text("reach the hotel, freshen up and get"),
// Text("ready to embark on an exciting and"),
// Text("thrilling Manali sightseeingtour.As"),
// Text("you start the tour,you will visit the"),
// Text("sacredHadimba Temple with your"),
// Text("loved ones. Hadimba Templeis a "),
// Text("religious hub for thelocals there "),
// Text("and an importantsight for the "),
// Text("tourists. Dedicatedto Goddess "),
// Text("Hadimba, youwill fall in love with"),
// Text("thelocation where the templeis"),
// Text("situated. Surrounded by luscious "),
// Text("pine and cedarforests and lofty"),
// Text("mountains,the temple certainly"),
// Text("offersscenic and photographic views"),
// Text("Later in the day, also visit places"),
// Text("like VanVihar, Vashisht Baths, The"),
// Text("Great Himalayan National Park,"),
// Text("Manu Temple, Nehru Kund etc. And"),
// Text("when it'stime to wind up the day,"),
// Text("youcan explore the lively markets "),
// Text("of Manali. These markets offer a "),
// Text("wide variety of handmade products"),
// Text("or the vacationers to take back"),
// Text("home as souvenirs.End the day by"),
// Text("heading back to hotel. Enjoy a "),
// Text("delicious dinnerand an overnight"),
// Text(" stay at the hotel.")



// Column(
// children: [
// Container(
// height: 450,width: 400,
// child: ClipRRect(borderRadius: BorderRadius.circular(20),
// child: Image.asset("assets/images/img_58.png",fit: BoxFit.cover,)),
//
// ),
// SizedBox(height: 20,),
//
// Row(
// children: [SizedBox(width:30 ,),
// Text("More ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
// Text("Images",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
//
// ],
// ),
// SizedBox(height: 10,),
// Flexible(
// fit: FlexFit.tight,
// child: GridView.builder(itemCount:image.length,
//
// padding: EdgeInsets.symmetric(horizontal: 10),
// gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
// mainAxisSpacing: 10,
// crossAxisSpacing: 10,
// childAspectRatio: 0.8,mainAxisExtent:80
// ), itemBuilder: (BuildContext context,int index){
// return
// Container(
//
// decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,
//
// ),
// child: ClipRRect(borderRadius: BorderRadius.circular(10),
// child: Image.asset(image[index],fit: BoxFit.cover,)),
// );
//
// }
// ),
// ),
// SizedBox(height: 15,),
// Column(
// children: [
// Text("Manali",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
// SizedBox(height: 5,),
// Row(
// children: [
// Icon(Icons.location_on,color: Colors.blue,),
// Text("India"),
// ],
// ),
// SizedBox(height: 15,),
// Text("Today, as you reach Manali,you will"),
// Text("be transferred to the hotel,with the"),
// Text("help of one of/ /our trusted agents"),
// Text("who will receive you at the railway"),
// Text("station/bus station.Now as you"),
//
//
// ],
// )
// ],
// ),

//    ListView.builder(itemCount:chat.length,
//
//                 itemBuilder:(BuildContext context,int index){
//                   return  Container(
//                     height: 60,width: 70,
//                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue,),
//                     margin: EdgeInsets.only(top: 40,right: 30,left: 30),
//
//                     child: Center(child: Text(chat[index],style: TextStyle(color: Colors.white,
//                       fontWeight: FontWeight.bold,fontSize: 23
//                     ),)),
//                   );
//                 } ),



// Flexible(
// fit: FlexFit.tight,
// child: GridView.builder(itemCount:image.length,
//
// padding: EdgeInsets.symmetric(horizontal: 10),
// gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
// mainAxisSpacing: 10,
// crossAxisSpacing: 10,
// mainAxisExtent:80
// ), itemBuilder: (BuildContext context,int index){
// return
// Container(
//
// decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,
//
// ),
// child: ClipRRect(borderRadius: BorderRadius.circular(10),
// child: Image.asset(image[index],fit: BoxFit.cover,)),
// );
//
// }
// ),
// ),