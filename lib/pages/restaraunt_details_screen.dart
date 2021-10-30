import 'package:flutter/material.dart';
import 'package:eat_meat/models/models_restaurants.dart';

class RestarauntDetailsScreen extends StatelessWidget {
  static const String routeName = '/restaraunt-details';

  static Route route(){
    return MaterialPageRoute(
      builder: (_) => RestarauntDetailsScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    Restaurant restaraunt = Restaurant.restaurants[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  primary: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(),
                ),
                onPressed: () {},
                child: Text('Basket'),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:NetworkImage(restaraunt.imageUrl),
                )
              ),
            )
          ],
        ),
      ),
    );
  }


}