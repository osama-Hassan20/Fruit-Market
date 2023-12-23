import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/core/widgets/space_widget.dart';
import 'package:fruit_market_ecommerce/features/on_boarding/presentation/widgets/custom_app_bar.dart';
import 'package:fruit_market_ecommerce/features/on_boarding/presentation/widgets/custom_indicator.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_buttons.dart';
import '../../../../core/widgets/navigate.dart';
import '../../../auth/presentation/pages/login/login_view.dart';
import '../manger/cubit/onboarding_cubit/onboarding_cubit.dart';
import '../manger/cubit/onboarding_cubit/onboarding_states.dart';
import 'page_view_item.dart';
import 'boarding_list.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var boardController = PageController();
          var cubit = OnBoardingCubit.get(context);

          return Scaffold(
              backgroundColor: const Color(0xffffffff),
              body: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: SizeConfig.defaultSize! * 10,
                ),
                child: Column(
                  children: [
                    cubit.isPageLast
                        ? spaceVertical(value: 5)
                    :Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        defaultTextButton(
                            function:(){
                              cubit.submit(context);
                              // navigateAndFinish(context, const LoginView(),);
                            },
                            text: 'skip'),
                      ],
                    ),
                        // : customAppBar(function: navigateAndFinish(context, const LoginView(),);),
                    spaceVertical(value: 5),
                    Expanded(
                      child: PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: boardController,
                        onPageChanged: (index) {
                          if (index == boarding.length - 1) {
                            cubit.pageLast(index);
                          } else {
                            cubit.pageNotLast(index);
                          }
                        },
                        itemBuilder: (context, index) =>
                            buildPageViewItem(boarding[index]),
                        itemCount: boarding.length,
                      ),
                    ),
                    spaceVertical(value: 5),
                    CustomIndicator(boardController: boardController),
                    spaceVertical(value: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.defaultSize! * 5),
                      child: defaultButton(
                        function: () {
                          if (cubit.isPageLast) {
                            cubit.submit(context);
                          } else {
                            boardController.nextPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.easeInOutCubicEmphasized,
                            );
                          }
                        },
                        text: cubit.textButton,
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
