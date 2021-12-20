import 'package:eat_meat/models/basket.dart';
import 'package:equatable/equatable.dart';

abstract class BasketState extends Equatable {
  const BasketState();
}

class BasketLoading extends BasketState {

  @override
  List<Object> get props => [];
}

class BasketLoaded extends BasketState {
  final Basket basket;

  BasketLoaded({required this.basket});

  @override
  List<Object> get props => [basket];
}