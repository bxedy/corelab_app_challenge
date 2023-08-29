import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/ui/components/app_snack_bar.dart';
import '../theme/app_colors.dart';
import '../theme/app_icons.dart';
import 'height.dart';

enum AvailablePages {
  home,
  categories,
  announce,
  favorites,
  account,
}

class AppBottomNavigation extends StatefulWidget {
  final AvailablePages currentPage;

  const AppBottomNavigation({super.key, required this.currentPage});

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  onCategoriesTap() {
    Modular.to.pushNamed(AppRoutes.categories);
  }

  onHomeTap() {
    Modular.to.navigate(AppRoutes.home);
  }

  onUnavaiableFeatureTap() => showSnackBar(context: context, message: "Indisponível no momento");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.white,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 80),
          child: Row(
            children: [
              _buttonNavigation(
                icon: AppIcons.home,
                label: "Home",
                isSelected: widget.currentPage == AvailablePages.home,
                onTap: onHomeTap,
              ),
              _buttonNavigation(
                icon: AppIcons.categories,
                label: "Categorias",
                isSelected: widget.currentPage == AvailablePages.categories,
                onTap: onCategoriesTap,
              ),
              _buttonNavigation(
                icon: AppIcons.announce,
                label: "Anunciar",
                isSelected: widget.currentPage == AvailablePages.announce,
                onTap: onUnavaiableFeatureTap,
              ),
              _buttonNavigation(
                icon: AppIcons.favorite,
                label: "Favoritos",
                isSelected: widget.currentPage == AvailablePages.favorites,
                onTap: onUnavaiableFeatureTap,
              ),
              _buttonNavigation(
                icon: AppIcons.user,
                label: "Conta",
                isSelected: widget.currentPage == AvailablePages.account,
                onTap: onUnavaiableFeatureTap,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buttonNavigation({
    required String icon,
    required String label,
    void Function()? onTap,
    bool isSelected = false,
  }) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Column(
              children: [
                icon.icon(
                  color: isSelected ? AppColors.defaultCyan : Colors.grey,
                  width: 32,
                  height: 32,
                ),
                const Height(4),
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: isSelected ? AppColors.defaultCyan : Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
