import 'package:eat_meat/models/models_restaurants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DropdownButton(
                  value: _value,
                  style: Theme.of(context).textTheme.headline6,
                  hint: const Text("Select"),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  underline: Container(color: Colors.white),
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
                ),
                IconButton(
                  icon: const Icon(Icons.sort),
                  onPressed: () => {},
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: Restaurant.restaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(
                    restaurant: Restaurant.restaurants[index],
                  );
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
