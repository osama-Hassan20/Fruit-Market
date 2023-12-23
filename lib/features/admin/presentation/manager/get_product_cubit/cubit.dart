import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/core/constants/variables.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/manager/get_product_cubit/states.dart';
import '../../../domain/models/pruduct_model.dart';

class GetProductCubit extends Cubit<GetProductStates> {
  GetProductCubit() : super(GetProductInitialState());

  static GetProductCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];

  void getProducts() {
    emit(GetProductsLoadingState());
    FirebaseFirestore.instance
        .collection(collectionProduct)
        .snapshots()
        .listen((event) {
      products = [];
      for (var element in event.docs) {
        products.add(ProductModel.fromJson(element.data()));
      }
      emit(GetProductsSuccessState());
    });
  }
}
