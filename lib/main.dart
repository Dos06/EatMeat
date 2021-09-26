import 'package:eat_meat/models/appbar_btn.dart';
import 'package:eat_meat/pages/dashboard.dart';
import 'package:eat_meat/pages/home.dart';
import 'package:eat_meat/pages/menu.dart';
import 'package:eat_meat/pages/qr_scan.dart';
import 'package:eat_meat/pages/search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "EatMeat",
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const Start(),
    );
  }
}

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Home();

  final List<List<AppbarBtn>> buttons = [
    [
      AppbarBtn(index: 0, icon: Icons.home, name: 'Home', widget: const Home()),
      AppbarBtn(
          index: 1,
          icon: Icons.dashboard,
          name: 'Dashboard',
          widget: const Dashboard()),
    ],
    [
      AppbarBtn(
          index: 2, icon: Icons.search, name: 'Search', widget: const Search()),
      AppbarBtn(
          index: 3,
          icon: Icons.restaurant_menu,
          name: 'Menu',
          widget: const Menu()),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.qr_code_scanner),
        onPressed: () {
          setState(() {
            currentScreen = const QrScan();
            currentTab = 4;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: buttons
                .map((list) => Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: list
                          .map((btn) => MaterialButton(
                                minWidth: 50,
                                onPressed: () {
                                  setState(() {
                                    currentScreen = btn.widget;
                                    currentTab = btn.index;
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      btn.icon,
                                      color: currentTab == btn.index
                                          ? Theme.of(context).accentColor
                                          : Colors.grey,
                                    ),
                                    Text(
                                      btn.name,
                                      style: TextStyle(
                                          color: currentTab == btn.index
                                              ? Theme.of(context).accentColor
                                              : Colors.grey),
                                    )
                                  ],
                                ),
                              ))
                          .toList(),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
