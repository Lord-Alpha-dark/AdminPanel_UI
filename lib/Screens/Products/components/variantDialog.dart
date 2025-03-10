import 'package:adminpanel/Screens/Products/product_provider.dart';
import 'package:adminpanel/core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showVariantDialog(BuildContext context) {
  final provider=Provider.of<DataProvider>(context,listen:false);
  final provider2=Provider.of<ProductProvider>(context,listen:false);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select Variants'),
        content: SingleChildScrollView(
          child: Column( 
            children:provider.variants.map((element) {
              return CheckboxListTile(
               title: Text(element.name ?? ''),
               checkColor: Colors.white,
               activeColor: Colors.black54,
               value: provider2.selectedVariants.contains(element.name),
               onChanged: (bool? value) 
               {
                if(value==true)
                {
                  provider2.addVariant(element.name!);
                }
                else
                {
                  provider2.removeVariant(element.name!);
                }
               }
              );
             },
             ).toList(),
          
        )
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
      );
    },
  );
}