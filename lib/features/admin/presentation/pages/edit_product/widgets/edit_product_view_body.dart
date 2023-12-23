import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/core/widgets/custom_buttons.dart';
import 'package:fruit_market_ecommerce/core/widgets/show_toast.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/add_pruduct/widgets/name_item.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/add_pruduct/widgets/pruduct_controllers.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/add_pruduct/widgets/selected_nutrition.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/add_pruduct/widgets/selected_rate.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/add_pruduct/widgets/selected_sub_category.dart';
import '../../../../../../core/widgets/default_text_form_field.dart';
import '../../../manager/add_and_update_product_cubit/cubit.dart';
import '../../../manager/add_and_update_product_cubit/states.dart';
import '../../manage_product/widgets/custom_product_image.dart';

class EditProductViewBody extends StatelessWidget {
  EditProductViewBody({Key? key, required this.id, required this.image})
      : super(key: key);

  final String id;
  final String image;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddAndUpdateProductCubit, AddProductStates>(
      listener: (context, state) {
        if (state is UpdateProductSuccessState) {
          showToast(
              text: 'The product has been update successfully',
              state: ToastState.SUCCESS);
          nameProductController.clear();
          priceProductController.clear();
          descriptionProductController.clear();
          selectedCategory = null;
          selectedRate = null;
          nutritionProduct = null;
          selectedSubCategory = null;
          discountProductController.clear();
          AddAndUpdateProductCubit.get(context).removeProductImage();
          // AddAndUpdateProductCubit.get(context).getProducts();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        AddAndUpdateProductCubit cubit = AddAndUpdateProductCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    cubit.getProductImage();
                  },
                  child: DottedBorder(
                    radius: const Radius.circular(10),
                    dashPattern: const [4, 4],
                    strokeWidth: 2,
                    borderType: BorderType.RRect,
                    color: Colors.grey,
                    child: cubit.productImage != null
                        ? Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Container(
                          height: 200.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: FileImage(cubit.productImage!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            cubit.removeProductImage();
                          },
                          icon: const CircleAvatar(
                            radius: 20.0,
                            child: Icon(
                              Icons.close,
                              size: 16.0,
                            ),
                          ),
                        ),
                      ],
                    )
                        : Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        SizedBox(
                          height: 200.0,
                          width: double.infinity,
                          child: CustomProductImage(
                            imageUrl: productImage!,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            cubit.removeProductImage();
                          },
                          icon: const CircleAvatar(
                            radius: 20.0,
                            child: Icon(
                              Icons.close,
                              size: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                nameItem(name: 'Product Name'),
                defaultFormField(
                  controller: nameProductController,
                  type: TextInputType.text,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          nameItem(name: 'Price'),
                          defaultFormField(
                            controller: priceProductController,
                            type: TextInputType.number,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'enter your Price';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          nameItem(name: 'Discount'),
                          defaultFormField(
                            controller: discountProductController,
                            type: TextInputType.number,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'enter your Discount';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                nameItem(name: 'Description'),
                defaultFormField(
                  controller: descriptionProductController,
                  type: TextInputType.text,
                  maxLines: 5,
                  hintText: 'Write about your product.......',
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter your Description';
                    }
                    return null;
                  },
                ),
                // ColorSelectionDropdown(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          nameItem(name: 'Choose Sub Category'),
                          const SelectedSubCategory(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          nameItem(name: 'Rate'),
                          const SelectedRate(),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                nameItem(name: 'Choose Nutrition'),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const ColorSelectionDropdown(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                state is AddProductTotalItemsLoadingState ||
                    state is AddSomeProductItemLoadingState
                    ? const LinearProgressIndicator()
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),

                defaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        if (true) {
                          if (selectedCategory != null ||
                              selectedSubCategory != null ||
                              selectedRate != null ||
                              nutritionProduct != null) {
                            if (cubit.productImage == null) {
                              cubit.updateProduct(
                                uId: id,
                                image: image,
                                name: nameProductController.text,
                                price: priceProductController.text,
                                description: descriptionProductController.text,
                                category: selectedCategory,
                                subCategory: selectedSubCategory,
                                rate: selectedRate,
                                discount: discountProductController.text,
                                nutrition: nutritionProduct,
                              );
                            } else {
                              cubit.updateImage(
                                uId: id,
                                name: nameProductController.text,
                                price: priceProductController.text,
                                description: descriptionProductController.text,
                                category: selectedCategory,
                                subCategory: selectedSubCategory,
                                rate: selectedRate,
                                discount: discountProductController.text,
                                nutrition: nutritionProduct,
                              );
                            }
                          } else {
                            showToast(
                              text:
                              'Please complete the rest of the product items',
                              state: ToastState.WORNING,
                            );
                          }
                        } else {
                          showToast(
                            text: 'Please enter an image of the product',
                            state: ToastState.WORNING,
                          );
                        }
                      } else {
                        showToast(
                          text: 'Please complete the rest of the product items',
                          state: ToastState.WORNING,
                        );
                      }
                    },
                    text: 'Update Product')
              ],
            ),
          ),
        );
      },
    );
  }
}
