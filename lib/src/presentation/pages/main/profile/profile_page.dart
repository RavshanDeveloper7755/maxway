import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/routes_name.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/global_listtile.dart';
import '../../../../core/widgets/text_items.dart';
import 'widgets/user_info_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText.items(text: 'Профиль', size: 20, color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            height: 90.h,
            width: double.infinity,
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              child: const UserInfoWidget(
                username: 'User',
                userPhoneNumber: '+998 00 000 00 00',
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Material(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            child: Column(
              children: [
                GlobalListTile(name: 'Филиалы',
                    leadingIcon: Icons.location_on_outlined,
                    trailingIcon: Icons.keyboard_arrow_right_sharp,
                onPressed: () => Navigator.pushNamed(context, RouteName.branchsPage),
                ),
                const Divider(),
                GlobalListTile(name: 'Настройки',
                  leadingIcon: Icons.settings,
                  trailingIcon: Icons.keyboard_arrow_right_sharp,
                  onPressed: () => Navigator.pushNamed(context, RouteName.settingPage),
                ),
                const Divider(),
                GlobalListTile(name: 'Мои адресы',
                  leadingIcon: Icons.my_location_outlined,
                  trailingIcon: Icons.keyboard_arrow_right_sharp,
                  onPressed: () => Navigator.pushNamed(context, RouteName.myLocationPage),
                ),
                const Divider(),
                const GlobalListTile(name: 'О сервисе',
                  leadingIcon: Icons.error_outline_outlined,
                  trailingIcon: Icons.keyboard_arrow_right_sharp,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
