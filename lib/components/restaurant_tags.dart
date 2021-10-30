import 'package:eat_meat/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantTags extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantTags({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
