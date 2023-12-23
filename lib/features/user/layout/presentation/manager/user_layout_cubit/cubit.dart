import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/features/user/layout/presentation/manager/user_layout_cubit/state.dart';

class UserAppCubit extends Cubit<UserAppStates> {
  UserAppCubit() : super(UserAppInitialState());

  static UserAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(UserAppChangeBottomNaveState());
  }

  int cartItem = 0;

  void changeAddToCart() {
    ++cartItem;
    print(cartItem);
    emit(UserAddToCartState());
  }


  bool isScrolledToTop = true;
  void showBottomNav(bool scroll) {
    isScrolledToTop = scroll;
    emit(UserAppShowBottomNaveState());
  }
}
