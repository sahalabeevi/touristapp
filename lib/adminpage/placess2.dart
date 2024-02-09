import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/models/model.dart';

import '../constant/providers.dart';
import 'Placess.dart';

class Plasess2 extends StatelessWidget {
  String from;
  String pid;
  Plasess2({super.key, required this.from, required this.pid});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child:
                  Consumer<TouristProvider>(builder: (context, value, child) {
                return value.fileImage1 != null
                    ? Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 70,
                          backgroundImage: FileImage(
                            value.fileImage1!,
                          ),
                        ),
                      )
                    : value.imageUrl1 != ""
                        ? Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 70,
                              backgroundImage: NetworkImage(value.imageUrl1),
                            ),
                          )
                        : Center(
                            child: InkWell(
                              onTap: () {
                                showBottomSheet(context);
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
            ),
            SizedBox(
              height: 4,
            ),
            SizedBox(
              width: 300,
              child:
                  Consumer<TouristProvider>(builder: (context, value, child) {
                return TextField(
                  controller: value.placesController,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "place",
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                );
              }),
            ),
            SizedBox(
              height: 4,
            ),
            SizedBox(
              width: 300,
              child:
                  Consumer<TouristProvider>(builder: (context, value, child) {
                return TextField(
                  controller: value.LocationController,
                  decoration: InputDecoration(

                      filled: true,
                      hintText: 'Location',
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                );
              }),
            ),

            SizedBox(height: 6,),
            SizedBox(
              width: 300,
              child:
              Consumer<TouristProvider>(builder: (context, value, child) {
                return TextField(
                  controller: value.planingController,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "Discription",
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                );
              }),
            ),
            SizedBox(
              width: 300,
              child:
              Consumer<TouristProvider>(builder: (context, value, child) {
                return TextField(keyboardType: TextInputType.number,
                  controller: value.ADULTS_PriceController,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'ADULTS_PRICE',
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                );
              }),
            ),
            SizedBox(
              width: 300,
              child:
              Consumer<TouristProvider>(builder: (context, value, child) {
                return TextField(keyboardType: TextInputType.number,
                  controller: value.KIDS_PriceController,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'KIDS_PRICE',
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                );
              }),
            ),
            Consumer<TouristProvider>(
              builder: (context,value,child) {
                return Autocomplete<TouristModel>(
                    optionsBuilder:
                        (TextEditingValue textEditingValue) {
                      return value.TypeList.where((TouristModel item) => item.type.toLowerCase()
                          .contains(textEditingValue.text
                          .toLowerCase()))
                          .toList();
                    },
                    displayStringForOption: (TouristModel option) =>
                    option.type,
                    fieldViewBuilder: (BuildContext context,
                        TextEditingController
                        fieldTextEditingController,
                        FocusNode fieldFocusNode,
                        VoidCallback onFieldSubmitted) {
                      WidgetsBinding.instance
                          .addPostFrameCallback((_) {
                        fieldTextEditingController.text =
                            value.typecategorycotroller.text;
                      });

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          child: SizedBox(width: 300,
                            child: TextFormField(
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: "TYPE",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w200,
                                    ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                ),
                              ),
                              onChanged: (txt) {},
                              controller: fieldTextEditingController,
                              focusNode: fieldFocusNode,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "This field is Required";
                                } else {}
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    onSelected: (TouristModel selection) {
                      print("ghj"+selection.type.toString());
                      value.typecategorycotroller.text =
                          selection.type;
                      value.placesselectedcategoryId=selection.id;

                      print(selection.id + "asdfg");
                    },
                    optionsViewBuilder: (BuildContext context,
                        AutocompleteOnSelected<TouristModel> onSelected,
                        Iterable<TouristModel> options) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                            ),
                            width: 200,
                            height: 300,
                            child: ListView.builder(
                              padding: const EdgeInsets.all(10.0),
                              itemCount: options.length,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                final TouristModel option =
                                options.elementAt(index);

                                return GestureDetector(
                                  onTap: () {
                                    onSelected(option);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                    ),
                                    height: 100,
                                    width: 200,
                                    child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(option.type,
                                             ),
                                          const SizedBox(height: 10),
                                        ]),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    );
              }
            ),
            Consumer<TouristProvider>(
              builder: (context,value,child) {
                return InkWell(onTap: (){
                  showBottomSheet(context);
                },
                  child: SizedBox(
                    height: 100,
                    child: value.fileImagelist.isNotEmpty?ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.fileImagelist.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                      return value.fileImagelist[index]!=null? Container(
                       height: 100, width: 100,color: Colors.cyan,
                        child: Image.file(value.fileImagelist[index]),
                      ):Container(
                        height: 100, width: 100,color: Colors.cyan,
                        child: Text("IMAGE"),
                        );

                    },
                    ):Container(
                      height: 100, width: 100,color: Colors.cyan,
                      child: Center(child: Text("IMAGE")),
                    )
                  ),
                );
              }
            ),
            SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
              child:
                  Consumer<TouristProvider>(builder: (context, value, child) {
                return InkWell(
                  onTap: () {
                    if (from == "NEW") {
                      value.addtypeplaces("NEW", "");
                    } else {
                      value.addtypeplaces("EDIT", pid);
                    }

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Placesss()));
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    child: Center(
                        child: Text(
                      "Add",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                  ),
                );
              }),
            ),

          ],
        ),
      )),
    );
  }
}

void showBottomSheet(BuildContext context) {
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
                    {provider.getImagecamera1(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: Colors.black),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                    {provider.getImagegallery1(), Navigator.pop(context)}),
          ],
        );

      });
  //ImageSource
}
