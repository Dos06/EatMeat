import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models_restaurants.dart';

class CartItem extends StatelessWidget {
  final MenuItem menuItem;

  const CartItem({
    Key? key,
    required this.menuItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 140,
          height: 80,
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            image: DecorationImage(
              image: NetworkImage('https://www.linguahouse.com/linguafiles/md5/d01dfa8621f83289155a3be0970fb0cb')
            )
          ),
        ),
        SizedBox(width: 12.0),

      ],
    );
  }
}