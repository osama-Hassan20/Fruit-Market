import 'package:flutter/material.dart';
import 'package:fruit_market_ecommerce/core/constants/images.dart';
import 'package:fruit_market_ecommerce/core/utils/size_config.dart';
import 'package:fruit_market_ecommerce/core/widgets/navigate.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/pages/home/admin_home_view.dart';
import 'package:fruit_market_ecommerce/features/on_boarding/presentation/on_boarding_view.dart';
import '../../../../core/constants/variables.dart';
import '../../../../core/widgets/app_name.dart';
import '../../../auth/presentation/pages/login/login_view.dart';
import '../../../user/layout/presentation/pages/user_layout/user_layout_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {

  AnimationController? animationController;//to 0 from 1
  Animation<double>? fadingAnimation;//علشان اتحكم في القيم مش (0,1)وبس

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSlidingAnimation();
    goToNextView();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController?.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        FadeTransition(
          opacity: fadingAnimation!,
          child:  defaultAppName(),
        ),
        Image.asset(AppImages.splashImage,),
      ],
    );
  }


  void initSlidingAnimation(){
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    fadingAnimation = Tween<double>(begin: 0.2 , end: 1).animate(animationController!);
    animationController?.repeat(reverse: true,);
  }




  void goToNextView(){
    if(onBoarding != null ){
      if(uId != null) {
        if(isAdmin == true){
          nextSplashWidget = const AdminHomeView();
        }else{
          nextSplashWidget = const UserLayoutView();
        }

      }else{
        nextSplashWidget = const LoginView();
      }
    }else{
      nextSplashWidget = const OnBoardingView();
    }
    Future.delayed(const Duration(seconds: 3),(){
      navigateAndFinish(context, nextSplashWidget);
      // Get.to(()=>
      //  nextSplashWidget,transition: Transition.size);
    });
  }
}
