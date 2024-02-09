import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/providers.dart';
import '../userpage/Favourite.dart';
import '../userpage/Homepage.dart';
import '../userpage/PROFILE.dart';
import '../userpage/Register.dart';
import '../userpage/Trip_plans.dart';
class BottomNav extends StatelessWidget {
  String userid;
   BottomNav({Key? key,required this.userid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [ Home (), Tripplance (userid: userid), Favourite(), Profile()];
    TouristProvider provider = Provider.of<TouristProvider>(context, listen: true);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              // enableFeedback: false,
                onPressed: () {
                  provider.onItemTapped(0);
                },
                icon: provider.selectedIndex==0?Icon(Icons.home,color: Colors.blue,):Icon(Icons.home)),
            IconButton(
              // enableFeedback: false,
                onPressed: () {
                  provider.onItemTapped(1);
                },
                icon: provider.selectedIndex==1?Icon(Icons.event_note_rounded,color: Colors.blue,):Icon(Icons.event_note_rounded)),
            IconButton(
              // enableFeedback: false,
                onPressed: () {
                  provider.onItemTapped(2);
                },
                icon:provider.selectedIndex==2?Icon(Icons.favorite_border,color:Colors.red ,):Icon(Icons.favorite_border)),
            IconButton(
                onPressed: () {
                  print("1111111111111111111");
                  print(userid);
                  provider.getUser(userid);
                  provider.onItemTapped(3);
                },
                icon:provider.selectedIndex==3?Icon(Icons.person,color:Colors.blue ,):Icon(Icons.person)),
          ],
        ),
      ),
      body: pages[provider.selectedIndex],
    );
  }
}