import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/snak_bar_widget.dart';
import 'package:shopping_app/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/cart/data/cart_cubit/cart_state.dart';
import 'package:shopping_app/features/cart/presentation/widgets/custom_card_cart_item.dart';

class CustomListviewCart extends StatelessWidget {
  const CustomListviewCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartCubit=context.read<CartCubit>();
        final cartItems= state is CartSuccess
          ? state.items
          : cartCubit.cartItems;
              
          if (cartItems.isEmpty) {
            return const Center(
              child: Text('Your cart is empty'),
            );
          }
          final products=cartItems.keys.toList();
        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            final quntity = cartItems[product]!;
            return  Padding(
              padding:const  EdgeInsets.only(bottom: 5),
              child: CustomCardCartItem(
                onDismissed: (direction) {
                  context.read<CartCubit>().removeFromCart(product);
                  SnakBarWidget.show(context,title:('${product.title} removed from cart'));
                },
                product:product,
                quantity: quntity,
                ),
            );
          },
        );
      } 
    );
  }
}
