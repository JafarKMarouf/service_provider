part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final CategoryModel category;
  const CategorySuccess({required this.category});
}

final class CategoryFailure extends CategoryState {
  final String errMessage;
  const CategoryFailure({required this.errMessage});
}
