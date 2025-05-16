part of 'details_cubit.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

final class DetailsInitial extends DetailsState {}
final class DetailsLoading extends DetailsState {}

final class DetailsFailure extends DetailsState {
  final String errMessage;
  const DetailsFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

final class DetailsSuccess extends DetailsState {
  final ProductDetailsModel product;
  const DetailsSuccess(this.product);

  @override
  List<Object> get props => [product];
}