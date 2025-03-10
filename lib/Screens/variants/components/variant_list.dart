import 'package:adminpanel/Models/Brands.dart';
import 'package:adminpanel/Models/variants.dart';
import 'package:adminpanel/core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VariantList extends StatelessWidget{

  const VariantList({Key? key}): super(key: key);
  
  @override
  Widget build(BuildContext context)
  
  {
    return Padding(
      padding: const EdgeInsets.only(left:40, top: 10 ),
      child: Container(
        width: 1120,
        decoration: BoxDecoration(
          color: Colors.white,
         borderRadius: BorderRadius.circular(10),
          border: Border.all(
      color: Colors.black54, 
      width: 2.0,        
    ),
        ),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding:  EdgeInsets.only(left: 10,top: 10),
              child: Text("All Variants",style: TextStyle(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<DataProvider>(
              builder: (context, dataprovider, child) {
                return DataTable(
              columnSpacing: 167,
              columns: const [
                 DataColumn(
                label: Text("Variant Name",style: TextStyle(fontSize: 16),),
                ),
                 DataColumn(
                label: Text("Variant Type",style: TextStyle(fontSize: 16),),
                ),
                DataColumn(
                label: Text("Added Date",style: TextStyle(fontSize: 16),),
                ),
                 DataColumn(
                label: Text("Edit",style: TextStyle(fontSize: 16),),
                ),
                 DataColumn(
                label: Text("Delete",style: TextStyle(fontSize: 16),),
                ),
    
              ],
              rows: List.generate(dataprovider.variants.length, (index) => customDataRow(dataprovider.variants[index],index+1,(){
              
               
              },()
              {
            
              }))
               ) ;
              },
            ),
          ],
        ) 
      ),
    );
  }
}

DataRow customDataRow(Variant variantInfo, int index,Function edit,Function delete)
{
  return DataRow(
    cells: [
      DataCell(
        Text(variantInfo.name ?? ' ')
       ),
        DataCell(
        Text(variantInfo.variantTypeId?.name ?? ' ')
       ),
       DataCell(
        Text(variantInfo.createdAt ?? '')),
      DataCell(IconButton(
          onPressed: () {
            edit();
          },
          icon:const Icon(
            Icons.edit,
            color: Colors.black54,
          ))),
      DataCell(IconButton(
          onPressed: () {
            delete();
          },
          icon:const Icon(
            Icons.delete,
            color: Color.fromARGB(255, 230, 105, 3),
          ))),
    ]);
}


