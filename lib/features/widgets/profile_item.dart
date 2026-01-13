import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/resources/app_colors.dart';

class ProfileItem extends StatelessWidget {
  final String icon, title;
  const ProfileItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(AppColors.bottomNavBarColor),
          child: ListTile(
            leading: SvgPicture.asset(icon, width: 24, height: 24,),
            title: Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
            trailing: Icon(Icons.arrow_forward_ios,size: 24,),
          ),
        ),
        SizedBox(height: 16,)
      ],
    );
  }
}
