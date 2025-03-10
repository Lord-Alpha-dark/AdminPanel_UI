

import 'package:adminpanel/Models/sub_category.dart';
import 'package:adminpanel/Screens/Brands/brand_provider.dart';
import 'package:adminpanel/core/data/data_provider.dart';
import 'package:adminpanel/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BrandAdd extends StatelessWidget{

  const BrandAdd({super.key});
  
  @override
  Widget build(BuildContext context)
  {
    final provider = Provider.of<BrandProvider>(context, listen: false);
     final dataprovider = Provider.of<DataProvider>(context, listen: false);
    final TextEditingController controller1 = TextEditingController();

      var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
         width: size.width*0.3,
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1)
          ),
          child: Column(
            children: [
               const SizedBox(
                  height: 50,
               ),
                 Row(
                        children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                height: 32,
                                width: 200,
                               
                                child: TextFormField(
                                
                                controller: controller1,
                                maxLines: 1,
                                 decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                labelText: "Name",
                                labelStyle: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500),
                                                           border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(9.0),
                                 borderSide: const BorderSide(color: Colors.black54),
                                 ),
                                  focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: const BorderSide(color: Colors.black54, width: 2),
                                  ), // Orange border when focused
                                 enabledBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4.0),
                                    borderSide: const BorderSide(color: Colors.black54, width: 2),
                                  ), // Orange border when not focused
                                ),
                                keyboardType: TextInputType.text,
                                
                                                          ),
                              ),
                            ),
              
                 Padding(
                   padding: const EdgeInsets.only(left: 15),
                   child: Container(
                    height: 40,
                    width: 200,
                     child: 
                     CustomDropdown<SubCategory>(
                      initialvalue:  provider.selectedsubcategory, hintText: "Sub-Category", list: dataprovider.subCategories, onchanged: (newValue){
                        if(newValue!=null)
                        {
                          provider.selectedsubcategory=newValue ;
                        }
                      },  validator: (value) {
                            if (value == null) {
                              return 'Please select a Sub-Category';
                            }
                            return null;
                          },
                          displayItem: (SubCategory? subCategory)=>subCategory?.name ?? ' ',
                          )
                   ),
                 ),
                
                        ],
                      ),
                    const SizedBox(
                  height: 49,
                ),
                Row(
                  children: [

                   Padding(
                     padding: const EdgeInsets.only(left: 124,bottom: 20),
                     child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                                       backgroundColor: Colors.white, // Background color of the button
                                      shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20), // Border radius
                       side: BorderSide(
                                       color: Colors.black54, // Border color
                     width: 2, // Border thickness
                      )
                        ),
                         ),
                      onPressed:(){
                        Navigator.of(context).pop();
                      } ,
                        child: Text("cancel",style: TextStyle(fontSize: 17,color: Colors.black54),) 
                       ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10,bottom: 20),
                     child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                                       backgroundColor: Colors.white, // Background color of the button
                                      shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20), // Border radius
                       side: BorderSide(
                                       color: Colors.black54, // Border color
                     width: 2, // Border thickness
                      )
                        ),
                         ),
                      onPressed:(){
                        
                      } ,
                        child: Text("Submit",style: TextStyle(fontSize: 17,color: Colors.black54))
                       ),
                   )
                  ],
                )   
                
            ],
          ),
         ),
    );
  }
}

void showBrandAddform(BuildContext context){
  
  showDialog(
    barrierDismissible: false,
    context: context,
     builder: (BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Center(child: Text('Add Brand'.toUpperCase(), style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600))),
        content:  const BrandAdd(),
    );
  });
}