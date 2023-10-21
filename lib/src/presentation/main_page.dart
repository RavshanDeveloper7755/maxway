import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maxway/src/presentation/pages/order_create/pages/order_create_page.dart';

import '../core/utils/app_colors.dart';
import 'bloc/main/main_bloc.dart';
import 'pages/main/basket/basket_page.dart';
import 'pages/main/home/home_page.dart';
import 'pages/main/orders/pages/orders_page.dart';
import 'pages/main/profile/profile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.bottomMenu.index,
            children: const [
              HomePage(),
              BasketPage(),
              OrdersPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.bottomMenu.index,
            unselectedItemColor: AppColors.defaultGrey,
            selectedItemColor: AppColors.defaultPurple,
            showUnselectedLabels: true,
            unselectedFontSize: 14,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              context.read<MainBloc>().add(
                    BottomMenuEvent(
                      menu: BottomMenu.values[index],
                    ),
                  );
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/svg_icon/ic_home.svg',
                      colorFilter: ColorFilter.mode(
                          state.bottomMenu.index == 0
                              ? AppColors.defaultPurple
                              : AppColors.defaultGrey,
                          BlendMode.srcIn)),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/svg_icon/ic_basket.svg',
                      colorFilter: ColorFilter.mode(
                          state.bottomMenu.index == 1
                              ? AppColors.defaultPurple
                              : AppColors.defaultGrey,
                          BlendMode.srcIn)),
                  label: 'Basket'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/svg_icon/ic_order.svg',
                      colorFilter: ColorFilter.mode(
                          state.bottomMenu.index == 2
                              ? AppColors.defaultPurple
                              : AppColors.defaultGrey,
                          BlendMode.srcIn)),
                  label: 'Orders'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg_icon/ic_profile.svg',
                    colorFilter: ColorFilter.mode(
                        state.bottomMenu.index == 3
                            ? AppColors.defaultPurple
                            : AppColors.defaultGrey,
                        BlendMode.srcIn),
                  ),
                  label: 'Profile'),
            ],
            ),
        );
      },
    );
  }
}
