import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/home_services.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
 final HomeServices homeService;
  HomeCubit(this.homeService) : super(HomeInitialState());

  void loadDate(){
    emit(CategoriesLoading());
    homeService.getCategories().then((categories) {
      emit(CategoriesSuccess(categories: categories));
      homeService.getProduct(categories.first.id).then((products) {
        emit(ProductsSuccess(products: products));
      }).catchError((error) {
        emit(ProductsFailure(errorMessage: error.toString()));
      });
    }).catchError((error) {
      emit(CategoriesFailure(errorMessage: error.toString()));
    });
  }
}