

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zalara/models/cart.dart';

class Dashboard extends StatelessWidget{
  final List<Cart> _listCart;
  Dashboard(this._listCart);

  int get totalItem{
    return _listCart.fold(0, (sum, item){
      return sum += item.qty;
    });
  }
  double get totalPrice{
    return _listCart.fold(0, (sum, item){
      return sum += item.harga;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(children: <Widget>[
            Text("Total item", style: Theme.of(context).textTheme.title,),
            SizedBox(height: 4,),
            Text(totalItem.toString() + " Pcs", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ],),
          Column(children: <Widget>[
            Text("Total belanja", style: Theme.of(context).textTheme.title,),
            SizedBox(height: 4,),
            Text(totalPrice.toStringAsFixed(0), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ],),
        ],
      ),
    );
  }
}