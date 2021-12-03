import 'package:eat_meat/components/restaurant_information.dart';
import 'package:eat_meat/models/restaurant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  static const String routeName = '/restaurant-details';
  final Restaurant restaurant;

  const RestaurantDetailsScreen({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  static Route route({required Restaurant restaurant}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantDetailsScreen(restaurant: restaurant),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                primary: Theme.of(context).primaryColorDark,
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: () {},
              child: const Text('Basket'),
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(restaurant.imageUrl),
                ),
                borderRadius: BorderRadius.vertical(
                  bottom:
                      Radius.elliptical(MediaQuery.of(context).size.width, 50),
                ),
              ),
            ),
            RestaurantInformation(restaurant: restaurant),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: restaurant.tags?.length,
              itemBuilder: (context, index) =>
                  _buildMenuItems(restaurant, context, index),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItems(
      Restaurant restaurant, BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Text(
            restaurant.tags![index],
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Theme.of(context).primaryColorDark),
          ),
        ),
        Column(
          children: restaurant.menuItems!
              .where((element) => element.category == restaurant.tags![index])
              .map(
                (e) => Column(
                  children: [
                    Container(
                      // color: Theme.of(context).backgroundColor,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          e.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        subtitle: Text(
                          e.description,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '\$${e.price}',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.indigo,
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                    const Divider(height: 2),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
