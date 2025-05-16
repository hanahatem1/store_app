import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> featchHomeData() async {
    emit(HomeLoading());

    try {
      final dio = Dio();
      final response = await dio.get(('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<ProductModel> products =
            data.map((item) => ProductModel.fromJson(item)).toList();

        emit(HomeSuccess(products));
      } else {
        emit(HomeFailure('Failed to load products. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      emit(HomeFailure('Error: $e'));
    }
  }
}
