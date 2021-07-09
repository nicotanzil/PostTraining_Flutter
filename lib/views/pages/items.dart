import 'package:flutter/material.dart';
import 'package:flutter_qualif/variable.dart';
import 'package:flutter_qualif/views/pages/item_detail.dart';
import '../../models/item.dart';

class ItemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ItemPageState();
  }
}

class ItemPageState extends State<ItemPage> {
  List<Container> tiles = [];

  // Tidak jadi pake ListTile karena ini lebih flexible
  void _init() {
    print('Initialize');
    items.forEach((e) {
      tiles.add(Container(
        child: GestureDetector(
          onTap: () {
            print('Clicked');
            Navigator.pushNamed(context, ItemDetailPage.routeName,
                arguments: e);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              children: [
                Align(
                  child: e.getImage,
                ),
                Divider(
                  height: 20.0,
                ),
                Align(
                  child: Text(
                    e.getName,
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                  alignment: FractionalOffset.topLeft,
                ),
                Divider(
                  color: primaryColorBlue,
                  height: 10.0,
                ),
                Align(
                  child: Text(
                    '\$ ' + e.getPrice.toString(),
                    style: TextStyle(
                        fontSize: 22.0,
                        color: primaryColorYellow,
                        fontWeight: FontWeight.bold),
                  ),
                  alignment: FractionalOffset.topLeft,
                ),
                Align(
                  child: Text(
                    e.getDescription,
                    textAlign: TextAlign.justify,
                  ),
                  alignment: FractionalOffset.topLeft,
                ),
                Divider(
                  height: 10.0,
                ),
                Align(
                  child: Text(
                    e.getSoldCount.toString() + ' items sold!',
                    style: TextStyle(color: primaryColorYellow),
                  ),
                  alignment: FractionalOffset.topLeft,
                ),
                Divider(
                  height: 30.0,
                  color: primaryColorDarkBlue,
                  thickness: 2.5,
                )
              ],
            ),
          ),
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    this._init();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Our Items'),
      ),
      body: ListView(
        children: tiles,
      ),
    );
  }
}
