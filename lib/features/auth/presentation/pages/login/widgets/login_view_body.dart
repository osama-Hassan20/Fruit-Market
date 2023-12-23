import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/core/widgets/space_widget.dart';
import 'package:fruit_market_ecommerce/features/auth/presentation/pages/login/widgets/forget_password_button.dart';
import 'package:fruit_market_ecommerce/features/auth/presentation/pages/login/widgets/sign_up_line.dart';
import 'package:fruit_market_ecommerce/features/auth/presentation/pages/login/widgets/social_buttons.dart';
import 'package:fruit_market_ecommerce/features/auth/presentation/pages/login/widgets/welcome_card.dart';
import '../../../../../../core/constants/color.dart';
import '../../../../../../core/network/local/cache_helper.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_buttons.dart';
import '../../../../../../core/widgets/default_text_form_field.dart';
import '../../../../../../core/widgets/navigate.dart';
import '../../../../../../core/widgets/show_toast.dart';
import '../../../../../admin/presentation/pages/home/admin_home_view.dart';
import '../../../../../user/layout/presentation/pages/user_layout/user_layout_view.dart';
import '../../../manger/login_cubit/cubit.dart';
import '../../../manger/login_cubit/states.dart';
import 'cintinue_line.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final adminPassword = 'admin1market2024';

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, Object? state) {
          var cubit = LoginCubit.get(context);
          if (state is LoginErrorState) {
            showToast(text: state.error, state: ToastState.ERROR);
          }

          if (state is LoginSuccessState) {
            CacheHelper.saveData(
              key: 'isAdmin',
              value: cubit.isAdmin,
            ).then((value) {
              if (cubit.isAdmin) {
                // ignore: unrelated_type_equality_checks
                if (passwordController.text == adminPassword) {
                  CacheHelper.saveData(
                    key: 'uId',
                    value: state.uId,
                  ).then((value) {
                    print(state.uId);
                    print('${CacheHelper.getData(key: 'uId')}');
                    navigateAndFinish(context, const AdminHomeView());
                  });
                  // SocialCubit.get(context).getUserData();
                  showToast(text: 'Login Success', state: ToastState.SUCCESS);
                } else {
                  showToast(
                      text: 'user is not admin', state: ToastState.SUCCESS);
                }
              } else {
                CacheHelper.saveData(
                  key: 'uId',
                  value: state.uId,
                ).then((value) {
                  print(state.uId);
                  print('${CacheHelper.getData(key: 'uId')}');
                  navigateAndFinish(context, const UserLayoutView());
                });
                // SocialCubit.get(context).getUserData();
                showToast(text: 'Login Success', state: ToastState.SUCCESS);
              }
            });
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WelcomeCard(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.defaultSize! * 5),
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
                              textColor:
                                  cubit.isAdmin ? mainColor : Colors.white,
                              backgroundColor:
                                  cubit.isAdmin ? Colors.white : mainColor,
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
                              textColor:
                                  cubit.isAdmin ? Colors.white : mainColor,
                              backgroundColor:
                                  cubit.isAdmin ? mainColor : Colors.white,
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
                    spaceVertical(value: 2),
                    defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        label: 'Password',
                        prefix: Icons.lock_outline,
                        suffix: cubit.suffix,
                        isPassword: cubit.isPassword,
                        suffixPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter your password';
                          }
                          return null;
                        }),
                    spaceVertical(value: 3),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.defaultSize! * 7),
                      child: Center(
                        child: ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) =>
                          defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userLogin(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                              }
                            },
                            text: 'login',
                            isUpperCase: true,
                          ),
                          fallback: (context) =>
                              const CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    spaceVertical(value: 2),
                    const ForgetPasswordButton(),
                    spaceVertical(value: 2),
                    cubit.isAdmin
                        ? spaceVertical(value: 2)
                        : const ContinueLine(),
                    spaceVertical(value: 1),
                    cubit.isAdmin
                        ? spaceVertical(value: 3)
                        : const SocialButtons(),
                    spaceVertical(value: 2),
                    const SignUpLine(),
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
