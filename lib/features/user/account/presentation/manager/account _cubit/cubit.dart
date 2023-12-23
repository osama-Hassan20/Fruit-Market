import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constants/variables.dart';
import '../../../../../auth/domain/models/user_model.dart';
import 'state.dart';


class UserAccountCubit extends Cubit<UserAccountStates> {
  UserAccountCubit() : super (UserAccountInitialState());

  static UserAccountCubit get(context) => BlocProvider.of(context);


  UserModel? userModel;

  void getUserData()
  {
    emit(GetUserAccountLoadingState());
    FirebaseFirestore.instance
        .collection(collectionUsers)
        .doc(uId)
        .get()
        .then((value){
      print(value.data());
      userModel = UserModel.fromJson(value.data()!);
      emit(GetUserAccountSuccessState());
    })
        .catchError((error){
      print(error.toString());
      emit(GetUserAccountErrorState(error.toString()));
    }
    );
  }

}