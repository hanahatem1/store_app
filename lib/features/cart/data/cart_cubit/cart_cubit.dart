import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final Map<ProductModel, int> _cartItems = {};
  final _prefsKeyPrefix = 'cart_';

  Future<void> loadCart() async {
    emit(CartLoading());
    final prefs = await SharedPreferences.getInstance();
    final uid = FirebaseAuth.instance.currentUser?.uid ?? 'guest';
    final storedData = prefs.getStringList('$_prefsKeyPrefix$uid') ?? [];

    _cartItems.clear();
    for (final jsonItem in storedData) {
      final item = jsonDecode(jsonItem);
      final product = ProductModel.fromJson(item['product']);
      final quantity = item['quantity'] ?? 1;
      _cartItems[product] = quantity;
    }

    emit(CartSuccess(_cartItems));
  }

  Future<void> addToCart(ProductModel product) async {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1;
    } else {
      _cartItems[product] = 1;
    }
    await _saveCart();
    emit(CartProductAdded(product));
    emit(CartSuccess(_cartItems));
  }

  Future<void> removeFromCart(ProductModel product) async {
    _cartItems.remove(product);
    await _saveCart();
    emit(CartSuccess(_cartItems));
  }

  Future<void> updateQuantity(ProductModel product, int quantity) async {
    if (quantity <= 0) {
      _cartItems.remove(product);
    } else {
      _cartItems[product] = quantity;
    }
    await _saveCart();
    emit(CartSuccess(_cartItems));
  }

  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = FirebaseAuth.instance.currentUser?.uid ?? 'guest';

    final encodedList = _cartItems.entries.map((entry) {
      return jsonEncode({
        'product': entry.key.toJson(),
        'quantity': entry.value,
      });
    }).toList();

    await prefs.setStringList('$_prefsKeyPrefix$uid', encodedList);
  }

  Map<ProductModel, int> get cartItems => _cartItems;
  List<ProductModel> get productList => _cartItems.keys.toList();

  double get totalPrice {
    double total = 0;
    _cartItems.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }
}
