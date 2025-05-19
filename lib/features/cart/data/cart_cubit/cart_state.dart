import 'package:shopping_app/features/home/data/models/product_model.dart';


abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<ProductModel> items;

  CartUpdated(this.items);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}
