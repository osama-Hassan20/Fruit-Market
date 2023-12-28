import 'package:flutter/material.dart';

import '../../../../account/presentation/pages/account/widgets/custom_divider.dart';
import '../../../../account/presentation/pages/account/widgets/custom_divider_list_title.dart';

class AccountSettingViewBody extends StatelessWidget {
  const AccountSettingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomDividerListTitle(
          title: 'Security',
          onTap: (){},
          iconData: Icons.security,
        ),
        const CustomDivider(),
        CustomDividerListTitle(
          title: 'Deactivate Account',
          onTap: (){},
          iconData: Icons.cancel,
        ),
        const CustomDivider(),
        CustomDividerListTitle(
          title: 'Delete Account',
          onTap: (){},
          iconData: Icons.delete,
        ),
        const CustomDivider(),

      ],
    );
  }
}
