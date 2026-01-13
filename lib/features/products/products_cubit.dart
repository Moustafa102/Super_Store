import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../core/network/dio_helper.dart';
import '../../core/network/end_points.dart';
import '../../models/product.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  Future<void> getProducts({String? searchItem}) async {
    emit(ProductsLoading());
    try {
      final Response response = await DioHelper.getRequest(endPoint: AppEndPoints.getProducts, param: searchItem);
      print("response = $response");
      List<Product> products = (response.data as List).map((pro) => Product.fromJson(pro)).toList();
      print("products = $products");
      if (products.isEmpty) {
        emit(ProductsFailure("Products list is empty"));
      }
      else {
        emit(ProductsSuccess(products));
      }
    }
    catch (e) {
      emit(ProductsFailure("Failed to get Products"));
    }
  }
}
