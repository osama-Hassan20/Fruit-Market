import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/features/user/shopping/presentation/manager/shopping%20_cubit/state.dart';

class UserShoppingCubit extends Cubit<UserShoppingStates> {
  UserShoppingCubit() : super (UserShoppingInitialState());

  static UserShoppingCubit get(context) => BlocProvider.of(context);

}