import 'package:corelab_app_challenge/core/ui/components/app_divider.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui/components/height.dart';
import '../../../../core/ui/components/shimmer_widget.dart';
import '../../../../core/ui/components/width.dart';
import '../../../../core/ui/theme/app_colors.dart';

class ProductsShimmerSkeletonWidget extends StatelessWidget {
  const ProductsShimmerSkeletonWidget({super.key});

  Widget item() {
    return Column(
      children: [
        const AppDivider(),
        Container(
          color: AppColors.white,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                ShimmerWidget.rectangular(
                  width: 100,
                  height: 100,
                ),
                Width(16),
                SizedBox(
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerWidget.rectangular(height: 20, width: 200),
                      Height(6),
                      ShimmerWidget.rectangular(height: 20, width: 80),
                      Height(4),
                      ShimmerWidget.rectangular(height: 20, width: 170),
                      Height(6),
                      ShimmerWidget.rectangular(height: 20, width: 50),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => item(),
      itemCount: 10,
    );
  }
}
