import 'package:bai_tap_lon/AppBar/HomeAppBar.dart';
import 'package:bai_tap_lon/Widgets/ItemWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Model/Product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Future<List<Product>> _products;

  @override
  void initState() {
    super.initState();
    _products = fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    final String apiUrl = 'http://localhost:5001/api/cocktails';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF4C53A5),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Đăng nhập'),
              onTap: () {
                Navigator.pushNamed(context, "login");
              },
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Đăng ký'),
              onTap: () {
                Navigator.pushNamed(context, "register");
              },
            ),
            ListTile(
              leading: Icon(Icons.mail_outline),
              title: Text('Liên hệ'),
              onTap: () {
                Navigator.pushNamed(context, "contact");
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Product>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products found'));
          } else {
            return ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: Color(0xFFEDECF2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Thanh tìm kiếm
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Tìm kiếm...",
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.search,
                                size: 27,
                                color: Color(0xFF4C53A5),
                              ),
                              onPressed: () {},
                            ),
                            Icon(
                              Icons.camera_alt,
                              size: 27,
                              color: Color(0xFF4C53A5),
                            ),
                          ],
                        ),
                      ),
                      // Categories
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Text(
                          "Categories",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                      ),
                      // Categories Widget
                      // Items
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Text(
                          "Outstanding Cat",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                      ),
                      // Items Widget
                      ItemWidget(items: snapshot.data!),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {},
        height: 70,
        color: Color(0xFF4C53A5),
        items: [
          Icon(
            CupertinoIcons.back,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
