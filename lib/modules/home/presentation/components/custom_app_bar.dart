import 'package:corelab_app_challenge/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/ui/theme/app_colors.dart';
import '../../../../core/ui/theme/app_text_styles.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(widget.preferredSize.height),
      child: Container(
        color: AppColors.defaultCyan,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Modular.to.pushNamed(AppRoutes.search);
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                height: 38,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Buscar',
                        style: AppTextStyles(color: AppColors.grey, weight: FontWeight.w400).medium,
                      ),
                      const Icon(Icons.search, color: AppColors.defaultCyan),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
