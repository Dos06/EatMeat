import 'package:eat_meat/models/menu_item.dart';
import 'package:eat_meat/models/restaurant.dart';
import 'package:eat_meat/pages/restaurant_details_screen.dart';
import 'package:eat_meat/util/db_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final textController = TextEditingController();
  var allRestaurants = [];
  var items = [];

  @override
  void initState() {
    super.initState();

    DbHandler.instance.getRestaurants().then((value) => {
          setState(() => {allRestaurants = value, items = allRestaurants})
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                placeholder: 'Search for some food...',
                autofocus: true,
                controller: textController,
                padding: const EdgeInsets.symmetric(vertical: 15),
                prefixInsets: const EdgeInsets.all(15),
                suffixInsets: const EdgeInsets.all(15),
                onChanged: (value) {
                  setState(() {
                    filterSearch(value);
                  });
                },
              ),
              Expanded(
                  child: ListView(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: items.map(
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
                            menuWidth: MediaQuery.of(context).size.width * 0.5,
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
                                trailingIcon:
                                    const Icon(Icons.control_point_outlined),
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
                                  builder: (context) => RestaurantDetailsScreen(
                                    restaurant: restaurant,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ).toList())),
            ],
          ),
        ),
      ),
    );
  }

  filterSearch(String value) {
    var dummySearchList = allRestaurants;
    if (value.isNotEmpty) {
      dummySearchList = [];
      for (var element in allRestaurants) {
        Restaurant restaurant = element;
        if (restaurant.name.toLowerCase().contains(value.toLowerCase())) {
          dummySearchList.add(element);
        }
      }

      setState(() {
        items = [];
        items.addAll(dummySearchList);
      });

      return;
    } else {
      setState(() {
        items = [];
        items = allRestaurants;
      });
    }
  }
}
