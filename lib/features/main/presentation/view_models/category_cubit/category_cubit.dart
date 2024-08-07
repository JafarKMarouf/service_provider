import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/main/data/models/category_model/category_model.dart';
import 'package:freelancer_app/features/main/data/repos/category_repo/category_repo_impl.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepoImpl categoryRepoImpl;

  CategoryCubit(this.categoryRepoImpl) : super(CategoryInitial());

  Future<void> fetchCategories() async {
    emit(CategoryLoading());
    var result = await categoryRepoImpl.fetchCategories();
    result.fold(
      (fail) => emit(CategoryFailure(errMessage: fail.errMessage)),
      (category) => emit(CategorySuccess(category: category)),
    );
  }
}
