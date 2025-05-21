import 'package:shopping_app/features/home/data/models/product_model.dart';


abstract class CartState {}

class CartInitial extends CartState {}

class CartSuccess extends CartState {
  final List<ProductModel> items;

  CartSuccess(this.items);
}
class CartProductAdded extends CartState {
  final ProductModel product;
  CartProductAdded(this.product);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}
