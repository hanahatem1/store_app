import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final Map<ProductModel,int> _cartItems = {};

  void addToCart(ProductModel product) {
    if(_cartItems.containsKey(product)){
      _cartItems[product] = _cartItems[product]! +1;
    }else{
      _cartItems[product]=1;
    }
    emit(CartProductAdded(product));
    emit(CartSuccess(_cartItems));
  }

  void removeFromCart(ProductModel product) {
    _cartItems.remove(product);
    emit(CartSuccess(_cartItems));
  }

 void updateQuantity(ProductModel product,int quantity){
  if(quantity<=0){
    _cartItems.remove(product);
  }else{
    _cartItems[product]=quantity;
  } emit(CartSuccess(_cartItems));
 }

  Map<ProductModel,int> get cartItems => _cartItems;
  List<ProductModel> get productList =>_cartItems.keys.toList();

  double get totalPrice{
    double total=0;
    _cartItems.forEach((product,quantity){
      total +=product.price * quantity;
  });
    return total;
}
 }



