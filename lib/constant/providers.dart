import 'dart:collection';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:touristapp/constant/function.daet.dart';
import '../models/model.dart';
import '../userpage/PROFILE.dart';
import 'loginprovider.dart';
class TouristProvider extends ChangeNotifier {

  final FirebaseFirestore db = FirebaseFirestore.instance;
  final DatabaseReference dr = FirebaseDatabase.instance.ref();
  firebase_storage.Reference ref = FirebaseStorage.instance.ref("Images");
  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  TextEditingController typeController = TextEditingController();
  TextEditingController placesController = TextEditingController();
  TextEditingController LocationController = TextEditingController();
  TextEditingController planingController = TextEditingController();
  TextEditingController ADULTS_PriceController= TextEditingController();
  TextEditingController KIDS_PriceController= TextEditingController();
  TextEditingController typecategorycotroller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  File? fileImage;
  String imageUrl = "";
  File? fileImage1;
  String imageUrl1 = "";

  List<TouristModel> TypeList = [];
  List<Touristplaces> Typeplaces = [];
  List<Registermodel> Typeregister = [];
  List<File> fileImagelist = [];

  Future<void> addtype(String from, String id) async {
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    DateTime tod = DateTime.now();
    String stdid = tod.millisecondsSinceEpoch.toString();
    HashMap<String, Object> map = HashMap();
    map["TYPE_NAME"] = typeController.text.toString();
    print(map["TYPE_NAME"]);
    map["DATE"] = tod;
    if (from == "NEW") {
      map["TYPE_ID"] = stdid;
    }
    map["ADDED_BY"] = "";


    if (fileImage != null) {
      print("Image is not null");
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();

      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(fileImage!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;
          // categorymap["id photo"] = photoId;
          //  editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['PHOTO'] = imageUrl;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    if (from == "NEW") {
      db.collection("TOURIST").doc(stdid).set(map);
      notifyListeners();
    } else {
      db.collection("TOURIST").doc(id).update(map);
      notifyListeners();
    }

    getType();


    notifyListeners();
  }

  void setImage(File imagee) {
    fileImage = imagee;


    notifyListeners();
  }


  Future getImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // setImage(File(pickedImage.path));
      cropImage(pickedImage.path);
      // print("hjkl"+pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

  Future getImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropImage(pickedImage.path);
      // setImage(File(pickedImage.path));

    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      fileImage = File(croppedFile.path);
      notifyListeners();
    }
  }

  void clearfn() {
    typeController.clear();
    fileImage = null;
    imageUrl = "";
  }

  void getType() {
    db.collection("TOURIST").get().then((value1) {
      TypeList.clear();
      if (value1.docs.isNotEmpty) {
        for (var value in value1.docs) {
          TypeList.add(TouristModel(value.id,
              value.get("PHOTO").toString(), value.get("TYPE_NAME").toString()
          ));
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }

  void editType(String sid) {
    db.collection("TOURIST").doc(sid).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic>map = value.data() as Map;
        typeController.text = map["TYPE_NAME"].toString();
        imageUrl = map["PHOTO"].toString();
        notifyListeners();
      }
    });
  }

  void Deletetype(sid, context) {
    db.collection("TOURIST").doc(sid).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Delete"),
      backgroundColor: Colors.blue,));
    getType();
    notifyListeners();
  }

  String placesselectedcategoryId = "";

  Future<void> addtypeplaces(String from, String id) async {
    print("sahalaaa");
    DateTime tod = DateTime.now();
    String stdid = tod.millisecondsSinceEpoch.toString();
    HashMap<String, Object> map = HashMap();
    HashMap<String, Object> Imagemap = HashMap();
    map["TYPE_NAME"] = placesController.text.toString();
    map["Location"] = LocationController.text.toString();
    map["Description"] = planingController.text.toString();
    map["ADULTS_PRICE"]=ADULTS_PriceController.text.toString();
    map["KIDS_PRICE"]=KIDS_PriceController.text.toString();
    map["Type"] = typecategorycotroller.text.toString();
    map["Type_ID"] = placesselectedcategoryId;

    map["DATE"] = tod;
    if (from == "NEW") {
      map["TOURIST_ID"] = stdid;
    }
    map["ADDED_BY"] = "";


    if (fileImage1 != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(fileImage1!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;
          // categorymap["id photo"] = photoId;
          //  editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['PHOTO'] = imageUrl1;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    if (fileImagelist.isNotEmpty) {
      int k = 0;
      for (File i in fileImagelist) {
        k++;
        String imgKey = "Image" + k.toString();
        String time = DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
        ref = firebase_storage.FirebaseStorage.instance.ref().child(time);
        await ref.putFile(i).whenComplete(() async {
          await ref.getDownloadURL().then((value) async {
            Imagemap[imgKey] = value;
          });
        });
      }
    }
    map["Images"] = Imagemap;
    if (from == "NEW") {
      db.collection("TOURISTPLACES").doc(stdid).set(map);
    }
    else {
      db.collection("TOURISTPLACES").doc(id).update(map);
    }
    getTypeplaces();


    notifyListeners();
  }

  void setImage1(File imagee) {
    fileImage1 = imagee;


    notifyListeners();
  }


  Future getImagegallery1() async {
    final imagePicker = ImagePicker();
    final pickedImage1 =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage1 != null) {
      // setImage(File(pickedImage.path));
      cropImage1(pickedImage1.path);
      // print("hjkl"+pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

  Future getImagecamera1() async {
    final imagePicker = ImagePicker();
    final pickedImage1 =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage1 != null) {
      print("dfghjk" + pickedImage1.path);
      cropImage1(pickedImage1.path);
      // setImage(File(pickedImage.path));

    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage1(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      fileImage1 = File(croppedFile.path);
      fileImagelist.add(fileImage1!);
      notifyListeners();
    }
  }

double adultPrice_basic = 0.0;
double childPrice_basic = 0.0;
double adult_totalamnt = 0.0;
double child_totalamnt = 0.0;
double grand_totalamnt = 0.0;

  void getTypeplaces() {
    db.collection("TOURISTPLACES").get().then((value1) {
      if (value1.docs.isNotEmpty) {
        Typeplaces.clear();
        for (var value in value1.docs) {
          Map<dynamic, dynamic> map = value.data();
          List<String> workImageList = [];
          if (map["Images"] != null || map["Images"] != '') {
            map["Images"].forEach((key, value) {
              workImageList.add(value);
            });
          } else {
            map["Images"] = '';
          }
          adultPrice_basic = double.parse(value.get("ADULTS_PRICE").toString());
          childPrice_basic = double.parse(value.get("KIDS_PRICE").toString());
          Typeplaces.add(Touristplaces(value.id,
              value.get("PHOTO").toString(),
              value.get("TYPE_NAME").toString(),
              value.get("Location"),
              value.get("Description"),
              workImageList,
              value.get("ADULTS_PRICE").toString(),
            value.get("KIDS_PRICE").toString(),



          ));
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }

  int adult_count = 0;
  int child_count =0;
  double total_amnt = 0.0;

  void Increment(int count, double basic_price,String from)
  {
        if (count >= 0) {
          if(from == "adult")
            adult_totalamnt = basic_price * count;
          else
            child_totalamnt = basic_price * count;
        }
       find_total();
        notifyListeners();
  }

  void decrement(int count, double basic_price,String from)
  {
    if (count >= 0) {
      if(from == "adult")
        adult_totalamnt = basic_price * count;
      else
        child_totalamnt = basic_price * count;
    }
   find_total();
    notifyListeners();
  }
  void find_total(){
    total_amnt= child_totalamnt+adult_totalamnt;
  }
  void clearfn1() {
    placesController.clear();
    LocationController.clear();
    planingController.clear();
    ADULTS_PriceController.clear();
    KIDS_PriceController.clear();
    fileImage1 = null;
    imageUrl1 = "";

  }

  void editplace(String pid) {
    db.collection("TOURISTPLACES").doc(pid).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic>map = value.data() as Map;
        placesController.text = map["TYPE_NAME"].toString();
        LocationController.text = map["Location"].toString();
        planingController.text = map["Description"].toString();
        ADULTS_PriceController.text=map["ADULTS_PRICE"].toString();
       KIDS_PriceController.text=map["KIDS_PRICE"].toString();

        imageUrl1 = map["PHOTO"].toString();
        notifyListeners();
      }
    });
  }


  void Deletetplace(pid, context) {
    db.collection("TOURISTPLACES").doc(pid).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Delete"),
      backgroundColor: Colors.blue,));
    getTypeplaces();
    notifyListeners();
  }

  void getallplacestypes(String typeid) {
    db.collection("TOURISTPLACES").where("Type_ID", isEqualTo: typeid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        Typeplaces.clear();
        for (var value in value.docs) {
          Map<dynamic, dynamic> productmap = value.data();
          List<String> workImageList = [];
          if (productmap["Images"] != null || productmap["Images"] != '') {
            productmap["Images"].forEach((key, value) {
              workImageList.add(value);
            });
          } else {
            productmap["PHOTO"] = '';
          }
          adultPrice_basic = double.parse(value.get("ADULTS_PRICE").toString());
          childPrice_basic = double.parse(value.get("KIDS_PRICE").toString());
          Typeplaces.add(Touristplaces(
              productmap ["TOURIST_ID"].toString(),
              productmap ["PHOTO"].toString(),
              productmap ["TYPE_NAME"].toString(),
              productmap ["Location"].toString(),

              productmap ["Description"].toString(),
              workImageList,
              productmap ["ADULTS_PRICE"].toString(),
            productmap ["KIDS_PRICE"].toString(),



          ));
          notifyListeners();
        }
      }
      print(Typeplaces.length.toString() + "sssjd");
      notifyListeners();
    });
  }
  void clearfn6() {
    dateController.clear();
    timeController.clear();
    adult_count= 0;
    child_count = 0;
    adult_totalamnt=0;
    child_totalamnt=0;
    total_amnt=0;
  }


  File? fileImage7;
  String imageUrl7 = "";

  Future<void> addregister(String from, String oldid,BuildContext context) async {
    print("sahalaaa");
    DateTime top = DateTime.now();
    String id = top.millisecondsSinceEpoch.toString();
    HashMap<String, Object>map = HashMap();
    map["NAME"] = nameController.text.toString();
    map["MOBILE_NUMBER"] = phoneController.text.toString();
    map["DATE"] = top;

    map["Added_By"] = "";
    map["TYPE"] = "USER";

    HashMap<String, Object>usermap = HashMap();
    usermap["NAME"] = nameController.text;
    if (from == "NEW") {
      map["USER_ID"] = id;
      map["STATUS"] = "REQUEST";
    }
    if (fileImage7 != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();

      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(fileImage7!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;

          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    }
    if (from == "NEW") {
      db.collection("CUSTOMERS").doc(id).set(map);

      db.collection("USERS").doc(id).set(usermap);
    } else {
      print(oldid + "djhhfhfh");
      db.collection("CUSTOMERS").doc(oldid).update(map);

      db.collection("USERS").doc(oldid).update(usermap);
    }
    getUser(oldid);
    // getData();
    notifyListeners();
    callNext(context, Profile());

  }

  void setImage5(File imagee) {
    fileImage7 = imagee;


    notifyListeners();
  }


  Future getImagegallery5() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // setImage(File(pickedImage.path));
      cropImage5(pickedImage.path);
      // print("hjkl"+pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

  Future getImagecamera5() async {
    final imagePicker = ImagePicker();
    final pickedImage5 =
    await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage5 != null) {
      // print("dfghjk"+pickedImage.path);
      cropImage5(pickedImage5.path);
      setImage5(File(pickedImage5.path));
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage5(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      fileImage7 = File(croppedFile.path);
      notifyListeners();
    }
    notifyListeners();
  }

  void clearfn7() {
    nameController.clear();
    phoneController.clear();
    fileImage7 = null;
    imageUrl7 = "";
  }


  String name = "";
  String id = "";
  String phone = "";
  String photo = "";


  void getUser(String userid) {
    print("user = $userid");
    db.collection("CUSTOMERS").where("USER_ID", isEqualTo: userid)
        .get()
        .then((value) {
          print("22222222222222222222");
          print(value.toString());
      if (value.docs.isNotEmpty) {
        print("33333333333333333333333");
        for (var value in value.docs) {
          Map<String, dynamic> map = value.data();
          id = value.id;
          name = map["NAME"].toString();
          phone = map["MOBILE_NUMBER"].toString();

          //photo = map["PHOTO"] ?? "";
          imageUrl7 = map["PHOTO"] ?? "";

          nameController.text = name;
          phoneController.text = phone;
          print("name = $name \n phone = $phone");
          // usersList.add(usersModel(
          //     value.get("Name"), value.get("Addres"), value.id,
          //     value.get("Phone")));
          notifyListeners();
        }
        notifyListeners();
      }
      notifyListeners();
    });
  }

  void getRegister() {
    print("code heree");
    db.collection("CUSTOMERS").where("STATUS", isEqualTo: "REQUEST")
        .get()
        .then((value1) {
      Typeregister.clear();

      if (value1.docs.isNotEmpty) {
        for (var value in value1.docs) {
          Typeregister.add(Registermodel(value.id,

            value.get("NAME").toString(), value.get("MOBILE_NUMBER").toString(),

            // value.get("PHOTO").toString(),

          ));
          notifyListeners();
        }
      }
    });
  }

  void acceptRequest(String id, String name, String phone,
      BuildContext contxt) {
    HashMap<String, Object> map = HashMap();
    map["STATUS"] = "ACCEPT";
    db.collection("CUSTOMERS").doc(id).update(map);

    HashMap<String, Object> userMap = HashMap();
    userMap["NAME"] = name;
    userMap["MOBILE_NUMBER"] = "+91" + phone;
    userMap["TYPE"] = "USER";
    userMap["USER_ID"] = id;
    db.collection("USERS").doc(id).set(userMap);
    ScaffoldMessenger.of(contxt).showSnackBar(const SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          "accepted successfully ",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
        )));

    getRegister();
    notifyListeners();
  }

  void declineRequest(id, BuildContext contxt) {
    HashMap<String, Object> map = HashMap();
    map["STATUS"] = "DECLINE";
    db.collection("CUSTOMERS").doc(id).update(map);
    ScaffoldMessenger.of(contxt).showSnackBar(const SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          "declined successfully ",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
        )));
    getRegister();
    notifyListeners();
  }

  void getCustomerInfo() {
    notifyListeners();
    db
        .collection("CUSTOMERS")
        .where("STATUS", isEqualTo: "ACCEPT")
        .get()
        .then((value1) {
      notifyListeners();

      if (value1.docs.isNotEmpty) {
        print("gvchmvch");

        for (var value in value1.docs) {
          Typeregister.add(Registermodel(value.get("USER_ID").toString(),
            value.get("NAME").toString(), value.get("MOBILE_NUMBER").toString(),
            // value.get("PHOTO").toString(),
          ));
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }

  void edit_USERS(String pid) {
    db.collection("USERS").doc(pid).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic>map = value.data() as Map;
        placesController.text = map["USER_ID"].toString();
        nameController.text = map["NAME"].toString();
        phoneController.text = map["MOBILE_NUMBER"].toString();

        notifyListeners();
      }
    });
  }

  void clearfn5() {
    nameController.clear();
    phoneController.clear();
  }

  // TextEditingController ProfilenameController = TextEditingController();
  // TextEditingController ProfilephoneController = TextEditingController();
  //
  // File? fileImage2;
  // String imageUrl2 = "";
  // List<Editlist>listedit=[];

  // Future<void> addProfile() async {
  //   print("SAhal");
  //   DateTime top = DateTime.now();
  //   String Profid = top.millisecondsSinceEpoch.toString();
  //   HashMap<String, Object>map = HashMap();
  //   map["ProfileNAME"] = ProfilenameController.text.toString();
  //   map["ProfilePHONE"] = ProfilephoneController.text.toString();
  //   map["Date"] = top;
  //   map["profile_id"] = Profid;
  //   map["Added_By"] = "";
  //
  //   if (fileImage2 != null) {
  //     String photoId = DateTime
  //         .now()
  //         .millisecondsSinceEpoch
  //         .toString();
  //
  //     ref = FirebaseStorage.instance.ref().child(photoId);
  //     await ref.putFile(fileImage2!).whenComplete(() async {
  //       await ref.getDownloadURL().then((value) {
  //         map["PHOTO"] = value;
  //
  //         notifyListeners();
  //       });
  //       notifyListeners();
  //     });
  //     notifyListeners();
  //   }
  //   db.collection("ADMINPROFILE").doc(Profid).set(map);
  //   notifyListeners();
  //
  //   notifyListeners();
  // }
  //
  // void setImage2(File imagee) {
  //   fileImage2 = imagee;
  //
  //
  //   notifyListeners();
  // }
  //
  //
  // Future getImagegallery2() async {
  //   final imagePicker = ImagePicker();
  //   final pickedImage =
  //   await imagePicker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedImage != null) {
  //     // setImage(File(pickedImage.path));
  //     cropImage2(pickedImage.path);
  //     // print("hjkl"+pickedImage.path);
  //   } else {
  //     print('No image selected.');
  //   }
  // }
  //
  // Future getImagecamera2() async {
  //   final imagePicker = ImagePicker();
  //   final pickedImage2 =
  //   await imagePicker.pickImage(source: ImageSource.camera);
  //
  //   if (pickedImage2 != null) {
  //     // print("dfghjk"+pickedImage.path);
  //     cropImage2(pickedImage2.path);
  //     setImage2(File(pickedImage2.path));
  //   } else {
  //     print('No image selected.');
  //   }
  // }
  //
  // Future<void> cropImage2(String path) async {
  //   final croppedFile = await ImageCropper().cropImage(
  //     sourcePath: path,
  //     aspectRatioPresets: Platform.isAndroid
  //         ? [
  //       CropAspectRatioPreset.square,
  //       CropAspectRatioPreset.ratio3x2,
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.ratio4x3,
  //       CropAspectRatioPreset.ratio16x9,
  //     ]
  //         : [
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.square,
  //       CropAspectRatioPreset.ratio3x2,
  //       CropAspectRatioPreset.ratio4x3,
  //       CropAspectRatioPreset.ratio5x3,
  //       CropAspectRatioPreset.ratio5x4,
  //       CropAspectRatioPreset.ratio7x5,
  //       CropAspectRatioPreset.ratio16x9,
  //       CropAspectRatioPreset.ratio16x9
  //     ],
  //     uiSettings: [
  //       AndroidUiSettings(
  //           toolbarTitle: 'Cropper',
  //           toolbarColor: Colors.white,
  //           toolbarWidgetColor: Colors.black,
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           lockAspectRatio: false),
  //       IOSUiSettings(
  //         title: 'Cropper',
  //       )
  //     ],
  //   );
  //   if (croppedFile != null) {
  //     fileImage2 = File(croppedFile.path);
  //     notifyListeners();
  //   }
  //   notifyListeners();
  //
  //
  // }
  //
  // void clearfn2() {
  //   ProfilenameController .clear();
  //   ProfilephoneController.clear();
  //
  //   fileImage2 = null;
  //   imageUrl2 = "";
  // }
  //  String id ="";
  // String Nameprofile ="";
  // String Phoneprofile ="";
  // String photo2 ="";

  // void getData() {
  //   db.collection("ADMINPROFILE").get().then((value) {
  //         listedit.clear();
  //         if (value.docs.isNotEmpty) {
  //           for (var data in value.docs) {
  //             id = data.id;
  //             Nameprofile = data.get("ProfileNAME");
  //             Phoneprofile = data.get("ProfilePHONE");
  //             photo2 = data.get("PHOTO");
  //
  //
  //             // listedit.add(Editlist(id, name,phone));
  //             notifyListeners();
  //             print(listedit.length.toString());
  //             notifyListeners();
  //           }
  //           notifyListeners();
  //         }
  //         notifyListeners();
  //
  //
  //   });
  //
  // }


  TimeOfDay _time = TimeOfDay.now();
  DateTime _date = DateTime.now();
  DateTime scheduledTime = DateTime.now();
  DateTime scheduledDate = DateTime.now();
  String scheduledDayNode = "";
  var outputDateFormat = DateFormat('dd/MM/yyyy');
  var outputTimeFormat = DateFormat('hh:mm a');
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController kidController = TextEditingController();
  TextEditingController adultsController = TextEditingController();
  TextEditingController kidpriceController = TextEditingController();
  TextEditingController adultsspriceController = TextEditingController();
  TextEditingController totalController = TextEditingController();

  // Future<void> selectDateAndTime(BuildContext context) async {
  //
  //   await _selectDate(context);
  //   await _selectTime(context);
  // }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      _date = picked;
      scheduledDate = DateTime(_date.year, _date.month, _date.day);
      dateController.text = outputDateFormat.format(scheduledDate);
      notifyListeners();
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if (picked != null) {
      _time = picked;
      scheduledDayNode =
          _date.year.toString() + '/' + _date.month.toString() + '/' +
              _date.day.toString();
      scheduledTime = DateTime(
          _date.year, _date.month, _date.day, _time.hour, _time.minute);
      timeController.text = outputTimeFormat.format(scheduledTime);
      notifyListeners();
    }
  }
  List<BOOK_DETAIL> TypeDETAIL = [];
  void addDETAIL(BuildContext context, String place_name) {
    LoginProvider login_provider = Provider.of<LoginProvider>(context, listen: false);
    print("SAhala");
    DateTime top = DateTime.now();
    String detailid = top.millisecondsSinceEpoch.toString();
    HashMap<String, Object>map = HashMap();
    map["TYPE_NAME"]=place_name;
    map["DATE_DETAILS"] = dateController.text.toString();
    map["TIME_DETAILS"] = timeController.text.toString();
    map["ADULIDS_PRICE"]=adult_totalamnt.toString();
    map["KIDS_PRICE"]=child_totalamnt.toString();
    map["ADULIDS"]=adult_count.toString();
    map["KIDS"]=child_count.toString();
    map["TOTAL"]=total_amnt.toString();
    map["Date"] = top;
    map["DETAIL_Id"] = detailid;
    map["USER_Id"] = login_provider.userId;
    db.collection("BOOKING_DETAIL").doc(detailid).set(map);
  }



  void get_DETAIL() {
    db.collection("BOOKING_DETAIL").get().then((value1) {
      TypeDETAIL.clear();
      if (value1.docs.isNotEmpty) {
        List<String> mobile_List=[];
        String user = "";
        for (var value in value1.docs) {
          TypeDETAIL.add(BOOK_DETAIL(value.id,
            value.get("TYPE_NAME").toString(),
              value.get("DATE_DETAILS").toString(), value.get("TIME_DETAILS").toString(),
           value.get("ADULIDS_PRICE").toString(), value.get("KIDS_PRICE").toString(),
              value.get("ADULIDS").toString(), value.get("KIDS").toString(),
            value.get("TOTAL").toString(),value.get("Date").toString(),value.get("USER_Id").toString()
          ));
          user = value.get("USER_Id").toString();

              notifyListeners();
        }
      }
      notifyListeners();
    });

  }
  Map<dynamic, dynamic> pay_map = {};

  void getUserPay_detail(String userId) {
    db.collection("BOOKING_DETAIL").doc(userId).get().then((value) {
      if (value.exists) {
        pay_map=value.data() as Map;
        notifyListeners();
      }
    });
  }
  // String Id="";
  // String place ="";
  //  String Date ="";
  //  String Time="";
  //  String Adulids_price="";
  //  String Kids_price="";
  //  String Adulids="";
  //  String Kids="";
  //  String Total="";

//   void get_DETAIL() {
//   db.collection("BOOKING_DETAIL").get().then((value) {
//     TypeDETAIL.clear();
//         if (value.docs.isNotEmpty) {
//           for (var data in value.docs) {
//             Id = data.id;
//             place = data.get("TYPE_NAME");
//             Date = data.get("DATE_DETAILS");
//             Time = data.get("TIME_DETAILS");
//             Adulids_price = data.get("ADULIDS_PRICE");
//             Kids_price = data.get("KIDS_PRICE");
//             Adulids = data.get("ADULIDS");
//             Kids = data.get("KIDS");
//             Total = data.get("TOTAL");
//
//
//
//             // listedit.add(Editlist(id, name,phone));
//             notifyListeners();
//             print(TypeDETAIL.length.toString());
//             notifyListeners();
//           }
//           notifyListeners();
//         }
//         notifyListeners();
//
//
//   });
//
// }


  // void Inrement(int count, String id, double basic_price) {
  //
  //   for (var e in categorylist) {
  //     if (e.id == id) {
  //       if (count > 0) {
  //         e.price = basic_price * count;
  //       }
  //       find_total(id);
  //       notifyListeners();
  //     }
  //   }
  //   notifyListeners();
  // }
  // void find_total(String id)
  // {
  //   total_price1 = 0.0;
  //   print("total_price11111111111111111 = $total_price1");
  //   for (var e in categorylist) {
  //     print("total_price1 = $total_price1");
  //     total_price1 = total_price1 + e.price;
  //     //     total_price2 = total_price1;
  //     // total_price3 = total_price1;
  //     // total_price4 = total_price1;
  //     // total_price5 = total_price1;
  //     // total_price6 = total_price1;
  //     print("total= $total_price1");
  //
  //     notifyListeners();
  //
  //   }
  //   grand_total = grand_total + total_price1;
  // }
  //
  // void decrement(int count, String id,double price,double basic_price)
  // {
  //   double amount=0;
  //   for (var e in categorylist) {
  //     if (e.id == id  && e.count>0) {
  //       e.count--;
  //       e.price = basic_price * e.count;
  //       find_total(id);
  //       notifyListeners();
  //     }
  //   }
  //   notifyListeners();
  // }
  // bool getLaundryCategoryLoader = false;
  // double total_price1 = 0.0;
  // double total_price2 = 0.0;
  // double total_price3 = 0.0;
  // double total_price4 = 0.0;
  // double total_price5 = 0.0;
  // double total_price6 = 0.0;
  // double total_price_default = 0.0;
  // double grand_total = 0.0;
  // double delivery_charge = 30.0;
  // void getLaundryCategory(String id) {
  //   // categorylist.clear();
  //   getLaundryCategoryLoader = true;
  //   db.collection("LAUNDRY_CATEGORY").where("LAUNDRY_ID", isEqualTo: id)
  //       .get()
  //       .then((value1) {
  //     if (value1.docs.isNotEmpty) {
  //       total_price1 = 0.0;
  //       total_price_default = 0.0;
  //       categorylist.clear();
  //       default_laundrylist.clear();
  //       getLaundryCategoryLoader = false;
  //       for (var value in value1.docs) {
  //
  //         categorylist.add(
  //             LaundrycategoryList(value.get("CATEGORY_ID").toString(),
  //                 value.get('PHOTO').toString(),
  //                 value.get("CATEGORY_NAME").toString(),
  //                 double.parse(value.get("CATEGORY_PRICE").toString()),
  //                 0,
  //                 total_price1 = total_price1 + double.parse(value.get("CATEGORY_PRICE").toString())
  //
  //               // value.get("LAUNDRY_NAME").toString(),
  //             ));
  //         print("TOTAL PRICE =  $total_price1");
  //         // total_price = total_price + double.parse(categorylist..toString());
  //         default_laundrylist.add(LaundrycategoryList(value.get("CATEGORY_ID").toString(),
  //             value.get('PHOTO').toString(),
  //             value.get("CATEGORY_NAME").toString(),
  //             double.parse(value.get("CATEGORY_PRICE").toString()),
  //             0,
  //             total_price_default= total_price_default + double.parse(value.get("CATEGORY_PRICE").toString())
  //
  //           // value.get("LAUNDRY_NAME").toString(),
  //         ));
  //         notifyListeners();
  //       }
  //       notifyListeners();
  //     }
  //     notifyListeners();
  //   });
  // }
}
