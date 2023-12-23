import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/features/user/home/presentation/manager/home%20_cubit/state.dart';

class UserHomeCubit extends Cubit<UserHomeStates> {
  UserHomeCubit() : super (UserHomeInitialState());

  static UserHomeCubit get(context) => BlocProvider.of(context);

}