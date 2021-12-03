import 'package:eat_meat/models/menu_item.dart';
import 'package:eat_meat/models/restaurant.dart';
import 'package:eat_meat/pages/restaurant_details_screen.dart';
import 'package:eat_meat/util/db_handler.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:sqflite/sqflite.dart';

class Home extends StatefulWidget {
  static const String routeName = '/';

  const Home({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const Home(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Restaurants",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Expanded(child: Center()),
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () => {},
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DropdownButton(
                  value: _value,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  underline: Container(
                    color: Colors.white,
                  ),
                  items: const [
                    DropdownMenuItem(
                      child: Text("All"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Open"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Closed"),
                      value: 3,
                    ),
                  ],
                  onChanged: (int? value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                  hint: const Text("Select"),
                ),
                IconButton(
                    onPressed: () async {
                      await DbHandler.instance.dropTable();

                      Database db = await DbHandler.instance.database;
                      await db.execute(
                          "create table if not exists restaurants(id INTEGER PRIMARY KEY, name TEXT, imageUrl TEXT, rating DOUBLE, distance DOUBLE);");

                      for (int i = 0; i < Restaurant.restaurants.length; i++) {
                        Restaurant r = Restaurant.restaurants[i];
                        await DbHandler.instance.add(Restaurant(
                          id: r.id,
                          name: r.name,
                          imageUrl: r.imageUrl,
                          rating: r.rating,
                          distance: r.distance,
                        ));
                      }
                    },
                    icon: const Icon(Icons.sort))
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Restaurant>>(
                future: DbHandler.instance.getRestaurants(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Restaurant>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: Text('Loading...'));
                  }
                  return snapshot.data!.isEmpty
                      ? const Center(child: Text('No restaurants in list'))
                      : ListView(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          children: snapshot.data!.map(
                            (restaurant) {
                              restaurant.tags = const [
                                'Pizza',
                                'Sushi',
                                'Burger',
                                'Pasta',
                              ];
                              restaurant.menuItems = MenuItem.menuItems
                                  .where((element) => element.restaurantId == 1)
                                  .toList();
                              return FocusedMenuHolder(
                                child: RestaurantCard(
                                  restaurant: restaurant,
                                ),
                                blurSize: 5.0,
                                menuItemExtent: 45,
                                menuWidth:
                                    MediaQuery.of(context).size.width * 0.5,
                                menuBoxDecoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                ),
                                duration: const Duration(milliseconds: 100),
                                animateMenuItems: true,
                                blurBackgroundColor: Colors.black54,
                                menuOffset: 0,
                                bottomOffsetHeight: 80.0,
                                menuItems: [
                                  FocusedMenuItem(
                                    title: const Text("Add to favourites"),
                                    trailingIcon: const Icon(
                                        Icons.control_point_outlined),
                                    onPressed: () => {},
                                  ),
                                  FocusedMenuItem(
                                    title: const Text("Share"),
                                    trailingIcon: const Icon(Icons.share),
                                    onPressed: () => {},
                                  ),
                                  FocusedMenuItem(
                                    title: const Text("Review"),
                                    trailingIcon: const Icon(Icons.comment),
                                    onPressed: () => {},
                                  ),
                                ],
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RestaurantDetailsScreen(
                                        restaurant: restaurant,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ).toList());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.map_outlined),
        onPressed: () {},
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Almaty',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
