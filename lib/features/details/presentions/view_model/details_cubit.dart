import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/details_use_case.dart';
import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final ProductDetailsUseCase productDetailsUseCase;
  DetailsCubit(this.productDetailsUseCase)
    : super(DetailsInitialState());

  Future<void> getProductDetails({required int productId}) async {
    emit(DetailsLoading());
    final result = await productDetailsUseCase.invoke(id: productId);
    result.fold(
      (failure) => emit(DetailsFailure(errorMessage: failure.failureMessage)),
      (productDetailsEntity) => emit(DetailsSuccess(productDetailsEntity: productDetailsEntity)),
    );
  }
}

