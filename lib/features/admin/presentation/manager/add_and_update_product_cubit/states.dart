abstract class AddProductStates {}

class AddProductInitialState extends AddProductStates {}


// add product
class AddSomeProductItemLoadingState extends AddProductStates {}

class AddSomeProductItemSuccessState extends AddProductStates {}

class AddSomeProductItemErrorState extends AddProductStates {}

class AddProductTotalItemsLoadingState extends AddProductStates {}

class AddProductTotalItemsErrorState extends AddProductStates {}


// Remove Product Image
class RemoveProductImageState extends AddProductStates {}


// Product Image Picked
class ProductImagePickedSuccessState extends AddProductStates {}

class ProductImagePickedErrorState extends AddProductStates {
  final String error;

  ProductImagePickedErrorState(this.error);
}


//update product
class UpdateProductLoadingState extends AddProductStates {}

class UpdateProductSuccessState extends AddProductStates {}

class UpdateProductErrorState extends AddProductStates {}



//update product image
class UpdateImageProductLoadingState extends AddProductStates {}

class UpdateImageProductSuccessState extends AddProductStates {}

class UpdateImageProductErrorState extends AddProductStates {}
