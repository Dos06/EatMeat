import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String description;
  final double price;

  const MenuItem({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  List<Object> get props => [
    id,
    restaurantId,
    name,
    description,
    price,
  ];

  static List<MenuItem> menuItems = [
    const MenuItem(
      id: 1,
      restaurantId: 1,
      name: "Pizza",
      description: "Just pizza",
      price: 5.99,
    ),
    const MenuItem(
      id: 2,
      restaurantId: 1,
      name: "Sushi",
      description: "Just Sushi",
      price: 15.99,
    ),
    const MenuItem(
      id: 3,
      restaurantId: 2,
      name: "Pizza",
      description: "Just pizza",
      price: 13.99,
    ),
    const MenuItem(
      id: 4,
      restaurantId: 2,
      name: "Sushi",
      description: "Just Sushi",
      price: 8.99,
    ),
    const MenuItem(
      id: 5,
      restaurantId: 3,
      name: "Pizza",
      description: "Just pizza",
      price: 10.99,
    ),
    const MenuItem(
      id: 6,
      restaurantId: 3,
      name: "Sushi",
      description: "Just sushi",
      price: 7.99,
    ),
  ];
}