import 'package:flutter/material.dart';
import 'package:flutter_qualif/models/review.dart';

class Item {
  late String _name;
  late Image _image;
  late double _price;
  late String _description;
  late int _soldCount;
  late List<Review> _reviews;

  Item(String name, Image image, double price, String description,
      int soldCount, List<Review> reviews) {
    this._name = name;
    this._image = image;
    this._price = price;
    this._description = description;
    this._soldCount = soldCount;
    this._reviews = reviews;
  }

  String get getName {
    return _name;
  }

  Image get getImage {
    return _image;
  }

  double get getPrice {
    return _price;
  }

  String get getDescription {
    return _description;
  }

  int get getSoldCount {
    return _soldCount;
  }

  List<Review> get getReviews {
    return _reviews;
  }
}

var items = [
  new Item(
      "Echo Dot (4th generation)",
      Image(
        image: AssetImage('assets/item_1.jpg'),
      ),
      49.99,
      'Meet Echo Dot — Echo Dot (4th generation) connects to Alexa, a cloud-based voice service, to play music, set timers and alarms, control compatible smart home devices, and more.',
      13,
      [
        new Review('nicotanzil', DateTime.parse("2021-07-20 20:18:04Z"),
            'High quality stuff'),
        new Review('john_doe', DateTime.parse("2021-07-21 23:35:04Z"),
            'Friendly seller'),
        new Review('barack_obama123', DateTime.parse("2021-07-19 17:55:04Z"),
            'Totally worth it!'),
      ]),
  new Item(
      'Google Nest Thermostat',
      Image(image: AssetImage('assets/item_2.jpg')),
      129.99,
      'ENERGY STAR certified smart thermostat for home that helps you save energy and stay comfortable',
      54, []),
  new Item(
      'Amazon Smart Plug',
      Image(image: AssetImage('assets/item_3.jpg')),
      39.99,
      'Amazon Smart Plug works with Alexa to add voice control to any outlet.',
      30, []),
  new Item(
      'Echo Show 5',
      Image(image: AssetImage('assets/item_4.jpg')),
      19.99,
      'Easily tilt your Echo Show 5 forward or backward to improve viewing angle.',
      97, []),
  new Item(
      'Blink Mini',
      Image(image: AssetImage('assets/item_5.jpg')),
      44.99,
      'Get alerts on your smartphone whenever motion is detected or customize motion detection zones so you can see what matters most.',
      43, []),
];
