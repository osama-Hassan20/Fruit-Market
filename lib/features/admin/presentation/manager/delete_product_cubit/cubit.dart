import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/core/constants/variables.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/manager/delete_product_cubit/states.dart';

class DeleteProductCubit extends Cubit<DeleteProductStates> {
  DeleteProductCubit() : super(DeleteProductInitialState());

  static DeleteProductCubit get(context) => BlocProvider.of(context);

   deleteProduct(documentId){
    emit(DeleteProductsLoadingState());
    FirebaseFirestore.instance.collection(collectionProduct).doc(documentId).delete()
        .then((value) {
      emit(DeleteProductsSuccessState());
    }).catchError((error){
      emit(DeleteProductsErrorState());
    });

  }

}
