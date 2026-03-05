import 'package:flutter/material.dart';
import 'package:newsandinsightapp/core/utils/app_initializer.dart';
import 'package:newsandinsightapp/error_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final String? initError = await AppInitializer.init();
  if (initError != null) {
    // error widget if any error occurs in hive initialization
    runApp(ErrorApp(errorMessage: initError));
  }
  runApp(const NewsAndInsights());
}

class NewsAndInsights extends StatelessWidget {
  const NewsAndInsights({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
