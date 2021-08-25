import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furnitureapp/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Sofa",
      "picture": "images/products/sofa3.jpg",
      "old_price": 263,
      "price": 235
    },
    {
      "name": "Double Bed",
      "picture": "images/products/bed2.jpeg",
      "old_price": 345,
      "price": 317
    },
    {
      "name": "Led Panel",
      "picture": "images/products/ledpanel.jpeg",
      "old_price": 552,
      "price": 512
    },
    {
      "name": "Almirah",
      "picture": "images/products/almirah2.jpg",
      "old_price": 165,
      "price": 124
    },
    {
      "name": "Sofa cum Bed",
      "picture": "images/products/sofacumbed1.jpeg",
      "old_price": 483,
      "price": 414
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
          child: Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  // passing the value of product to the product detail page
                  builder: (context) => new ProductDetails(
                        product_detail_name: prod_name,
                        product_detail_new_price: prod_price,
                        product_detail_old_price: prod_old_price,
                        product_detail_picture: prod_picture,
                      ))),
              child: GridTile(
                  footer: Container(
                      color: Colors.white,
                      child: new Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15.0),),
                          ),
                         new Text("\$${prod_price}" , style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold),),
                        ],
                      )
                  ),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
