import 'package:flutter/material.dart';

import '../../../../core/ui/components/height.dart';
import '../../../../core/ui/theme/app_colors.dart';
import '../../../../core/ui/theme/app_images.dart';
import '../../../../core/ui/theme/app_text_styles.dart';

class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 335,
        child: Column(
          children: [
            const Height(80),
            AppImages.noResults.image(height: 180),
            const Height(20),
            Text(
              "Resultado não encontrado",
              style: AppTextStyles().larger,
              textAlign: TextAlign.center,
            ),
            const Height(10),
            Text(
              "Não encontramos nenhum resultado parecido com \"chinelo\".",
              style: AppTextStyles(color: AppColors.neutralGrey).medium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
