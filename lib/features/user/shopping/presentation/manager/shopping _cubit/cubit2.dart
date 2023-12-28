import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/features/user/shopping/presentation/manager/shopping%20_cubit/state.dart';

import '../../../../../../core/constants/variables.dart';
import '../../../../../admin/domain/models/pruduct_model.dart';

class UserShoppingCubit extends Cubit<UserShoppingStates> {
  UserShoppingCubit() : super(UserShoppingInitialState());

  static UserShoppingCubit get(context) => BlocProvider.of(context);
  num totalItem=0;
  double totalPrice=0;
  // Map<String, bool> shoppingMap = {};
  CollectionReference collShopping = FirebaseFirestore.instance
      .collection(collectionUsers)
      .doc(uId)
      .collection(collectionShopping);

  void addShopping(ProductModel productModel) {
    emit(AddLoadingShoppingState());
    collShopping.doc(productModel.uId).set(productModel.toMap()).then((value) {
      // shoppingMap[productModel.uId!] = true;
      emit(AddSuccessShoppingState());
    }).catchError((error) {
      print(error.toString());
      emit(AddErrorShoppingState());
    });
  }

  // void searchIsShopping(ProductModel productModel) async {
  //   DocumentSnapshot documentSnapshot =
  //       await collShopping.doc(productModel.uId.toString()).get();
  //   if (documentSnapshot.exists) {
  //     shoppingMap[productModel.uId!] = true;
  //     emit(ChangeShoppingsState());
  //     removeShopping(productModel.uId);
  //   } else {
  //     shoppingMap[productModel.uId!] = false;
  //     emit(ChangeShoppingsState());
  //     addShopping(productModel);
  //   }
  // }

  void removeShopping(documentId,quantity,price) {
    emit(RemoveLoadingShoppingState());
    collShopping.doc(documentId).delete().then((value) {
      totalItem -= quantity;
      totalPrice -=price;
      emit(RemoveSuccessShoppingState());
    }).catchError((e) {
      print(e.toString());
      emit(RemoveErrorShoppingState());
    });
  }

  List<ProductModel> shoppingProducts = [];

  void getShoppingProducts() {
    emit(GetShoppingProductsLoadingState());
    FirebaseFirestore.instance
        .collection(collectionUsers)
        .doc(uId)
        .collection(collectionShopping)
        .snapshots()
        .listen((event) {
      shoppingProducts = [];
      for (var element in event.docs) {
        shoppingProducts.add(ProductModel.fromJson(element.data()));
      }
      emit(GetShoppingProductsSuccessState());
    });
  }
}
