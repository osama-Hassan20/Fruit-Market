import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/network/local/cache_helper.dart';
import '../../../../../../core/widgets/navigate.dart';
import '../../../../../auth/presentation/pages/login/login_view.dart';
import 'onboarding_states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);
  bool isPageLast = false;
  int screenIndex = 0;
  String textButton = 'Next';

  void pageLast(index) {
    isPageLast = true;
    screenIndex = index;
    textButton = 'Get Started';
    emit(PageLast());
  }

  void pageNotLast(index) {
    isPageLast = false;
    screenIndex = index;
    textButton = 'Next';
    emit(NotPageLast());
  }





  void submit(context) {
    CacheHelper.saveData(
        key: 'onBoarding',
        value: true
    ).then((value)
    {
      if(value!){

        navigateAndFinish(context, LoginView());


      }
    });
  }



  // void submit(context) {
  //   CacheHelper.saveData(key: 'onBoarding', value: true).then(
  //     (value)=>Get.to(() => const LoginView(),
  //         duration: const Duration(milliseconds: 750),
  //       curve: Curves.easeInOutCubicEmphasized,
  //     ),
  //   );
  // }
}
