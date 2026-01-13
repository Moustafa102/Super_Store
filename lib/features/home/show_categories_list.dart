import 'package:final_project/core/resources/app_loading.dart';
import 'package:final_project/features/home/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../core/resources/app_product_item.dart';

class ShowCategoriesList extends StatelessWidget {
  const ShowCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getCategories(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return SizedBox(
              height: 150,
              child: Center(
                child: Lottie.asset("assets/json/loading.json"),
              ),
            );
          }
          if (state is CategoriesFailure) {
            return Center(child: Text("No Categories Found", style: TextStyle(color: Colors.red),),);
          }
          if (state is CategoriesSuccess) {
            return SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) =>
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SizedBox(width: 130, child: ProductItem(dataObj: state.categories[index],)),
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
