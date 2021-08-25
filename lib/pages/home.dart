import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:furnitureapp/components/horizontal_listview.dart';
import 'package:furnitureapp/components/products.dart';
import 'package:furnitureapp/pages/cart.dart';
import 'package:furnitureapp/pages/login.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:furnitureapp/pages/authbloc.dart';
import 'package:provider/provider.dart';
import 'home.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription<User> loginStateSubscription;

  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    loginStateSubscription = authBloc.currentUser.listen((fbUser) {
      if (fbUser == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final authBloc = Provider.of<AuthBloc>(context);
    Widget image_carousel = new Container(
      height: 300.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/products/bed2.jpeg'),
          AssetImage('images/products/sofaset.png'),
          AssetImage('images/products/bed3.jpeg'),
          AssetImage('images/products/bedback1.jpeg'),
          AssetImage('images/products/diningset.jpeg'),
          AssetImage('images/products/tvback.jpeg'),
        ],
        autoplay: false,
        // animationCurve: Curves.fastOutSlowIn,
        // animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 2.0,
      ),
    );

    return Scaffold(
        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.blueAccent,
          title: Text('FurnitureApp'),
          actions: <Widget>[
            new IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {}),
            new IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Cart()));
                })
          ],
        ),

        drawer: new Drawer(
    child: StreamBuilder<User>(
          stream: authBloc.currentUser,
    builder: (context, snapshot) {
      if (!snapshot.hasData) return CircularProgressIndicator();
      print(snapshot.data!.photoURL);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(snapshot.data!.displayName, style: TextStyle(fontSize: 35.0)),
          CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
                snapshot.data!.photoURL.replaceFirst('s96', 's400')),
    ),
    ]
      );
    }
    ),
  ), // body
Center(
  child:   Container(
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('Home Page'),
                    leading: Icon(Icons.home, color: Colors.blue),
                  ),
                ),
                InkWell(
                  onTap: () { Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );},
                  child: ListTile(
                    title: Text('My Account'),
                    leading: Icon(Icons.person, color: Colors.blue),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('My Orders'),
                    leading: Icon(Icons.shopping_basket, color: Colors.blue),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => new Cart()));
                  },
                  child: ListTile(
                    title: Text('Shopping cart'),
                    leading: Icon(Icons.shopping_cart, color: Colors.blue),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('Favourite'),
                    leading: Icon(Icons.favorite, color: Colors.blue),
                  ),
                ),

                Divider(),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('Settings'),
                    leading: Icon(Icons.settings),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text('About'),
                    leading: Icon(Icons.help),
                  ),
                ),
              ],
            ),
),
    body: new Column(
          children: <Widget>[
            image_carousel,
            // Padding Widgets
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text('Categories'),
            ),
            // Horizontal List view
            HorizontalList(),

            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text('Recent Products'),
            ),

            Flexible(child: Products()),
          ],
        ));
  }
}
