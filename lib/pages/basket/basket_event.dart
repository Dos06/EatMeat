import 'package:eat_meat/models/menu_item.dart';
import 'package:equatable/equatable.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class StartBasket extends BasketEvent {

  @override
  List<Object> get props => [];
}

class AddItem extends BasketEvent {
  final MenuItem item;

  const AddItem(this.item);

  @override
  List<Object> get props => [];
}

class RemoveItem extends BasketEvent {
  final MenuItem item;

  const RemoveItem(this.item);

  @override
  List<Object> get props => [];
}
