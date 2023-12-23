import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/features/auth/presentation/manger/register_cubit/states.dart';

import '../../../../../core/constants/variables.dart';
import '../../../domain/models/user_model.dart';


class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit():super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);


  void userRegister({
    required String name ,
    required String email ,
    required String password ,
    required String phone ,
    required String address ,
    required String gender ,

  })
  {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: email,
        password: password,

    ).then((value) {
      if (kDebugMode) {
        print(value.user!.email);
        print(value.user!.uid);
        print('start userCreate');
      }

      userCreate(
          name: name,
          email: email,
          phone: phone,
          uId: value.user!.uid,
          address: address,
          gender: gender,
      );
    }).catchError((error){
      // print(error.response);
      emit(RegisterErrorState(error.toString()));
    });
  }


  void userCreate({
    required String? name ,
    required String email ,
    required String phone ,
    required String uId ,
    required String address ,
    required String gender ,
  }){
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      address: address,
      image: 'https://img.freepik.com/free-vector/hand-drawn-flat-design-salat-illustration_23-2149283922.jpg?w=740&t=st=1697145530~exp=1697146130~hmac=e92359dbc880aa0e1bba202ee65f06f1cf721efb2df9ee9de4019046003cd550',
      coverImage: 'https://img.freepik.com/free-photo/beautiful-serene-mosque-night-blessed-month-ramadan-illuminated-generative-ai_1258-166479.jpg?t=st=1697184735~exp=1697188335~hmac=f5c9553d872c2a5b1d9da2b8ccf564a9da667feb793e56433214ae5b6050026f&w=1380',
      gender: gender,
    );

    FirebaseFirestore.instance
        .collection(collectionUsers)
        .doc(uId)
        .set(model.toMap())
        .then((value) {
          emit(CreateSuccessState(uId));
    }).catchError((error){
      emit(CreateErrorState(error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
    });

  }


  String? genderSelectedValue='Male';
  void genderSelected(value){
    genderSelectedValue = value;
    emit(GenderSelectedState());
    if (kDebugMode) {
      print(genderSelectedValue);
    }
  }



  bool isAdmin=false;
  void isAdminSelected(value){
    isAdmin = value;
    if(isAdmin){
      collectionUsers = 'admins';
    }
    emit(IsAdminSelectedState());
  }



  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(RChangePasswordVisibilityState());
      }
}