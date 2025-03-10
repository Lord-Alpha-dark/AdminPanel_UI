import 'package:adminpanel/Models/VariantType.dart';
import 'package:flutter/material.dart';

class VariantProvider extends ChangeNotifier{
 
   final TextEditingController controller = TextEditingController();

   VariantType? selectedVariantType;

   notifyListeners();
}