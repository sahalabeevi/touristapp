import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/adminpage/types.dart';
import 'package:touristapp/constant/providers.dart';

class Type2 extends StatelessWidget {
  String from;
  String sid;
  Type2({super.key,required this.from,required this.sid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SingleChildScrollView(
  child:   Column(
  
    children: [SizedBox(height: 240,),

      Consumer<TouristProvider>(builder: (context, value, child) {
        return value.fileImage != null ? Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 70,
            backgroundImage: FileImage(
              value.fileImage!,
            ),
          ),
        )
            : value.imageUrl != ""
            ? Center(
          child: InkWell(onTap: (){
            showBottomSheet1(context);
          },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 70,
              backgroundImage: NetworkImage(value.imageUrl),
            ),
          ),
        )
            : Center(
          child: InkWell(onTap: (){
            showBottomSheet1(context);

          },
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70,
                child: Icon(
                  Icons.image,
                  size: 90,
                  color: Colors.grey.shade500,
                )),
          ),
        );
      }),


      SizedBox(width: 300,
  
        child:Consumer<TouristProvider>(
          builder: (context,value,child) {
            return TextField(

                 controller: value.typeController,

                  decoration: InputDecoration(filled: true,

                      fillColor: Colors.white.withOpacity(0.8),

                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(15)

                      )

                  ),

                );
          }
        ),
      ),
      SizedBox(height: 2,),
      InkWell(onTap: (){
      },
        child: Consumer<TouristProvider>(
          builder: (context,value,child) {
            return InkWell(onTap: (){
             if(from=="NEW"){
              value.addtype("NEW", "");
             }
             else{
               value.addtype("EDIT", sid);
             }
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Types()));
            },
              child: Container(height: 45,width: 100,



                child: Center(child: Text("Add",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),)),



                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue,),),
            );
          }
        ),
      )
    ],
  ),
),
    );
  }
}
void showBottomSheet1(BuildContext context) {
  TouristProvider provider =
  Provider.of<TouristProvider>(context, listen: false);

  showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          )),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(
                  Icons.camera_enhance_sharp,
                  color: Colors.black,
                ),
                title: const Text(
                  'Camera',
                ),
                onTap: () =>
                {provider.getImagecamera(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: Colors.black),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                {provider.getImagegallery(), Navigator.pop(context)}),
          ],
        );
      });
  //ImageSource
}