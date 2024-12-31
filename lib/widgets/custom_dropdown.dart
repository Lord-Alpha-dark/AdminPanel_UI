import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
 final String initialtext;
 final String? hintText;
 final List<String> list;
 final void Function(String?)? onchanged;
 final String? Function(String?) validator;

  const CustomDropdown({Key? key,
  required this.initialtext,
  required this.hintText,
  required this.list,
  required this.onchanged,
  required this.validator}): super(key : key);

 @override
 Widget build(BuildContext context){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: DropdownButtonFormField<String>(
      
      decoration: InputDecoration(
        labelText: hintText,
         fillColor: Colors.white, // Background color
       filled: true, // Ensures the background color is applied
        labelStyle: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
         
     focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 230, 105, 3), width: 2.5), // Border color when focused
    ),
      ),
      value: initialtext,
      items: list.map((String value){
       return DropdownMenuItem<String>(
        value: value,
        child: Text(value,style: TextStyle(fontSize: 14,color: Colors.black54,fontWeight: FontWeight.w700),));
      }).toList(),
       onChanged: onchanged,
       validator: validator,
       
  
       ),
  );
 }

}