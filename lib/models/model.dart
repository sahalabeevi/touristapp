class TouristModel{
  String id;
  String photo;
  String type;

  TouristModel(this.id,this.photo,this.type);
}
class Touristplaces{
  String id;
  String photo;
  String type;
  String location;
  String description;
  String ADULTS_price;
  String KIDS_price;
  List<String> images;
  Touristplaces(this.id,this.photo,this.type,this.location,this.description,this.images,
      this.ADULTS_price,this.KIDS_price
      );
}
class Registermodel{
  String id;
  String name;
  String phone;
 // String photoREGISTER;
  Registermodel(this.id,this.name,this.phone,);
}
class Editlist{
  String id;
  String name1;
  String phone1;
  String photo1;
  Editlist(this.id,this.name1,this.phone1,this.photo1);
}
class EditlistUSER{
  String id;
  String name3;
  String phone3;
  String photo3;
  EditlistUSER(this.id,this.name3,this.phone3,this.photo3);
}
class BOOK_DETAIL{
  String id;
  String book_DATE;
  String book_TIME;
  String Adults_count;
  String child_count;
  String Adults_price;
  String child_price;
  String Total_price;
  String place;
  String booking_Time;
  String userId;
  BOOK_DETAIL(this.id,this.book_DATE,this.book_TIME,this.Adults_count,this.child_count,
      this.Adults_price,this.child_price,this.Total_price,this.place,this.userId,this.booking_Time);
}

