import 'package:adminpanel/Screens/Category/category_screen.dart';
import 'package:adminpanel/Screens/DashBoard/dashBoard.dart';
import 'package:flutter/material.dart';

class mainScreenProvider extends ChangeNotifier{
   List<int> views = [20, 25, 15, 30, 20, 18, 22]; // Replace with actual data
   List<String> dates=['21','22','23','24','25','26','27'];

   Widget selectedScreen=DashBoard();
   int selectedIndex=0;

  void updateindex(int index)
  {
      selectedIndex=index;
      notifyListeners();
  }

  navigatetoScreen(String ScreenName){
    switch (ScreenName) {
      case "DashBoard":
        selectedScreen=DashBoard();
        break;
      case "Categories":
        selectedScreen=categoryScreen();
        break;
      default:
      selectedScreen=DashBoard();
    }
    notifyListeners();
  }
}