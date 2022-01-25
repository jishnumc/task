import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/profile.dart';
import 'package:task/screenthree.dart';
import 'package:task/screentwo.dart';
import 'package:task/shopping.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>HomeState();
}

class HomeState extends State<MyHomePage> {
  int _pageIndex = 0;
  late PageController _pageController;

  List<Widget> tabPages = [
    Profile(),
    ScreenTwo(),
    Shopping(),
    ScreenThree(),
  ];

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final double circleRadius = 120.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed ,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem( icon: Icon(Icons.person), title: Text("Profile")),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,), title: Text("Cart")),
          BottomNavigationBarItem(icon: Icon(Icons.branding_watermark), title: Text("Brand")),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
        ],

      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }
  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }

  }


