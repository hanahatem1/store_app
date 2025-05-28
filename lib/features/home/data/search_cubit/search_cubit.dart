import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.products) : super(SearchInitial());
final List<ProductModel> products;
  void searchProducts (String query){
    emit(SearchLoading());
    try{
      final filterd = products.where((product) =>product.title.toLowerCase().contains(query.toLowerCase())).toList();
    emit(SearchSuccess(filterd));
    } catch(e){
      emit(SearchError('there is something error:$e'));
    }
  }
  void clearSearch(){
    emit(SearchInitial());
  }
}
