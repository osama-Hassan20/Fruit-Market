import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/features/auth/presentation/manger/login_cubit/states.dart';


class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);


  void userLogin({
    required String email ,
    required String password ,

  })
  {
    emit(LoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email,
      password: password,
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
    });
  }


  String collectionName = 'users';
  bool isAdmin=false;
  void isAdminSelected(value){
    isAdmin = value;
    if(isAdmin){
      collectionName = 'admins';
    }
    emit(IsAdminSelectedState());
  }




  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(ChangePasswordVisibilityState());
      }
}