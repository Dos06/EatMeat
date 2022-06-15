import 'package:eat_meat/config/router.dart';
import 'package:eat_meat/config/theme.dart';
import 'package:eat_meat/models/appbar_btn.dart';
import 'package:eat_meat/pages/basket_screen.dart';
import 'package:eat_meat/pages/cart.dart';
import 'package:eat_meat/pages/home.dart';
import 'package:eat_meat/pages/profile.dart';
import 'package:eat_meat/pages/qr_scan.dart';
import 'package:eat_meat/pages/search.dart';
import 'package:eat_meat/pages/webview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

Future main() async {
  await Settings.init(cacheProvider: SharePreferenceCache());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: "EatMeat",
      theme: theme(),
      // onGenerateRoute: AppRouter.onGenerateRoute,
      // initialRoute: Home.routeName,
      // home: const Start(),
      home: const WebViewPage(),
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
          icon: Icons.shopping_basket,
          name: 'Cart',
          widget: BasketScreen()),
    ],
    [
      AppbarBtn(
          index: 2, icon: Icons.search, name: 'Search', widget: const Search()),
      AppbarBtn(
          index: 3,
          icon: Icons.person,
          name: 'Profile',
          widget: const Profile()),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.qr_code_scanner),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QrScan(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.max,
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
                                          ? Theme.of(context).primaryColorDark
                                          : Colors.grey[700],
                                    ),
                                    Text(
                                      btn.name,
                                      style: TextStyle(
                                          color: currentTab == btn.index
                                              ? Theme.of(context)
                                                  .primaryColorDark
                                              : Colors.grey[700]),
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
