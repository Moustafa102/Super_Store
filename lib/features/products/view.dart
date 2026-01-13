import 'package:final_project/core/resources/app_product_item.dart';
import 'package:final_project/features/products/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../core/resources/app_colors.dart';
import '../../core/resources/app_loading.dart';
import '../detailed_product/view.dart';

class ShowProducts extends StatelessWidget {
  const ShowProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              backgroundColor: Color(AppColors.bottomNavBarColor),
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
        title: Text(
          "Products",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => ProductsCubit()..getProducts(),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return SizedBox(
                height: 150,
                child: Center(
                  child: Lottie.asset("assets/json/loading.json"),
                ),
              );;
            }
            if (state is ProductsFailure) {
              return Center(
                child: Text(
                  "No Products Found",
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
            if (state is ProductsSuccess) {
              return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: 12,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailedProduct(
                        image: state.products[index].images?[0],
                        title: state.products[index].title,
                        description: state.products[index].description,
                        price: state.products[index].price,
                        rating: 4.5,
                      ),
                    ),
                  ),
                  child: ProductItem(
                    hasPlusIcon: true,
                    dataObj: state.products[index],
                  ),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
              );
            }
            return AppLoading();
          },
        ),
      ),
    );
  }
}
