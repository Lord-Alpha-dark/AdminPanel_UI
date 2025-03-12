import 'package:adminpanel/Models/Brands.dart';
import 'package:adminpanel/Models/Product.dart';
import 'package:adminpanel/Models/category.dart';
import 'package:adminpanel/Models/sub_category.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  String? imagePath1;
  String? imagePath2;
  String? imagePath3;
  String? imagePath4;
   final productFormKey=GlobalKey<FormState>();
 TextEditingController name_controller=TextEditingController();
 TextEditingController description_controller=TextEditingController();
 TextEditingController price_controller=TextEditingController();
 TextEditingController quantity_controller=TextEditingController();

 List<String> _selectedVariants=[];
 List<String> get selectedVariants=>_selectedVariants;
 List<Product> localproducts=[];

 void addVariant(String val)
 {
  if(!_selectedVariants.contains(val))
  {
    _selectedVariants.add(val);
  }
 }

 void removeVariant(String val)
 {
  if(_selectedVariants.contains(val))
  {
    _selectedVariants.remove(val);
  }
 }

 String AllSelectedVariant()
 {
  return _selectedVariants.join(',');
 }
  
  category? selectedcategory;
  SubCategory? selectedsubCategory;
  Brand? selectedbrand;
Future<void> getImg() async{
    FilePickerResult? result=await FilePicker.platform.pickFiles(type: FileType.image);
    if(result!=null){
      imagePath1=result.files.single.path;
     
  }
   notifyListeners();
} 

Future<void> getImg2() async{
    FilePickerResult? result=await FilePicker.platform.pickFiles(type: FileType.image);
    if(result!=null){
      imagePath2=result.files.single.path;
     
  }
   notifyListeners();
} 

Future<void> getImg3() async{
    FilePickerResult? result=await FilePicker.platform.pickFiles(type: FileType.image);
    if(result!=null){
      imagePath3=result.files.single.path;
     
  }
   notifyListeners();
} 

Future<void> getImg4() async{
    FilePickerResult? result=await FilePicker.platform.pickFiles(type: FileType.image);
    if(result!=null){
      imagePath4=result.files.single.path;
     
  }
   notifyListeners();
} 

void clearImagePath(){
    imagePath1=null;
    imagePath2=null;
    imagePath3=null;
    imagePath4=null;
    notifyListeners();
  }
}