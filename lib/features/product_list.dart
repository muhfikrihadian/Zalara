import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zalara/models/cart.dart';

class ProductList extends StatelessWidget{
  final List<Cart> carts;
  ProductList(this.carts);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: carts.isEmpty ? Column(children: <Widget>[
        Text(
          "No transaction",
          style: Theme.of(context).textTheme.title,
        )
      ],)
      :
          ListView.builder(
              itemBuilder: (context, index){
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal:15),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                        ),
                        child: Text(
                          carts[index].qty.toString(),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 20,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(carts[index].title, style: Theme.of(context).textTheme.title,),
                          Text('Harga : Rp. ' + carts[index].harga.toStringAsFixed(0), style: TextStyle(fontSize: 12, color: Colors.grey),)
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(80, 5, 5, 5),
                        child: Image.network("https://images.all-free-download.com/images/graphicthumb/sneakers_vector_38306.jpg", height: 60.0, fit: BoxFit.cover)
                      ),
                    ],
                  ),
                );
              },
            itemCount: carts.length,
          ),
    );
  }
}