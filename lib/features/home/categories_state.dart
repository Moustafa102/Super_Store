part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}
final class CategoriesLoading extends CategoriesState {}
final class CategoriesSuccess extends CategoriesState {
  final List<Category> categories;
  CategoriesSuccess(this.categories);
}
final class CategoriesFailure extends CategoriesState {
  final String msg;
  CategoriesFailure(this.msg);
}
