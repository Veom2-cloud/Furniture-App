import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          // Sofa ,bed ,sofa cum bed, dining table , Almirah
          Category(
            image_location: 'images/cats/sofaicon.png',
            image_caption: 'sofa',
          ),
          Category(
            image_location: 'images/cats/bedicon.jpg',
            image_caption: 'bed',
          ),
          Category(
            image_location: 'images/cats/diningtable.png',
            image_caption: 'diningtable',
          ),
          Category(
            image_location: 'images/cats/sofacumbed.png',
            image_caption: 'sofa cum bed',
          ),
          Category(
            image_location: 'images/cats/almirah.png',
            image_caption: 'Almirah',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({required this.image_location, required this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
          onTap: () {},
          child: Container(
            width: 100.0,
            child: ListTile(
                title: Image.asset(
                  image_location,
                  width: 100.0,
                  height: 80.0,
                ),
                subtitle: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    image_caption,
                    style: new TextStyle(fontSize: 12.0),
                  ),
                )),
          )),
    );
  }
}
