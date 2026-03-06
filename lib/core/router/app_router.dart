import 'package:go_router/go_router.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/features/details/presentation/views/details_view.dart';
import 'package:newsandinsightapp/features/home/presentation/views/home_view.dart';

class AppRouter {
  static const String homeView = '/';
  static const String detailsView = '/detailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: homeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: detailsView,
        builder: (context, state) {
          final news = state.extra as NewsModel;
          return DetailsView(newsModel: news);
        },
      ),
    ],
  );
}
