import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsandinsightapp/core/gen/assets.gen.dart';
import 'package:newsandinsightapp/core/theme/app_colors.dart';
import 'package:newsandinsightapp/core/theme/app_text_styles.dart';
import 'package:newsandinsightapp/core/utils/app_strings.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.homebackground.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          // const Icon(Icons.menu),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [AppColors.primaryColor, Colors.blue],
              ).createShader(bounds);
            },
            child: Text(
              AppStrings.appName,
              style: AppTextStyles.title.copyWith(color: Colors.white),
            ),
          ),
          // Icon(Icons.newspaper_sharp, color: AppColors.primaryColor),
        ],
      ),
    );
  }
}
