import 'package:flutter/material.dart';

import '../constant/example.dart';
import 'PROFILE.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> picture=[
      "assets/images/img_42.png",
      "assets/images/img_31.png",
      "assets/images/img_27.png",
      "assets/images/img_30.png",
      "assets/images/img_32.png",

    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading:  Text("WANDERLUSTERS",style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 23,color: Colors.black,fontFamily: "FontMain"),),
          actions: [ InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
          },
              child: Icon(Icons.favorite_border,color: Colors.red,)),SizedBox(width: 20,)],
        ),
        // drawer: ClipRRect(
        //   borderRadius: BorderRadius.only(
        //       topRight: Radius.circular(10)
        //   ),
        //   child: Drawer(
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.only(
        //           topRight: Radius.circular(10),
        //           bottomRight: Radius.circular(10),
        //         )
        //     ),
        //     child: ListView(
        //       children: [
        //         DrawerHeader(
        //
        //             padding: EdgeInsets.zero,
        //             child: Container(color: Colors.black,
        //                 child: Text("Drawer"))),
        //
        //         SizedBox(height: 200,
        //           child:  ListView.builder(itemCount:1,
        //                     itemBuilder:(BuildContext context,int index){
        //
        //                       return InkWell(onTap: (){
        //
        //
        //                       },
        //                           child: Text("PROFILE",style: TextStyle(fontSize: 20,color: Colors.black),));
        //
        //
        //
        //                     }
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
         body: Column(

           children: [
             // Center(
             //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
             //     children: [
             //       Text("WANDERLUSTERS",style: TextStyle(fontWeight: FontWeight.bold,
             //           fontSize: 23,color: Colors.black,fontFamily: "FontMain"),),
             //       Icon(Icons.favorite,color: Colors.red,)
             //
             //     ],
             //   ),
             // ),

             SizedBox(height: 300,width: MediaQuery.of(context).size.width,
               child: PageView.builder(itemCount: picture.length,padEnds: false,
                   pageSnapping: false,

                   controller: PageController(initialPage: 2,viewportFraction: 0.7),
                   itemBuilder: (context, index){
                     return Container(
                       margin: EdgeInsets.all(8),
                       clipBehavior: Clip.antiAlias,
                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)
                       ),
                       child: Image.asset(picture[index],fit: BoxFit.cover,),
                     );
                   }
               ),

             ),
             Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [SizedBox(width: 10,height: 30,),
                 Text("Who I am",style: TextStyle(fontWeight: FontWeight.bold,fontSize:
                30,color: Colors.black,fontFamily: "FontMain"),),
                 SizedBox(height: 10,),
                 text("Travel booking and trip planner app"),
                 text("This  app have  made  it easier the"),
                 text("ever to  plan and book your next to"),
                 text("vaction.Its helping to easier sutable"),
                 text("places booking travel reservations,"),
                 text("tracking loyalty point,and browsing"),
                 text("travel packages."),
               ],
             )

           ],
         ),
        // Column(
        //   children: [
        //     Container(
        //       width: double.infinity,
        //       height: double.infinity,
        //       decoration: BoxDecoration(image: DecorationImage(image:
        //       AssetImage("assets/images/img_59.png"),fit: BoxFit.cover,)),
        //       child: Scaffold(backgroundColor:Colors.transparent,
        //
        //         body: Column(
        //
        //           children: [
        //
        //             SizedBox(height: 300,width: MediaQuery.of(context).size.width,
        //               child: PageView.builder(itemCount: picture.length,padEnds: false,
        //                   pageSnapping: false,
        //
        //                   controller: PageController(initialPage: 2,viewportFraction: 0.7),
        //                   itemBuilder: (context, index){
        //                     return Container(
        //                       margin: EdgeInsets.all(8),
        //                       clipBehavior: Clip.antiAlias,
        //                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)
        //                       ),
        //                       child: Image.asset(picture[index],fit: BoxFit.cover,),
        //                     );
        //                   }
        //               ),
        //
        //             ),
        //             Column(crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [SizedBox(width: 20,height: 30,),
        //                 Text("Who I am",style: TextStyle(fontWeight: FontWeight.bold,fontSize:
        //                 40,color: Colors.white,fontFamily: "FontMain"),),
        //                 SizedBox(height: 10,),
        //                 text("Travel booking and trip planner app"),
        //                 text("This  app have  made  it easier the"),
        //                 text("ever to  plan and book your next to"),
        //                 text("vaction.Its helping to easier sutable"),
        //                 text("places booking travel reservations,"),
        //                 text("tracking loyalty point,and browsing"),
        //                 text("travel packages."),
        //               ],
        //             )
        //
        //           ],
        //         ),
        //
        //
        //       ),
        //
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
