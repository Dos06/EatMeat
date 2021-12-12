import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

  const MenuItem({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  @override
  List<Object> get props => [
        id,
        restaurantId,
        name,
        description,
        price,
        imageUrl,
        category,
      ];

  static List<MenuItem> menuItems = [
    const MenuItem(
      id: 1,
      restaurantId: 1,
      category: "Pizza",
      name: "Pizza",
      description: "Just pizza",
      price: 5.99,
      imageUrl:
          'https://www.linguahouse.com/linguafiles/md5/d01dfa8621f83289155a3be0970fb0cb',
    ),
    const MenuItem(
      id: 2,
      restaurantId: 1,
      category: "Sushi",
      name: "Sushi",
      description: "Just Sushi",
      price: 15.99,
      imageUrl:
          'https://www.linguahouse.com/linguafiles/md5/d01dfa8621f83289155a3be0970fb0cb',
    ),
    const MenuItem(
      id: 3,
      restaurantId: 2,
      category: "Pizza",
      name: "Pizza",
      description: "Just pizza",
      price: 13.99,
      imageUrl:
          'https://www.linguahouse.com/linguafiles/md5/d01dfa8621f83289155a3be0970fb0cb',
    ),
    const MenuItem(
      id: 4,
      restaurantId: 2,
      category: "Sushi",
      name: "Sushi",
      description: "Just Sushi",
      price: 8.99,
      imageUrl:
          'https://www.linguahouse.com/linguafiles/md5/d01dfa8621f83289155a3be0970fb0cb',
    ),
    const MenuItem(
      id: 5,
      restaurantId: 3,
      category: "Pizza",
      name: "Pizza",
      description: "Just pizza",
      price: 10.99,
      imageUrl:
          'https://www.linguahouse.com/linguafiles/md5/d01dfa8621f83289155a3be0970fb0cb',
    ),
  ];
}
