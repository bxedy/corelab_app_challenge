import 'package:corelab_app_challenge/core/ui/components/width.dart';
import 'package:corelab_app_challenge/core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/ui/components/app_snack_bar.dart';
import '../../../../core/ui/theme/app_colors.dart';
import '../controllers/search_controller.dart';

class CustomSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final SearchControlller controller;

  const CustomSearchBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.defaultCyan,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ValueListenableBuilder(
            valueListenable: controller.searchResults,
            builder: (context, searchResults, child) => Row(
              children: [
                InkWell(
                  onTap: () {
                    Modular.to.pop();
                    controller.undoSearch();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.white,
                  ),
                ),
                const Width(14),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SizedBox(
                        height: 44,
                        child: TextField(
                          onChanged: (value) {
                            if (value == "") {
                              controller.undoSearch();
                            } else {
                              controller.search(value);
                            }
                          },
                          cursorColor: AppColors.defaultCyan,
                          controller: controller.searchTextEditingController,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.undoSearch();
                              },
                              child: Visibility(
                                visible: searchResults.isNotEmpty,
                                child: const Icon(
                                  Icons.close,
                                  color: AppColors.grey2,
                                ),
                              ),
                            ),
                            suffixIconConstraints: const BoxConstraints(maxHeight: 24),
                            border: InputBorder.none,
                            hintText: '',
                            hintStyle: const TextStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (searchResults.isNotEmpty) ...[
                  const Width(14),
                  InkWell(
                    onTap: () => showSnackBar(context: context, message: "Indisponível no momento"),
                    child: Text(
                      "Filtros",
                      style: AppTextStyles(weight: FontWeight.w700, color: AppColors.white).small,
                    ),
                  )
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
