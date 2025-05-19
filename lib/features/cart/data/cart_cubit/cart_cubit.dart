import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<ProductModel> _cartItems = [];

  void addToCart(ProductModel product) {
    _cartItems.add(product);
    emit(CartUpdated(_cartItems));
     debugPrint('Product added: ${product.title}');
  }

  void removeFromCart(ProductModel product) {
    _cartItems.remove(product);
    emit(CartUpdated(_cartItems));
  }

  List<ProductModel> get cartItems => _cartItems;
}
