import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:final_project/core/resources/app_loading.dart';
import 'package:final_project/core/resources/snack_bar.dart';
import 'package:final_project/features/products/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../core/resources/app_colors.dart';
import '../../core/resources/app_product_item.dart';
import '../../models/product.dart';

class SearchResults extends StatelessWidget {
  final String input;

  const SearchResults({super.key, required this.input});
  @override
  Widget build(BuildContext context) {
    List<Product> products = [];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              backgroundColor: Color(AppColors.iconBackgroundColor),
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),),
      body: BlocProvider(
        create: (context) => ProductsCubit()..getProducts(searchItem: input),
        child: BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {
            if (state is ProductsFailure) {
              Navigator.pop(context);
              // mySnackBar(msg: "Something wrong happened, try again", type: AnimatedSnackBarType.error, context: context);
              mySnackBar(msg: "No products found", type: AnimatedSnackBarType.warning, context: context);
            }
          },
          builder: (context, state) {
            if (state is ProductsLoading) {
              return SizedBox(
                height: 150,
                child: Center(
                  child: Lottie.asset("assets/json/loading.json"),
                ),
              );;
            }
            if (state is ProductsSuccess) {
              products = state.products;

            }
            return SafeArea(
              child: Padding(padding: const EdgeInsets.all(16), child:
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Results for ",
                            style: TextStyle(
                                color: Color(0xff817F7F),
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(
                            '" $input "',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            ),
                          )
                        ],
                      ),
                      Text(
                        "${products.length} Results Found",
                        style: TextStyle(
                            color: Color(AppColors.primaryColor),
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16,),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: products.length,
                      itemBuilder: (context, index) =>
                          ProductItem(hasPlusIcon: true, dataObj: products[index],),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.75,
                      ),
                    ),
                  ),
                ],
              )
              ),
            );
          },
        ),
      ),
    );
  }
}
