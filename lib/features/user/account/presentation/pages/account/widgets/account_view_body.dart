import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/core/constants/color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../../core/widgets/custom_conditional_builder_fallback.dart';
import '../../../../../../../core/widgets/full_screen_image.dart';
import '../../../../../../../core/widgets/navigate.dart';
import '../../../../../../auth/data/respotireis/auth_repo_impl.dart';
import '../../../../../layout/presentation/manager/user_layout_cubit/cubit.dart';
import '../../../../../layout/presentation/manager/user_layout_cubit/state.dart';
import '../../../manager/account _cubit/cubit.dart';
import '../../../manager/account _cubit/state.dart';
import '../../edit_account/edit_account_view.dart';
import 'custom_profile_item.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserAccountCubit , UserAccountStates>(
      listener: (context , state){},
      builder: (context , state){
        var cubit = UserAccountCubit.get(context);
        return  ConditionalBuilder(
          condition: state != GetUserAccountLoadingState && cubit.userModel != null,
          builder: (context) => Scaffold(

            body:  SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 250.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 180.0,
                                width: double.infinity,
                                child: CachedNetworkImage(
                                    imageUrl: cubit.userModel!.coverImage!,
                                    imageBuilder: (context, imageProvider) =>
                                        Image(image: imageProvider,fit: BoxFit.cover),
                                    placeholder: (context, url) =>  const CustomConditionalBuilderFallback(),
                                    errorWidget: (context, url, error) {
                                      print(error.toString());
                                      return  const CustomConditionalBuilderFallback();
                                    }),
                              ),
                              Container(
                                height: 180,
                                width: double.infinity,
                                color: mainColor.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 150,
                          bottom: 15,
                          child: OutlinedButton(
                            onPressed: () {
                              AuthRepoImpl().logOut(context);
                            },
                            child:  const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'LogOut',
                                ),
                                SizedBox(width: 10,),
                                Icon(
                                  Icons.logout,
                                  size: 16.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 15,
                          child: OutlinedButton(
                            onPressed: () {
                              navigateTo(context, const EditUserAccountView());
                            },
                            child:  const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'edit',
                                ),
                                SizedBox(width: 10,),
                                Icon(
                                  Icons.edit,
                                  size: 16.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 0,
                          child: CircleAvatar(
                            radius: 66.0,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FullScreenImage(imagePath:'${cubit.userModel!.image}'),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage('${cubit.userModel!.image}'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomUserAccount(title: 'Name', body: cubit.userModel!.name!),
                  CustomUserAccount(title: 'Email', body: cubit.userModel!.email!),
                  CustomUserAccount(title: 'Phone', body: cubit.userModel!.phone!),
                  CustomUserAccount(title: 'Address', body: cubit.userModel!.address!),
                  CustomUserAccount(title: 'Gender', body: cubit.userModel!.gender!),

                ],
              ),
            ),
          ),
          fallback: (context) =>  const CustomConditionalBuilderFallback(),
        );
      },
    );
  }
}
