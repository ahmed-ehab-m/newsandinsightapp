import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsandinsightapp/core/utils/app_sizes.dart';
import 'package:newsandinsightapp/features/home/presentation/view_model/get_category_news_cubit/get_category_news_cubit.dart';
import 'package:newsandinsightapp/features/home/presentation/view_model/get_head_lines_cubit/get_head_lines_cubit.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/category_list_view.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/general_top_headlines_widget.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/home_view_app_bar.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/selected_items_section.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final ScrollController verticalScrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verticalScrollController.addListener(onVerticalScroll);
  }

  // for pagination
  void onVerticalScroll() {
    final maxScroll = verticalScrollController.position.maxScrollExtent;
    final currentScroll = verticalScrollController.position.pixels;
    //0.9 for better UX
    if (currentScroll >= (maxScroll * 0.9)) {
      context.read<GetCategoryNewsCubit>().getCategoryNews(
        category: context
            .read<GetCategoryNewsCubit>()
            .currentCategory, // التريكة اللي عملناها المرة اللي فاتت
      );
    }
  }

  @override
  void dispose() {
    verticalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.screenPadding,
      child: RefreshIndicator(
        onRefresh: () async {
          final categoryCubit = context.read<GetCategoryNewsCubit>();
          await Future.wait([
            BlocProvider.of<GetHeadLinesCubit>(
              context,
            ).getHeadLines(isRefresh: true),

            BlocProvider.of<GetCategoryNewsCubit>(context).getCategoryNews(
              category: categoryCubit.currentCategory,
              isRefresh: true,
            ),
          ]);
        },
        child: CustomScrollView(
          controller: verticalScrollController,
          slivers: [
            SliverToBoxAdapter(child: HomeViewAppBar()),
            GeneralTopHeadlinesWidget(),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            CategoryListView(),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SelectedItemsSection(),
          ],
        ),
      ),
    );
  }
}
