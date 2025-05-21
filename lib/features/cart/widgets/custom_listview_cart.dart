import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/cart/data/cart_cubit/cart_state.dart';
import 'package:shopping_app/features/cart/widgets/custom_card_cart_item.dart';

class CustomListviewCart extends StatefulWidget {
  const CustomListviewCart({super.key});

  @override
  State<CustomListviewCart> createState() => _CustomListviewCartState();
}

class _CustomListviewCartState extends State<CustomListviewCart> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartInitial || state is CartUpdated) {
          final items = state is CartUpdated 
              ? state.items 
              : context.read<CartCubit>().cartItems;
              
          if (items.isEmpty) {
            return const Center(
              child: Text('Your cart is empty'),
            );
          }
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final product = items[index];
            return  Padding(
              padding:const  EdgeInsets.only(bottom: 5),
              child: CustomCardCartItem(
                onDismissed: (direction) {
                  setState(() {
                   context.read<CartCubit>().removeFromCart(product);
                  });
                   ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text('${product.title} removed from cart')),
                   );
                },
                product:items[index],
                ),
            );
          },
        );
      } else if (state is CartError) {
          return Center(child: Text(state.message));
        }
        return const Center(child: CircularProgressIndicator());
      }
    );
  }
}
