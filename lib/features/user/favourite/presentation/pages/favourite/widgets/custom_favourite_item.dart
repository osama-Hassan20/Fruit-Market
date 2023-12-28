import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/widgets/change_quantity_button.dart';

import '../../../../../../core/constants/color.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_arrow_back.dart';
import '../../../../../../core/widgets/custom_show_rating.dart';
import '../../../../../admin/presentation/pages/manage_product/widgets/custom_product_image.dart';
import '../../../../account/presentation/pages/account/widgets/custom_divider.dart';
import '../../../../my_orders/presentation/view/widgets/custom_rateing_bar.dart';

class CustomFavouriteItem extends StatelessWidget {
  const CustomFavouriteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('Favourites'),
        leading: const CustomArrowBack(),
      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CustomProductImage(
                      imageUrl: 'https://firebasestorage.googleapis.com/v0/b/fruit-market-ecommerce.appspot.com/o/Products%2F1000273010.jpg?alt=media&token=3c234fa9-0fa8-4077-ad89-29877d64d608',
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Grapes',
                              ),
                              Text(
                                '160 Per/ kg',
                                style: Styles.textStyle12.copyWith(fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            'Pick up from organic farms',
                            style: Styles.textStyle10.copyWith(color: const Color(0xffB2B2B2)),

                          ),
                          const Spacer(),
                          ShowRatingStars(rating: rating,size: 18,),

                          const Spacer(),
                          Row(
                            children: [
                              ChangeQuantityButton(onTap: (){}, color: mainColor, iconData: Icons.remove),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('2',style:const TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                              const SizedBox(
                                width: 10,
                              ),
                              ChangeQuantityButton(onTap: (){}, color: mainColor, iconData: Icons.add),
                              Spacer(),
                              InkWell(
                                onTap:(){},
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:const Color(0xffCC7D00),
                                      borderRadius: BorderRadius.circular(3)
                                  ),
                                  height: 26,
                                  width:60,
                                  child:Center(
                                    child: const Text('Add',
                                      style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomDivider(),
        ],
      ),
    );
  }
}
