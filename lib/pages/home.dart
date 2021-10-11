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
      body: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Restaraunts",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Expanded(child: Center()),
                    IconButton(
                      icon: Icon(Icons.add_shopping_cart), onPressed: () => {},)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    DropdownButton(
                      value: _value,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      icon: Icon(Icons.keyboard_arrow_down),
                      underline: Container(
                        color: Colors.white,
                      ),
                      items: [
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
                      onChanged: (int? value){
                        setState(() {
                          _value = value!;
                        });
                      },
                      hint: Text("Select"),
                    ),
                    IconButton(onPressed: () => {}, icon: Icon(Icons.sort))
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Restaurant.restaurants.length,
                    itemBuilder: (context, index) {
                      return RestaurantCard(
                        restaurant: Restaurant.restaurants[index],
                      );
                    },
                  ),
                )
              ],
            ),
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
            style: Theme
                .of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
