import 'package:flutter/material.dart';
import 'package:flutter_qualif/variable.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  Function changeTheme;
  HomePage(this.changeTheme);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var _carousel_images = [
    'assets/product_1.jpg',
    'assets/product_2.jpg',
    'assets/product_3.jpg',
    'assets/product_4.jpg',
    'assets/product_5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Text(
            loggedInUsername,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
        leadingWidth: 100,
        centerTitle: true,
        title: Text('Home'),
        actions: [
          PopupMenuButton(
              itemBuilder: (context2) => [
                    PopupMenuItem(
                      child: TextButton(
                        child: Text('Toggle Theme'),
                        onPressed: () {
                          print('Change Theme');
                          this.widget.changeTheme();
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: TextButton(
                        child: Text('Logout'),
                        onPressed: () {
                          // Navigate back to Login Page
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => LoginPage()));
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                      ),
                    ),
                  ].toList())
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: 'What are you looking for?',
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              width: 400,
              child: CarouselSlider(
                items: [
                  Image(image: AssetImage(_carousel_images[0])),
                  Image(image: AssetImage(_carousel_images[1])),
                  Image(image: AssetImage(_carousel_images[2])),
                  Image(image: AssetImage(_carousel_images[3])),
                  Image(image: AssetImage(_carousel_images[4])),
                ],
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    scrollDirection: Axis.horizontal,
                    autoPlayInterval: Duration(seconds: 3)),
              ),
            ),
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('Welcome $loggedInUsername,',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0)),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Upgrade to Premium'),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  return primaryColorYellow; // Use the component's default.
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black),
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 5.0, 0),
                                    child: Icon(Icons.check_box,
                                        color: primaryColorYellow),
                                  ),
                                ),
                                TextSpan(
                                    text: 'Better price offers',
                                    style: TextStyle(
                                        color: primaryColorYellow,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black),
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 5.0, 0),
                                    child: Icon(Icons.check_box,
                                        color: primaryColorYellow),
                                  ),
                                ),
                                TextSpan(
                                    text: 'Additional discounts',
                                    style: TextStyle(
                                        color: primaryColorYellow,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black),
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 5.0, 0),
                                    child: Icon(Icons.check_box,
                                        color: primaryColorYellow),
                                  ),
                                ),
                                TextSpan(
                                    text: 'Priority service',
                                    style: TextStyle(
                                        color: primaryColorYellow,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  alignment: Alignment.topLeft,
                  margin:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                        // BoxShadow(
                        //   color: Colors.green.shade400,
                        //   offset: Offset(-0.5, -0.5),
                        //   blurRadius: 0.0,
                        //   spreadRadius: 0.0,
                        // )
                      ]),
                  padding: EdgeInsets.all(15.0),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/icon_1.png'),
                        height: 90.0,
                        width: 90.0,
                      ),
                      Text(
                        'Check order status and track, \nchange or return items',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/icon_2.png'),
                        height: 90.0,
                        width: 90.0,
                      ),
                      Text(
                        'Shop past purchases and \neveryday essentials',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/icon_3.png'),
                        height: 90.0,
                        width: 90.0,
                      ),
                      Text(
                        'Create lists with items you \nwant, now, or later',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
