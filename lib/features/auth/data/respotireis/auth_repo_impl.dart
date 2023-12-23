import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_market_ecommerce/features/auth/presentation/pages/login/login_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/widgets/navigate.dart';
import '../../../user/layout/presentation/pages/user_layout/user_layout_view.dart';
import '../../domain/respotries/auth_repo.dart';

String welcome = "Facebook";

class AuthRepoImpl extends AuthRepo {
  // @override
  // Future<Either<Exception, UserModel>> completeInformation(
  //     {String? name,
  //       String? phoneNumber,
  //       String? address,
  //       UserModel? user}) async {
  //   try {
  //     CollectionReference users =
  //     FirebaseFirestore.instance.collection('users');
  //
  //     UserModel userModel = UserModel(
  //         email: user!.email,
  //         name: name,
  //         phonNumber: phoneNumber,
  //         address: address,);
  //     await users.add(userModel.toJson());
  //     return Right(userModel);
  //   } on Exception catch (e) {
  //     return Left(e);
  //   }
  // }

  // @override
  // Future<Either<Exception, UserCredential>> loginWithFacebook(BuildContext context) async{
  //   Map<String, dynamic>? _userData;
  //   String welcome = "Facebook";
  //   final LoginResult result = await FacebookAuth.instance.login(permissions:['email']);
  //   if (result.status == LoginStatus.success) {
  //
  //     final userData = await FacebookAuth.instance.getUserData();
  //
  //     _userData = userData;
  //
  //   }else {
  //     print(result.message);
  //   }
  //   setState(() {
  //     welcome = _userData?['email'];
  //   });
  //   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);
  //   FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  //
  //   throw UnimplementedError();
  // }

  @override
  Future<Either<Exception, UserCredential>> loginWithFacebook(
      BuildContext context) async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      dynamic user = FirebaseAuth.instance.currentUser!;
      if (kDebugMode) {
        print('user email = ${user.email}');
        print('user email = ${user.displayName}');
        print('user email = $user');
        print('user email = ${user.displayName}');
      }
      CacheHelper.saveData(
        key: 'uId',
        value: user.uid,
      ).then((value) {
        CacheHelper.saveData(
          key: 'isAdmin',
          value: false,
        ).then((value) {
          navigateAndFinish(context, const UserLayoutView());
        });

      });
      return Right(userCredential);
    } catch (e) {
      print(e.toString());
      return Left(Exception('someting went wrong'));
    }
  }

  @override
  Future<Either<Exception, UserCredential>> loginWithGoogle(
      BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      dynamic user = FirebaseAuth.instance.currentUser!;
      print('user email = ${user.email}');
      print('user email = ${user.displayName}');
      print('user email = $user');
      print('user email = ${user.displayName}');
      CacheHelper.saveData(
        key: 'uId',
        value: user.uid,
      ).then((value) {
        CacheHelper.saveData(
          key: 'isAdmin',
          value: false,
        ).then((value) {
          navigateAndFinish(context, const UserLayoutView());
        });

      });

      return Right(userCredential);
    } catch (e) {
      return Left(Exception('something went wrong'));
    }
  }

  @override
  Future<void> logOut(BuildContext context) async {
    await GoogleSignIn().signOut();
    CacheHelper.removeDate(
      key: 'uId',
    ).then((value) {
      CacheHelper.removeDate(
        key: 'isAdmin',
      ).then((value) {
        if (value!) {
          navigateAndFinish(context, const LoginView());
        }
      });
      // navigateAndFinish(context, const AppLayoutView());
      // print('signOut');
    });
  }
}
