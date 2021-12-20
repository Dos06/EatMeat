import 'package:eat_meat/models/menu_item.dart';
import 'package:equatable/equatable.dart';

class Basket extends Equatable {
  final List<MenuItem> items;

  Basket({
    this.items = const <MenuItem>[],
  });

  Basket copyWith({ List<MenuItem>? items }) {
    return Basket(
      items: items ?? this.items,
    );
  }


  @override
  List<Object?> get props => [items];

  Map itemQuantity(List<MenuItem> items) {
    var quantity = Map();

    items.forEach((item) {
      if(!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] +=1;
      }
    });

    return quantity;
  }

  double get subtotal => items.fold(0, (total, current) => total + current.price);
  double total(subtotal) {
    return subtotal + subtotal * 0.1;
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get totalString => total(subtotal).toStringAsFixed(2);
}