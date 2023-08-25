import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/ui/components/app_snack_bar.dart';
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

  onUnavaiableFeatureTap() => showSnackBar(context: context, message: "unavailableFunctionality".i18n());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Platform.isIOS ? 20 : 0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 80),
        child: Row(
          children: [
            _buttonNavigation(
              icon: AppIcons.home,
              label: 'home'.i18n(),
              isSelected: widget.currentPage == AvailablePages.home,
              onTap: onHomeTap,
            ),
            _buttonNavigation(
              icon: AppIcons.categories,
              label: 'categories'.i18n(),
              isSelected: widget.currentPage == AvailablePages.categories,
              onTap: onCategoriesTap,
            ),
            _buttonNavigation(
              icon: AppIcons.announce,
              label: 'announce'.i18n(),
              isSelected: widget.currentPage == AvailablePages.announce,
              onTap: onUnavaiableFeatureTap,
            ),
            _buttonNavigation(
              icon: AppIcons.favorite,
              label: 'favorites'.i18n(),
              isSelected: widget.currentPage == AvailablePages.favorites,
              onTap: onUnavaiableFeatureTap,
            ),
            _buttonNavigation(
              icon: AppIcons.user,
              label: 'account'.i18n(),
              isSelected: widget.currentPage == AvailablePages.account,
              onTap: onUnavaiableFeatureTap,
            ),
          ],
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
          children: [
            const Height(12),
            icon.icon(color: isSelected ? Colors.blue : Colors.grey, width: 32, height: 32),
            Text(
              label,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400, color: isSelected ? Colors.blue : Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
