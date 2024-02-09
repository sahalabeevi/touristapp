import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/constant/function.daet.dart';
import 'package:touristapp/constant/providers.dart';


class Register extends StatelessWidget {
  String from;
  String oldid;

   Register({super.key,required this.from,required this.oldid});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(image:
      DecorationImage(image: AssetImage("assets/images/img_10.png",),fit: BoxFit.cover,)),

      child: Scaffold(backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("WANDERLUSTERS",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white,fontFamily: "FontMain"),),
                  SizedBox(height: 50,),
                  Consumer<TouristProvider>(builder: (context, value, child) {
                    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhh");
                    print(value.fileImage7);
                    print("image url = ");
                    print(value.imageUrl7);
                    return value.fileImage7!= null ? Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 70,
                        backgroundImage: FileImage(
                          value.fileImage7!,
                        ),
                      ),
                    )
                        : value.imageUrl7 != ""
                        ? Center(
                      child: InkWell(onTap: (){
                        showBottomSheet4(context);
                      },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 70,
                          backgroundImage: NetworkImage(value.imageUrl7),
                        ),
                      ),
                    )
                        : Center(
                      child: InkWell(onTap: (){
                        showBottomSheet4(context);

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
SizedBox(height: 10,),
                  SizedBox(width: 300,
                    child:Consumer<TouristProvider>(
                      builder: (context,value,child) {
                        return TextField(
                          controller: value.nameController,
                          decoration: InputDecoration(labelText: "Name",filled: true,
                              fillColor: Colors.white.withOpacity(0.8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                              )
                          ),

                        );
                      }
                    ),
                  ),

                  SizedBox(height: 20,),
                  SizedBox(width: 300,
                    child: Consumer<TouristProvider>(
                      builder: (context,value,child) {
                        return TextField(
                          controller: value.phoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: "Phone",filled: true,
                              fillColor: Colors.white.withOpacity(0.8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)

                              )
                          ),

                        );
                      }
                    ),
                  ),
                  SizedBox(height: 115,),


                  Container(
                    height: 55,width: 130,
                    child: Consumer<TouristProvider>(
                      builder: (context,value,child) {
                        return InkWell(
                          onTap: (){
                            if(from=="NEW"){
                              value.addregister("NEW","",context);
                              value.clearfn7();

                              back(context);
                            }else{
                              value.addregister("EDIT",oldid,context);
                            }

                          },
                            child:
                            Center(
                                child:
                                    from == "NEW" ?
                                Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),):
                                    Text("UPDATE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),)
                            ));
                      }
                    ),
                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue
                    ),
                  )



                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
void showBottomSheet4(BuildContext context) {
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
                {provider.getImagecamera5(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: Colors.black),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                {provider.getImagegallery5(), Navigator.pop(context)}),
          ],
        );

      });
  //ImageSource
}
