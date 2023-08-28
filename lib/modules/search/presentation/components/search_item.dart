import 'package:flutter/material.dart';

import '../../../../core/ui/components/width.dart';
import '../../../../core/ui/theme/app_colors.dart';
import '../../../../core/ui/theme/app_text_styles.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            children: [
              const Icon(
                Icons.history,
                color: AppColors.neutralGrey,
              ),
              const Width(14),
              Expanded(
                child: Text(
                  "Exemplo pesquisa recente",
                  style: AppTextStyles(weight: FontWeight.w400, color: AppColors.neutralGrey).large,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
