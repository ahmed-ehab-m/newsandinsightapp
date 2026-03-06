import 'package:go_router/go_router.dart';
import 'package:newsandinsightapp/features/home/presentation/views/home_view.dart';

class AppRouter {
  static const String homeView = '/';
  static final router = GoRouter(
    routes: [
      GoRoute(path: homeView, builder: (context, state) => const HomeView()),
    ],
  );
}
