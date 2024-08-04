import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/widgets/custome_search_arrowback_bar.dart';
import 'package:freelancer_app/features/main/presentation/view_models/category_cubit/category_cubit.dart';
import 'package:freelancer_app/features/main/data/models/category_model/category_datum.dart';
import 'package:shimmer/shimmer.dart';

import 'widgets/categories_grid_view.dart';

class CategoriesListView extends StatelessWidget {
  final bool loading;
  const CategoriesListView({super.key, this.loading = true});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryCubit>(context).fetchCategories();
    List<CategoryDatum> categories = [];

    return Scaffold(
      body: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {
          if (state is CategorySuccess) {
            categories.addAll(state.category.data!.toList());
          }
        },
        builder: (context, state) => Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const AspectRatio(aspectRatio: 7),
              const CustomeSearchArrowBackBar(),
              const SizedBox(height: 6),
              const Text(
                'الخدمات',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              state is CategorySuccess
                  ? Expanded(child: CategoriesGridView(data: categories))
                  : Expanded(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: 15,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
