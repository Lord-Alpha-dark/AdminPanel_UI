import 'package:adminpanel/Screens/Brands/brand_provider.dart';
import 'package:adminpanel/Screens/Category/cat_provider.dart';
import 'package:adminpanel/Screens/Coupons/coupon_provider.dart';
import 'package:adminpanel/Screens/MainScreen/MainScreen.dart';
import 'package:adminpanel/Screens/MainScreen/main_screen_provider.dart';
import 'package:adminpanel/Screens/Products/product_provider.dart';
import 'package:adminpanel/Screens/SubCategory/sub_category_provider.dart';
import 'package:adminpanel/Screens/VariantType/variantType_provider.dart';
import 'package:adminpanel/Screens/variants/variant_provider.dart';
import 'package:adminpanel/core/data/data_provider.dart';
import 'package:adminpanel/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers:[
    ChangeNotifierProvider(create: (context) => Providers(),),
    ChangeNotifierProvider(create: (context) => MainScreenProvider(),),
    ChangeNotifierProvider(create: (context) => DataProvider(),),
    ChangeNotifierProvider(create: (context)=>CatProvider(),),
    ChangeNotifierProvider(create: (context)=>SubCategoryProvider()),
    ChangeNotifierProvider(create: (context)=>BrandProvider()),
    ChangeNotifierProvider(create: (context)=>ProductProvider()),
    ChangeNotifierProvider(create: (context)=>VariantTypeProvider()),
    ChangeNotifierProvider(create: (context)=>VariantProvider()),
    ChangeNotifierProvider(create: (context)=>CouponProvider()),
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
        GetPage(name: '/', page:()=> SplashScreen()),
        ],
         unknownRoute: GetPage(name: '/notFound', page:()=> SplashScreen()),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
  print("SplashScreen: _loadData() called"); // Debug print

  final catProvider = Provider.of<CatProvider>(context, listen: false);
  final subCatProvider = Provider.of<SubCategoryProvider>(context, listen: false);
  final brandProvider = Provider.of<BrandProvider>(context, listen: false);

  print("Fetching categories...");
  await catProvider.allCategories();

  print("Fetching subcategories...");
  await subCatProvider.AllSubCategories();
  
  print("fetching brands");
  await brandProvider.AllBrands();
  
  if (mounted) {
    print("Navigation to MainScreen");
    Get.offAll(()=>MainScreen());
  }
}


   @override
   Widget build(BuildContext context) {
     return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}