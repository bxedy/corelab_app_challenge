import 'package:corelab_app_challenge/core/ui/components/width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/ui/theme/app_colors.dart';

class CustomSearchBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(widget.preferredSize.height),
      child: Container(
        color: AppColors.defaultCyan,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, right: 10, left: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Modular.to.pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.white,
                  ),
                ),
                const Width(10),
                const Expanded(
                  child: TextField(
                    cursorColor: AppColors.defaultCyan,
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide.none, // Removendo a cor da borda
                      ),
                      hintStyle: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
