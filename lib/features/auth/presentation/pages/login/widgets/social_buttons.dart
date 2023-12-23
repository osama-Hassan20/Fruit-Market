import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_buttons.dart';
import '../../../../../../core/widgets/space_widget.dart';
import '../../../../data/respotireis/auth_repo_impl.dart';



class SocialButtons extends StatelessWidget {
   const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
            child: defaultButtonWithIcon(
              onTap: () {
                AuthRepoImpl().loginWithGoogle(context);
              },
              backgroundColor: const Color(0xFFdb3236),
              iconData: FontAwesomeIcons.google,
              text: 'Google',
            ),
          ),
        ),
        spaceHorizontal(value: 3),
        Flexible(
          flex: 1,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
            child: defaultButtonWithIcon(
              onTap: () {
                // AuthRepoImpl().logOut(context);
                AuthRepoImpl().loginWithFacebook(context);
                // navigateTo(context, CompleteInformationView());
                // Get.to(() => const CompleteInformationView(),
                //     duration: const Duration(milliseconds: 500),
                //     transition: Transition.rightToLeft);
              },
              backgroundColor: const Color(0xFF4267B2),
              iconData: FontAwesomeIcons.facebookF,
              text: 'Facebook',
            ),
          ),
        )
      ],
    );
  }
}
