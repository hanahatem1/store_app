part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<ProductModel> product;
  const SearchSuccess(this.product);
  @override
  List<Object> get props => [product];
}

final class SearchError extends SearchState {
  final String errMessage;
  const SearchError(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
