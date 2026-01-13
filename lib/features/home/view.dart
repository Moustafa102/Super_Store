import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:final_project/core/resources/app_colors.dart';
import 'package:final_project/core/resources/app_field.dart';
import 'package:final_project/core/resources/app_icons.dart';
import 'package:final_project/core/resources/app_images.dart';
import 'package:final_project/core/resources/app_main_image.dart';
import 'package:final_project/core/resources/app_product_item.dart';
import 'package:final_project/features/detailed_product/view.dart';
import 'package:final_project/features/home/show_categories_list.dart';
import 'package:final_project/features/home_nav/view.dart';
import 'package:final_project/features/products/products_cubit.dart';
import 'package:final_project/features/products/show_products_list.dart';
import 'package:final_project/features/products/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> sliderItems = [
    MainImage(),
    MainImage(),
    MainImage(),
    MainImage(),
    MainImage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 22,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(AppImages.profile),
                  ),
                  title: Text(
                    "Hello!",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                  subtitle: Text(
                    "John William",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Color(AppColors.bottomNavBarColor),
                    child: SvgPicture.asset(AppIcons.bell),
                  ),
                ),

                // AppField(
                //   hasLabel: false,
                //   hint: Row(
                //     spacing: 10,
                //     children: [
                //       SvgPicture.asset(AppIcons.search),
                //       Text(
                //         "Search here",
                //         style: TextStyle(
                //           fontSize: 16,
                //           color: Color(AppColors.textFieldColor),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeNav(currentIndex: 1),
                    ),
                  ),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(AppColors.textFieldBorderColor),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        spacing: 10,
                        children: [
                          SvgPicture.asset(AppIcons.search),
                          Text(
                            "Search here",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(AppColors.textFieldColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 135,
                    viewportFraction: 0.85,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: sliderItems.map((image) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: image,
                    );
                  }).toList(),
                ),
                DotsIndicator(
                  dotsCount: sliderItems.length,
                  position: _currentIndex.toDouble(),
                  decorator: DotsDecorator(
                    size: const Size.square(8),
                    activeSize: const Size(18, 8),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Colors.grey.shade400,
                    activeColor: Colors.blue,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 150,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 5,
                //     itemBuilder: (context, index) => Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 8),
                //       child: SizedBox(width: 130, child: ProductItem()),
                //     ),
                //   ),
                // ),
                ShowCategoriesList(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most Popular",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ShowProducts()),
                      ),
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(AppColors.primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
                ShowProductsList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
