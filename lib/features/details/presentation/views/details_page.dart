import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/details/data/details_cubit/details_cubit.dart';
import 'package:shopping_app/features/details/presentation/widgets/details_page_body.dart';


class Detailspage extends StatelessWidget {
  const Detailspage({super.key, required this.productId});

  final int productId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit()..featchDetailsData(productId),
      child: const DetailsPageBody(),
    );
  }
}