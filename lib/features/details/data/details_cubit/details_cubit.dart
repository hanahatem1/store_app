import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

Future<void> featchDetailsData(int id) async {
    emit(DetailsLoading());

    try {
      final dio = Dio();
      final response = await dio.get(('https://fakestoreapi.com/products/$id'));

      if (response.statusCode == 200) {
        final  data = response.data;
        final  product = ProductModel.fromJson(data);

        emit(DetailsSuccess(product));
      } else {
        emit(DetailsFailure('Failed to load product Status code: ${response.statusCode}'));
      }
    } catch (e) {
      emit(DetailsFailure('Error: $e'));
    }
  }

}
