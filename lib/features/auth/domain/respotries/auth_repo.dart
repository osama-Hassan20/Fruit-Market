import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';



abstract class AuthRepo {
  Future<Either<Exception, UserCredential>> loginWithGoogle(BuildContext context);
  Future<Either<Exception, UserCredential>> loginWithFacebook(BuildContext context);
  Future<void> logOut(BuildContext context);

  // Future<Either<Exception, UserModel>> completeInformation(
  //     {required String name,
  //     required String phoneNumber,
  //     required String address,
  //     required UserModel user});
}