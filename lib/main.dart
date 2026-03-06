import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsandinsightapp/core/di/service_locator.dart';
import 'package:newsandinsightapp/core/router/app_router.dart';
import 'package:newsandinsightapp/core/theme/app_theme.dart';
import 'package:newsandinsightapp/core/utils/app_initializer.dart';
import 'package:newsandinsightapp/error_app.dart';
import 'package:newsandinsightapp/features/home/data/repo/home_repo.dart';
import 'package:newsandinsightapp/features/home/presentation/view_model/get_head_lines_cubit/get_head_lines_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final String? initError = await AppInitializer.init();
  if (initError != null) {
    // error widget if any error occurs in hive initialization
    runApp(ErrorApp(errorMessage: initError));
    return;
  }
  runApp(const NewsAndInsights());
}

class NewsAndInsights extends StatelessWidget {
  const NewsAndInsights({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetHeadLinesCubit(sl<HomeRepo>())..getHeadLines(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
