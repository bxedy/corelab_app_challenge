import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dividerGrey,
      height: 1,
      width: double.infinity,
    );
  }
}
