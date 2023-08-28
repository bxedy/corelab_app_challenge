import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/ui/theme/app_colors.dart';
import '../controllers/search_controller.dart';

class CustomSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final SearchControlller controller;

  const CustomSearchBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.defaultCyan,
      automaticallyImplyLeading: false,
      leading: InkWell(
        onTap: () {
          Modular.to.pop();
          controller.undoSearch();
        },
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.white,
        ),
      ),
      title: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            onChanged: (value) {
              if (value == "") {
                controller.undoSearch();
                controller.fetchHistory();
              } else {
                controller.fetchSearch(value);
              }
            },
            cursorColor: AppColors.defaultCyan,
            controller: controller.searchTextEditingController,
            autofocus: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Pesquisar',
              hintStyle: TextStyle(
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
