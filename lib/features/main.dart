import 'package:flutter/material.dart';
import 'package:zalara/features/add_item.dart';
import 'package:zalara/features/product_list.dart';
import 'package:zalara/models/cart.dart';

import 'dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Zalara",
      theme: ThemeData(primaryColor:Colors.black, accentColor: Colors.black, textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    final List<Cart> _carts = [
      Cart(id: 'DW1', title: 'Air Jordan 1', harga: 1699000, qty: 1),
      Cart(id: 'DW2', title: 'Air Force 1', harga: 1499000, qty: 1),
      Cart(id: 'DW3', title: 'Air Zoom', harga: 2999000, qty: 1),
    ];

    void _addNewItem(String title, double harga, int qty){
      final newItem = Cart(id: DateTime.now().toString(), title: title, harga: harga, qty: qty);
      setState(() {
        _carts.add(newItem);
      });
    }

    void _OpenModal(BuildContext context){
      showModalBottomSheet(context: context, builder: (_){
        return AddNewItem(_addNewItem);
      });
    }

    void resetCharts(){
      setState(() {
        _carts.clear();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Zalara"),
        actions: <Widget>[
          FlatButton(child: Icon(Icons.delete, color: Colors.white,), onPressed: () => resetCharts(),)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Dashboard(_carts),
            ProductList(_carts),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _OpenModal(context),
      ),
    );
  }
}
