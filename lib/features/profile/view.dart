import 'package:final_project/core/resources/app_images.dart';
import 'package:final_project/core/resources/cache_helper.dart';
import 'package:final_project/features/auth/login/view.dart';
import 'package:final_project/features/splash/view.dart';
import 'package:final_project/features/widgets/profile_item.dart';
import 'package:flutter/material.dart';

import '../../core/resources/app_icons.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(AppImages.user, width: 99, height: 93),
                      Text(
                        "Moustafa Shokry",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 42),
                      ProfileItem(icon: AppIcons.userProfile, title: "Profile"),
                      ProfileItem(icon: AppIcons.settings, title: "Setting"),
                      ProfileItem(icon: AppIcons.mail, title: "Contact"),
                      ProfileItem(icon: AppIcons.share, title: "Share App"),
                      ProfileItem(icon: AppIcons.help, title: "Help"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    CacheHelper.deleteToken();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
                  },
                  child: Text(
                    "Sign Out",
                    style: TextStyle(
                      color: Color(0xffF55F1F),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
