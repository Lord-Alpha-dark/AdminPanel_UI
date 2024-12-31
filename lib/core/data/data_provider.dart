import 'package:adminpanel/Models/Order.dart';
import 'package:flutter/material.dart';

class dataProvider extends ChangeNotifier{
  List<Order> _allOrders=[];
  List<Order> _filteredOrders=[];
  List<Order> get orders => _filteredOrders;
  
}