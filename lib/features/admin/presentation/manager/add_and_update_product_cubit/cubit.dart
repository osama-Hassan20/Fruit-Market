import 'dart:io';
import 'package:fruit_market_ecommerce/features/admin/presentation/manager/add_and_update_product_cubit/states.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/core/constants/variables.dart';
import '../../../domain/models/pruduct_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddAndUpdateProductCubit extends Cubit<AddProductStates> {
  AddAndUpdateProductCubit() : super(AddProductInitialState());

  static AddAndUpdateProductCubit get(context) => BlocProvider.of(context);

  File? productImage;
  ImagePicker picker = ImagePicker();

  Future<void> getProductImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      productImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(ProductImagePickedSuccessState());
    } else {
      emit(ProductImagePickedErrorState(pickedFile.toString()));
    }
  }

  void addSomeProductItem({
    required String? name,
    required dynamic price,
    required String? image,
    required String? description,
    required String? category,
    required String? subCategory,
    required dynamic rate,
    required dynamic discount,
    required String? nutrition,
  }) {
    emit(AddSomeProductItemLoadingState());

    ProductModel model = ProductModel(
      uId: 'uId',
      name: name,
      price: price,
      image: image ?? '',
      description: description,
      category: category,
      subCategory: subCategory,
      rate: rate,
      discount: discount,
      nutrition: nutrition,
    );

    FirebaseFirestore.instance
        .collection(collectionProduct)
        .add(model.toMap())
        .then((value) {
      FirebaseFirestore.instance
          .collection(collectionProduct)
          .doc(value.id)
          .update({'uId': value.id});
      print(value.id);
      emit(AddSomeProductItemSuccessState());
    }).catchError((error) {
      emit(AddSomeProductItemErrorState());
    });
  }

  void addProductTotalItems({
    required String? name,
    required dynamic price,
    required String? description,
    required String? category,
    required String? subCategory,
    required dynamic rate,
    required dynamic discount,
    required String? nutrition,
  }) {
    emit(AddProductTotalItemsLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
            '$collectionProduct/${Uri.file(productImage!.path).pathSegments.last}')
        .putFile(productImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        print(value);
        addSomeProductItem(
          name: name,
          price: price,
          image: value,
          description: description,
          category: category,
          subCategory: subCategory,
          rate: rate,
          discount: discount,
          nutrition: nutrition,
        );
      }).catchError((error) {
        emit(AddSomeProductItemErrorState());

        print(error.toString());
      });
    }).catchError((error) {
      emit(AddProductTotalItemsErrorState());

      print(error.toString());
    });
  }

  void removeProductImage() {
    productImage = null;
    emit(RemoveProductImageState());
  }

  Future<void> updateProduct({
    required String? uId,
    required String? name,
    required dynamic price,
    required String? image,
    required String? description,
    required String? category,
    required String? subCategory,
    required dynamic rate,
    required dynamic discount,
    required String? nutrition,
  }) async {
    emit(UpdateProductLoadingState());
    ProductModel modelUpdate = ProductModel(
      uId: uId,
      name: name,
      price: price,
      image: image,
      description: description,
      category: category,
      subCategory: subCategory,
      rate: rate,
      discount: discount,
      nutrition: nutrition,
    );

    await FirebaseFirestore.instance
        .collection(collectionProduct)
        .doc(uId)
        .update(modelUpdate.toMap())
        .then((value) {
      emit(UpdateProductSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateProductErrorState());
    });
  }

  String imageUrl = '';

  Future<void> updateImage({
    required String? uId,
    required String? name,
    required dynamic price,
    required String? description,
    required String? category,
    required String? subCategory,
    required dynamic rate,
    required dynamic discount,
    required String? nutrition,
  }) async {
    emit(UpdateImageProductLoadingState());
    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('user/${Uri.file(productImage!.path).pathSegments.last}')
        .putFile(productImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        imageUrl = value;
        await updateProduct(
          uId: uId,
          name: name,
          price: price,
          image: value,
          description: description,
          category: category,
          subCategory: subCategory,
          rate: rate,
          discount: discount,
          nutrition: nutrition,
        );
        emit(UpdateImageProductSuccessState());
      }).catchError((error) {
        emit(UpdateImageProductErrorState());
      });
    }).catchError((error) {
      emit(UpdateImageProductErrorState());
    });
  }
}
