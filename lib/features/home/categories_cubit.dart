import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/network/dio_helper.dart';
import 'package:final_project/core/network/end_points.dart';
import 'package:final_project/models/category.dart';
import 'package:flutter/material.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  Future<void> getCategories() async {
    emit(CategoriesLoading());
    try {
      final Response response = await DioHelper.getRequest(endPoint: AppEndPoints.getCategories);
      List<Category> categories = (response.data as List).map((cat) => Category.fromJson(cat)).toList();
      if (categories.isEmpty) {
        emit(CategoriesFailure("Categories list is empty"));
      }
      else {
        emit(CategoriesSuccess(categories));
      }
    }
    catch (e) {
      emit(CategoriesFailure("Failed to get categories"));
    }
  }
}
