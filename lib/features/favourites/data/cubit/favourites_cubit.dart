import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(FavouritesInitial());

 final List<ProductModel> favouritesList = [];
 
void addToFavourites(ProductModel product){
  favouritesList.add(product);
  emit(FavouritesSuccess(List<ProductModel>.from(favouritesList)));
}

void removeFromFavourites(ProductModel product){
  favouritesList.remove(product);
  emit(FavouritesSuccess(List<ProductModel>.from(favouritesList)));
}

void getFavourites(){
  emit(FavouritesSuccess(List<ProductModel>.from(favouritesList)));
}
}
