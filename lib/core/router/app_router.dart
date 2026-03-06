import 'package:go_router/go_router.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/features/details/presentation/views/details_view.dart';
import 'package:newsandinsightapp/features/favorite/presentation/views/favorite_view.dart';
import 'package:newsandinsightapp/features/home/presentation/views/home_view.dart';
import 'package:newsandinsightapp/main_layout.dart';

class AppRouter {
  static const String homeView = '/homeView';
  static const String detailsView = '/detailsView';
  static const String favoriteView = '/favoriteView';

  static final router = GoRouter(
    initialLocation: homeView,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainLayout(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: homeView,
                builder: (context, state) => const HomeView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: favoriteView,
                builder: (context, state) => const FavoriteView(),
              ),
            ],
          ),
        ],
      ),
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
