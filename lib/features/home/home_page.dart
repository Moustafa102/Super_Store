import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_user.dart';
import '../../widgets/product_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomUser(),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffF8F7F7),
                borderRadius: BorderRadius.circular(30),
              ),
              height: 56,
              child: Row(
                children: [
                  SizedBox(width: 13),
                  Icon(Icons.search, color: Color(0xff5F5D5D)),
                  Text(
                    "Search here",
                    style: TextStyle(color: Color(0xff9B9999), fontSize: 16),
                  ),
                ],
              ),
            ),
          ),



          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  "Featured",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000000),
                  ),
                ),

                Text(
                  "See All",
                  style: TextStyle(fontSize: 16, color: Color(0xff6055D8)),
                ),
              ],
            ),
          ),

          Container(
            height: 170,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => ProductCustom(),
              scrollDirection: Axis.horizontal,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  "Most Popular",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000000),
                  ),
                ),

                Text(
                  "See All",
                  style: TextStyle(fontSize: 16, color: Color(0xff6055D8)),
                ),
              ],
            ),
          ),

          Container(
            height: 170,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => ProductCustom(),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),


      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff6055D8),
        unselectedItemColor: Color(0xff9E9E9E),
        selectedLabelStyle: TextStyle(color: Color(0xff6055D8)),
        unselectedLabelStyle: TextStyle(color: Color(0xff9E9E9E)),
        
        backgroundColor: Color(0xffF8F7F7),

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xff9E9E9E)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Color(0xff9E9E9E)),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: Color(0xff9E9E9E)),
            label: 'Shopping',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xff9E9E9E)),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
