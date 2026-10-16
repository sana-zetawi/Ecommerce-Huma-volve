import '../../domain/entity/details_entity.dart';

abstract class DetailsState {}

class DetailsInitialState extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsSuccess extends DetailsState {
  final ProductDetailsEntity productDetailsEntity;

  DetailsSuccess({required this.productDetailsEntity});
}

class DetailsFailure extends DetailsState {
  final String errorMessage;

  DetailsFailure({required this.errorMessage});
}
