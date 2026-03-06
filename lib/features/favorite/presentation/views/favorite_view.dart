import 'package:flutter/material.dart';
import 'package:newsandinsightapp/features/favorite/presentation/views/widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: FavoriteViewBody()));
  }
}
