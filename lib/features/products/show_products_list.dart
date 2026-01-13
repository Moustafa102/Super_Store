import 'package:final_project/core/resources/app_loading.dart';
import 'package:final_project/features/products/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../core/resources/app_images.dart';
import '../../core/resources/app_product_item.dart';
import '../detailed_product/view.dart';

class ShowProductsList extends StatelessWidget {
  const ShowProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
            return Center(child: Text("No Products Found", style: TextStyle(color: Colors.red),),);
          }
          if (state is ProductsSuccess) {
            return SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
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
                    child: SizedBox(width: 130, child: ProductItem(dataObj: state.products[index],)),
                  ),
                ),
              ),
            );
          }
          return AppLoading();
        },
      ),
    );
  }
}
