import 'package:final_project/core/resources/app_icons.dart';
import 'package:final_project/core/resources/app_product_item.dart';
import 'package:final_project/features/auth/register/view.dart';
import 'package:final_project/features/products/view.dart';
import 'package:final_project/features/profile/view.dart';
import 'package:final_project/features/search/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/resources/app_colors.dart';
import '../auth/login/view.dart';
import '../home/view.dart';

class HomeNav extends StatefulWidget {
  int? currentIndex;
  HomeNav({super.key, this.currentIndex});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  List<Widget> screens = [Home(), SearchView(), ShowProducts(), Profile()];
  int currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    if (widget.currentIndex != null) {
      currentScreen = widget.currentIndex!;
      widget.currentIndex = null;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentScreen,
        selectedItemColor: Color(AppColors.primaryColor),
        unselectedItemColor: Color(AppColors.navBarItemColor),
        selectedLabelStyle: TextStyle(color: Color(AppColors.primaryColor)),
        unselectedLabelStyle: TextStyle(
          color: Color(AppColors.navBarItemColor),
        ),
        onTap: (value) {
          setState(() {
            currentScreen = value;
          });
        },
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.home,
              colorFilter: ColorFilter.mode(
                currentScreen == 0
                    ? Color(AppColors.primaryColor)
                    : Color(AppColors.navBarItemColor),
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.search,
              colorFilter: ColorFilter.mode(
                currentScreen == 1
                    ? Color(AppColors.primaryColor)
                    : Color(AppColors.navBarItemColor),
                BlendMode.srcIn,
              ),
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.bag,
              colorFilter: ColorFilter.mode(
                currentScreen == 2
                    ? Color(AppColors.primaryColor)
                    : Color(AppColors.navBarItemColor),
                BlendMode.srcIn,
              ),
            ),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.user,
              colorFilter: ColorFilter.mode(
                currentScreen == 3
                    ? Color(AppColors.primaryColor)
                    : Color(AppColors.navBarItemColor),
                BlendMode.srcIn,
              ),
            ),
            label: "Profile",
          ),
        ],
        // backgroundColor: Color(AppColors.bottomNavBarColor),
      ),
      body: screens[currentScreen],
    );
  }
}
