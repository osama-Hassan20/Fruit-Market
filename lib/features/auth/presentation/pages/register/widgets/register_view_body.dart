import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/features/auth/presentation/pages/register/widgets/gender_button.dart';
import 'package:fruit_market_ecommerce/features/auth/presentation/pages/register/widgets/sign_in_line.dart';
import '../../../../../../core/constants/color.dart';
import '../../../../../../core/network/local/cache_helper.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_buttons.dart';
import '../../../../../../core/widgets/default_text_form_field.dart';
import '../../../../../../core/widgets/navigate.dart';
import '../../../../../../core/widgets/show_toast.dart';
import '../../../../../../core/widgets/space_widget.dart';
import '../../../manger/register_cubit/cubit.dart';
import '../../../manger/register_cubit/states.dart';
import '../../login/login_view.dart';
import '../../login/widgets/cintinue_line.dart';
import '../../login/widgets/social_buttons.dart';

// ignore: must_be_immutable
class RegisterViewBody extends StatelessWidget {
   RegisterViewBody({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   var nameController = TextEditingController();
   var emailController = TextEditingController();
   var passwordController = TextEditingController();
   var phoneController = TextEditingController();
   var addressController = TextEditingController();
   var genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create:(BuildContext context) => RegisterCubit() ,
      child: BlocConsumer<RegisterCubit , RegisterStates>(
        listener: (BuildContext context, Object? state)async {
          if(state is RegisterErrorState){
            showToast(
                text: state.error.toString(),
                state: ToastState.ERROR
            );
          }
          if (state is CreateSuccessState)
          {
           await CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              if (kDebugMode) {
                print(state.uId);
                print('${CacheHelper.getData(key:'uId')}');
              }
              showToast(
                  text: 'CreateSuccessState',
                  state: ToastState.SUCCESS
              );
              navigateAndFinish(context, const LoginView());
            });
          }
        },
        builder: (BuildContext context, Object? state){
          var cubit =RegisterCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
                padding:  EdgeInsets.all( SizeConfig.defaultSize! * 2),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 5),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: defaultButtonWithIcon(
                                withIcon: false,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                                onTap: () {
                                  cubit.isAdminSelected(false);
                                },
                                textColor: cubit.isAdmin? mainColor:Colors.white,
                                backgroundColor: cubit.isAdmin? Colors.white : mainColor,
                                text: 'user',
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: defaultButtonWithIcon(
                                withIcon: false,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                                onTap: () {
                                  cubit.isAdminSelected(true);
                                },
                                textColor: cubit.isAdmin? Colors.white : mainColor,
                                backgroundColor:cubit.isAdmin? mainColor:Colors.white,
                                text: 'admin',
                              ),
                            )
                          ],
                        ),
                      ),
                      spaceVertical(value: 2),
                      defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your email address';
                            }
                            return null;
                          }),
                      spaceVertical(value: 1),
                      defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'Password',
                          prefix: Icons.lock_outline,
                          suffix: cubit.suffix,
                          isPassword:
                          cubit.isPassword,
                          suffixPressed: () {
                            cubit
                                .changePasswordVisibility();
                          },
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your password';
                            }
                            return null;
                          }),
                      spaceVertical(value: 1),
                      defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          label: 'User Name',
                          prefix: Icons.person,
                          validate: (String? value){
                            if(value!.isEmpty){
                              return'please enter your name';
                            }
                            return null;
                          }
                      ),
                      spaceVertical(value: 1),
                      defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          label: 'phone',
                          prefix: Icons.phone,
                          validate: (String? value){
                            if(value!.isEmpty){
                              return'please enter your phone';
                            }
                            return null;
                          }
                      ),
                      spaceVertical(value: 1),
                      defaultFormField(
                          controller: addressController,
                          type: TextInputType.name,
                          label: 'Address',
                          prefix: Icons.person,
                          validate: (String? value){
                            if(value!.isEmpty){
                              return'please enter your address';
                            }
                            return null;
                          }
                      ),
                      spaceVertical(value: 1),
                      genderButton(cubit),
                      spaceVertical(value: 2),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 7),
                        child: Center(
                          child: ConditionalBuilder(
                            condition: state is! RegisterLoadingState,
                            builder: (context) => defaultButton(
                              function: () {
                                if(formKey.currentState!.validate()){
                                  cubit.userRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text,
                                    address: addressController.text,
                                    gender: cubit.genderSelectedValue!,
                                  );
                                }
                              },
                              text: 'Sign Up',
                              isUpperCase: true,
                            ),
                            fallback: (context) =>
                            const CircularProgressIndicator(),
                          ),
                        ),
                      ),

                      spaceVertical(value: 2),
                      RegisterCubit.get(context).isAdmin? spaceVertical(value: 1):const ContinueLine(),
                      spaceVertical(value: 1),
                      RegisterCubit.get(context).isAdmin? spaceVertical(value: 2):const SocialButtons(),
                      spaceVertical(value: 1),
                      const SignInLine(),
                    ],
                  ),
                ),
              ),
          );
        },
      ),
    );
  }
}
