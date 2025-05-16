part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeFailure extends HomeState {
  final String errMessage;
  const HomeFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

final class HomeSuccess extends HomeState {
  final List<ProductModel> products;
  const HomeSuccess(this.products);

  @override
  List<Object> get props => [products];
}
