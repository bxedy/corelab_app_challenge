import 'package:cached_network_image/cached_network_image.dart';
import 'package:corelab_app_challenge/core/ui/components/width.dart';
import 'package:corelab_app_challenge/core/ui/theme/app_colors.dart';
import 'package:corelab_app_challenge/core/ui/theme/app_text_styles.dart';
import 'package:corelab_app_challenge/modules/home/presentation/components/search_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui/components/app_bottom_navigation_bar.dart';
import '../../../../core/ui/components/height.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: const AppBottomNavigation(currentPage: AvailablePages.home),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Height(24),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                "Últimos anúncios",
                style: AppTextStyles().larger,
              ),
            ),
            const Height(20),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                'Hoje',
                style: AppTextStyles(color: AppColors.neutralGrey).small,
              ),
            ),
            const Height(10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return const ItemWidget();
              },
            )
          ],
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border.symmetric(
            //   horizontal: BorderSide(width: 0.5, color: AppColors.neutralGrey),
            ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            CachedNetworkImage(
              width: 100,
              height: 100,
              fit: BoxFit.fitHeight,
              imageUrl:
                  "https://cdn.dentalcremer.com.br/produtos/550/condicionador-acido-fosforico-37-allprime-859980-01-dental-cremer.jpg",
            ),
            const Width(16),
            Container(
              width: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (true) ...[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        child: Text(
                          "10% OFF",
                          style: AppTextStyles(color: AppColors.white).tiny,
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.defaultCyan,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                    ),
                    const Height(6)
                  ],
                  Text(
                    "Condicionador Ácido Fosfórico 37% - AllPrime",
                    style: AppTextStyles(weight: FontWeight.w400).medium,
                  ),
                  const Height(6),
                  if (true) ...[
                    Text(
                      "R\$29,90",
                      style: AppTextStyles(color: AppColors.neutralGrey).small.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                    )
                  ],
                  Text(
                    "R\$29,90",
                    style: AppTextStyles().larger,
                  ),
                  Text(
                    "Em até 12x de R\$ 249,00",
                    style: AppTextStyles(color: AppColors.defaultCyan, weight: FontWeight.w400).small,
                  ),
                  const Height(6),
                  Text(
                    "Novo",
                    style: AppTextStyles(color: AppColors.neutralGrey).smaller,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
