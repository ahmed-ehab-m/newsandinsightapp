import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsandinsightapp/core/utils/app_strings.dart';
import 'package:newsandinsightapp/features/home/presentation/view_model/get_category_news_cubit/get_category_news_cubit.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/category_list_item.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: AppStrings.categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                BlocProvider.of<GetCategoryNewsCubit>(
                  context,
                ).getCategoryNews(category: AppStrings.categories[index]);
              },
              child: CategoryListItem(
                isSelected: selectedIndex == index,
                categoryName: AppStrings.categories[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
