import 'package:adminpanel/Screens/MainScreen/MainScreen.dart';
import 'package:adminpanel/Screens/MainScreen/main_screen_provider.dart';
import 'package:adminpanel/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers:[
    ChangeNotifierProvider(create: (context) => Providers(),),
    ChangeNotifierProvider(create: (context) => mainScreenProvider(),)
  ],
  child:const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
       title: 'Flutter Admin Panel',
       initialRoute: '/',
       getPages: [
        GetPage(name: '/', page:()=> MainScreen()),
        ],
         unknownRoute: GetPage(name: '/notFound', page:()=> MainScreen()),
    );
    
    
  }
}
