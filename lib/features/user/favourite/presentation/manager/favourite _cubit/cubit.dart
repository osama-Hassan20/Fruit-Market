import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/core/constants/variables.dart';
import 'package:fruit_market_ecommerce/features/admin/domain/models/pruduct_model.dart';
import 'state.dart';

class UserFavoriteCubit extends Cubit<UserFavoriteStates> {
  UserFavoriteCubit() : super(UserFavoriteInitialState());

  static UserFavoriteCubit get(context) => BlocProvider.of(context);

  Map<String, bool> favoritesMap = {};

  void addFavorite(ProductModel productModel) {
    emit(AddLoadingFavoriteState());
    FirebaseFirestore.instance
        .collection(collectionUsers)
        .doc(uId)
        .collection(collectionFavorite)
        .doc(productModel.uId)
        .set(productModel.toMap())
        .then((value) {
      favoritesMap[productModel.uId!] = true;
      emit(AddSuccessFavoriteState());
    }).catchError((error) {
      print(error.toString());
      emit(AddErrorFavoriteState());
    });
  }

  void searchIsFavorite(ProductModel productModel) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection(collectionUsers)
        .doc(uId)
        .collection(collectionFavorite)
        .doc(productModel.uId.toString())
        .get();
    if (documentSnapshot.exists) {
      favoritesMap[productModel.uId!] = true;
      emit(ChangeFavoritesState());
      removeFavorite(productModel.uId);
    } else {
      favoritesMap[productModel.uId!] = false;
      emit(ChangeFavoritesState());
      addFavorite(productModel);
    }
  }

  void removeFavorite(documentId) {
    emit(RemoveLoadingFavoriteState());
    FirebaseFirestore.instance
        .collection(collectionUsers)
        .doc(uId)
        .collection(collectionFavorite)
        .doc(documentId)
        .delete()
        .then((value) {
      favoritesMap.remove(documentId);
      emit(RemoveSuccessFavoriteState());
    }).catchError((e) {
      print(e.toString());
      emit(RemoveErrorFavoriteState());
    });
  }




  List<ProductModel> favoriteProducts = [];

  void getFavoriteProducts() {
    emit(GetFavoriteProductsLoadingState());
    FirebaseFirestore.instance
        .collection(collectionUsers)
        .doc(uId)
        .collection(collectionFavorite)
        .snapshots()
        .listen((event) {
      favoriteProducts = [];
      for (var element in event.docs) {
        favoriteProducts.add(ProductModel.fromJson(element.data()));
      }
      emit(GetFavoriteProductsSuccessState());
    });
  }
}


