import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String name;

  const Category({required this.id, required this.name,});

  @override
  List<Object> get props => [id, name,];

  static List<Category> categories = [
    const Category(
      id: 1,
      name: "Pizza",
    ),
    const Category(
      id: 2,
      name: "Sushi",
    ),
    const Category(
      id: 3,
      name: "Burger",
    ),
  ];
}