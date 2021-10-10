import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models_restaurants.dart';

class Restaurant extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final double rating;
  final double distance;
  final List<String> tags;
  final List<MenuItem> menuItems;

  @override
  String toString() {
    return 'Restaurant{name: $name, rating: $rating, distance: $distance, tags: $tags, menuItems: $menuItems}';
  }

  const Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.distance,
    required this.tags,
    required this.menuItems,
  });

  @override
  List<Object> get props => [
        id,
        name,
        imageUrl,
        rating,
        distance,
        tags,
        menuItems,
      ];

  static List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      name: "KFC",
      imageUrl:
          'https://www.linguahouse.com/linguafiles/md5/d01dfa8621f83289155a3be0970fb0cb',
      rating: 4.5,
      distance: 10.5,
      tags: const ['Pizza', 'Burger', 'Pasta'],
      menuItems: MenuItem.menuItems
          .where((element) => element.restaurantId == 1)
          .toList(),
    ),
    Restaurant(
      id: 2,
      name: "McDonald's",
      imageUrl:
          'https://www.linguahouse.com/linguafiles/md5/d01dfa8621f83289155a3be0970fb0cb',
      rating: 5.0,
      distance: 15.2,
      tags: const ['Pizza', 'Burger', 'Pasta'],
      menuItems: MenuItem.menuItems
          .where((element) => element.restaurantId == 2)
          .toList(),
    ),
    Restaurant(
      id: 3,
      name: "Samurai Sushi",
      imageUrl:
          'https://www.linguahouse.com/linguafiles/md5/d01dfa8621f83289155a3be0970fb0cb',
      rating: 4.1,
      distance: 4.8,
      tags: const ['Pizza', 'Burger', 'Pasta'],
      menuItems: MenuItem.menuItems
          .where((element) => element.restaurantId == 3)
          .toList(),
    ),
  ];
}

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(restaurant.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        // Text('qwe ',
                        Text(
                          restaurant.rating.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      restaurant.name,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      '${restaurant.distance} km',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: restaurant.tags
                      .map((tag) => Text(
                            restaurant.tags.indexOf(tag) ==
                                    restaurant.tags.length - 1
                                ? tag
                                : '$tag, ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 16),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
