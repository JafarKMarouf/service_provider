import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/main/presentation/view/categories/widgets/category_infos_minimum.dart';
import 'package:freelancer_app/features/main/presentation/view/categories/category_item_view.dart';
import 'package:get/get.dart' as g;
import 'package:freelancer_app/features/main/data/models/category_model/datum.dart';

class CategoriesGridView extends StatelessWidget {
  final List<Datum> data;

  const CategoriesGridView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: data.length < 3 ? 135 : 260,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        padding: const EdgeInsets.only(top: 15, bottom: 10),
        itemCount: data.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => g.Get.to(
            () => const CategoryItemView(),
            transition: g.Transition.fadeIn,
            duration: kDurationTransition,
          ),
          child: CategoryInfosMinimum(data: data[index]),
        ),
      ),
    );
  }
}
