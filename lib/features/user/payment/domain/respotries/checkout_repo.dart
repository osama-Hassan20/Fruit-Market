import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/user_model.dart';



abstract class AuthRepo {
  Future<Either<Exception, UserCredential>> loginWithGoogle(BuildContext context);
  Future<Either<Exception, UserCredential>> loginWithFacebook(BuildContext context);
  Future<void> logOut(BuildContext context);

  Future<Either<Exception, UserModel>> completeInformation(
      { required String name ,
        required String email ,
        required String uId ,
        required String phone ,
        required String address ,
        required String image ,
        required String gender ,
        required BuildContext context,
      });
}