import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "Sofa",
      "picture": "images/products/sofa3.jpg",
      "price": 235,
      "size": "L",
      "color": "blue",
      "Quantity": 1,
    },
    {
      "name": "Sofa cum Bed",
      "picture": "images/products/sofacumbed1.jpeg",
      "price": 414,
      "size": "L",
      "color": "red",
      "Quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_picture: Products_on_the_cart[index]["picture"],
            cart_prod_price: Products_on_the_cart[index]["price"],
            cart_prod_color: Products_on_the_cart[index]["color"],
            cart_prod_size: Products_on_the_cart[index]["size"],
            cart_prod_qty: Products_on_the_cart[index]["Quantity"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product(
      {this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_price,
      this.cart_prod_size,
      this.cart_prod_color,
      this.cart_prod_qty});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(
          cart_prod_picture,
          width: 100.0,
          height: 150.0,
        ),
        title: new Text(cart_prod_name),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    cart_prod_size,
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                  child: new Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_prod_color,
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$${cart_prod_price} ",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Column(
            children: <Widget>[
              new IconButton(icon: Icon(Icons.arrow_drop_up,size: 30.0,), onPressed: (){}),
              new Text("$cart_prod_qty", style: TextStyle(fontSize: 30.0),),
              new IconButton(icon: Icon(Icons.arrow_drop_down,size: 30.0,), onPressed: (){}),
            ],
          ),
        ),
      ),
    );
  }
}
