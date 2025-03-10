import 'package:adminpanel/Models/Brands.dart';
import 'package:adminpanel/Models/Product.dart';
import 'package:adminpanel/core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget{

  const ProductList({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context)
  
  {
    return Padding(
      padding: const EdgeInsets.only(left:10, top: 10 ),
      child: Container(
        width: 1215,
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
              child: Text("All Products",style: TextStyle(color: Colors.black54,fontSize: 20,fontWeight: FontWeight.w600),),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<DataProvider>(
              builder: (context, dataprovider, child) {
                return DataTable(
              columnSpacing: 110,
              columns: const [
                 DataColumn(
                label: Text("Product Name",style: TextStyle(fontSize: 16),),
                ),
                
                DataColumn(
                label: Text("Sub-Category",style: TextStyle(fontSize: 16),),
                ),
                 DataColumn(
                label: Text("Category",style: TextStyle(fontSize: 16),),
                ),
                 DataColumn(
                label: Text("Price",style: TextStyle(fontSize: 16),),
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
              rows: List.generate(dataprovider.products.length, (index) => customDataRow(dataprovider.products[index],index+1,(){
              
               
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

DataRow customDataRow(Product productInfo, int index,Function edit,Function delete)
{
  return DataRow(
    cells: [
      DataCell(
        Text(productInfo.name ?? ' ')
       ),
       DataCell(
        Text(productInfo.proBrandId?.name ?? ' ')
       ),
        DataCell(
        Text(productInfo.proSubCategoryId?.name ?? ' ')
       ),
        DataCell(
        Text(productInfo.proCategoryId?.name ?? ' ')
       ),
        DataCell(
        Text(productInfo.price.toString() ?? ' ')
       ),
       DataCell(
        Text(productInfo.createdAt ?? '')),
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


