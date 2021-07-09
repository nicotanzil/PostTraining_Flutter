import 'package:flutter/material.dart';
import '../../models/item.dart';
import 'package:flutter_qualif/variable.dart';

class ItemDetailPage extends StatefulWidget {
  static const routeName = '/itemDetail';

  final Item item;

  const ItemDetailPage({required this.item});

  @override
  State<StatefulWidget> createState() {
    return ItemDetailPageState(item);
  }
}

class ItemDetailPageState extends State<ItemDetailPage> {
  late Item item;
  var _controlReview = TextEditingController();
  bool _review_val = true;

  List<Container> tiles = [];

  ItemDetailPageState(Item item) {
    this.item = item;
  }

  void _init() {
    item.getReviews.forEach((e) {
      tiles.add(Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          children: [
            Align(
              child: Text(
                '@' + e.getUsername,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              alignment: Alignment.topLeft,
            ),
            Divider(
              height: 20.0,
            ),
            Align(
              child: Text(
                e.getContent,
                style: TextStyle(fontSize: 16.0),
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 10.0,
            ),
            Align(
              child: Text(
                e.getCreatedAt.toString(),
                style: TextStyle(
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey),
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    _init();

    String _validateReview(String review) {
      if (review.isEmpty) {
        return "Review cannot be empty";
      }
      return "";
    }

    void _submitPressed(String review) {
      setState(() {
        if (_validateReview(review).isEmpty)
          _review_val = true;
        else
          _review_val = false;
      });
    }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(item.getName),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home_filled)),
                Tab(
                  icon: Icon(Icons.reviews),
                )
              ],
            ),
          ),
          body: TabBarView(children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        child: item.getImage,
                      ),
                      Divider(
                        height: 20.0,
                      ),
                      Align(
                        child: Text(
                          item.getName,
                          style: TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                        alignment: FractionalOffset.topLeft,
                      ),
                      Divider(
                        color: primaryColorBlue,
                        height: 10.0,
                      ),
                      Align(
                        child: Text(
                          '\$ ' + item.getPrice.toString(),
                          style: TextStyle(
                              fontSize: 22.0,
                              color: primaryColorYellow,
                              fontWeight: FontWeight.bold),
                        ),
                        alignment: FractionalOffset.topLeft,
                      ),
                      Align(
                        child: Text(
                          item.getDescription,
                          textAlign: TextAlign.justify,
                        ),
                        alignment: FractionalOffset.topLeft,
                      ),
                      Divider(
                        height: 10.0,
                      ),
                      Align(
                        child: Text(
                          item.getSoldCount.toString() + ' items sold!',
                          style: TextStyle(color: primaryColorYellow),
                        ),
                        alignment: FractionalOffset.topLeft,
                      ),
                      Divider(
                        height: 15.0,
                      ),
                      Align(
                        child: Text(
                            'Input Reviews (${this.item.getReviews.length})',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24.0)),
                        alignment: FractionalOffset.topLeft,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Leave your opinion here',
                          errorText: _review_val
                              ? null
                              : _validateReview(_controlReview.text),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: primaryColorYellow, width: 1.0),
                          ),
                        ),
                        controller: _controlReview,
                        style: TextStyle(color: primaryColorDarkBlue),
                        maxLines: 2,
                      ),
                      ElevatedButton(
                        onPressed: () => _submitPressed(_controlReview.text),
                        child: Text('Submit'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return primaryColorDarkBlue;
                              return primaryColorBlue; // Use the component's default.
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Column(
              children: [
                Container(
                  child: Text('Reviews (${this.item.getReviews.length})',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      )),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.fromLTRB(17.0, 10.0, 0, 15.0),
                ),
                Expanded(
                    child: ListView(
                  children: tiles,
                )),
              ],
            )
          ]),
        ));
  }
}
