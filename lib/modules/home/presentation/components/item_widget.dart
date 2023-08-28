import 'package:cached_network_image/cached_network_image.dart';
import 'package:corelab_app_challenge/modules/home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui/components/height.dart';
import '../../../../core/ui/components/width.dart';
import '../../../../core/ui/theme/app_colors.dart';
import '../../../../core/ui/theme/app_text_styles.dart';

class ItemWidget extends StatelessWidget {
  final ProductEntity productEntity;
  const ItemWidget({super.key, required this.productEntity});

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
            SizedBox(
              width: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (productEntity.precoAntigo != null) ...[
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.defaultCyan,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        child: Text(
                          "10% OFF",
                          style: AppTextStyles(color: AppColors.white).tiny,
                        ),
                      ),
                    ),
                    const Height(6)
                  ],
                  Text(
                    productEntity.titulo,
                    style: AppTextStyles(weight: FontWeight.w400).medium,
                  ),
                  const Height(6),
                  if (productEntity.precoAntigo != null) ...[
                    Text(
                      'R\$ ${productEntity.precoAntigo}',
                      style: AppTextStyles(color: AppColors.neutralGrey).small.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                    )
                  ],
                  Text(
                    'R\$ ${productEntity.preco}',
                    style: AppTextStyles().larger,
                  ),
                  Text(
                    "Em até ${productEntity.parcelas.quantidade}x de R\$ ${productEntity.parcelas.precoParcela}",
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
