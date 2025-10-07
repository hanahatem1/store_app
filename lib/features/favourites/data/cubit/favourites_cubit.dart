import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(FavouritesInitial());

  final List<ProductModel> favouritesList = [];
  final _prefsKeyPrefix = 'favourites_';

 
  Future<void> getFavourites() async {
    emit(FavouritesLoading());
    final prefs = await SharedPreferences.getInstance();
    final uid = FirebaseAuth.instance.currentUser?.uid ?? 'guest';
    final data = prefs.getStringList('$_prefsKeyPrefix$uid') ?? [];
    favouritesList
      ..clear()
      ..addAll(data.map((e) => ProductModel.fromJson(jsonDecode(e))).toList());
    emit(FavouritesSuccess(List<ProductModel>.from(favouritesList)));
  }

  Future<void> addToFavourites(ProductModel product) async {
    favouritesList.add(product);
    await _saveToLocal();
    emit(FavouritesSuccess(List<ProductModel>.from(favouritesList)));
  }

  Future<void> removeFromFavourites(ProductModel product) async {
    favouritesList.removeWhere((p) => p.id == product.id);
    await _saveToLocal();
    emit(FavouritesSuccess(List<ProductModel>.from(favouritesList)));
  }

  Future<void> _saveToLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = FirebaseAuth.instance.currentUser?.uid ?? 'guest';
    final data = favouritesList.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList('$_prefsKeyPrefix$uid', data);
  }
}
