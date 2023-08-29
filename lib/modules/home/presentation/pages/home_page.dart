import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/domain/enums/page_state_enum.dart';
import '../../../../core/ui/components/app_bottom_navigation_bar.dart';
import '../../../../core/ui/components/app_divider.dart';
import '../../../../core/ui/components/height.dart';
import '../../../../core/ui/theme/app_colors.dart';
import '../../../../core/ui/theme/app_text_styles.dart';
import '../../../shared/presentation/components/product_widget.dart';
import '../../../shared/presentation/components/products_shimmer_skeleton_widget.dart';
import '../components/custom_app_bar.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>()..fetchData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgrounColor,
      appBar: const CustomAppBar(),
      bottomNavigationBar: const AppBottomNavigation(currentPage: AvailablePages.home),
      body: SafeArea(
        child: SingleChildScrollView(
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
              const Height(10),
              ValueListenableBuilder(
                valueListenable: controller.pageState,
                builder: (context, state, child) {
                  return state == PageState.success
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.productsList!.length,
                          itemBuilder: (context, index) {
                            final list = controller.productsList!;
                            final item = controller.productsList![index];

                            if (index == 0 || list[index].dataAnuncio != list[index - 1].dataAnuncio) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Height(10),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text(
                                      item.dataAnuncio,
                                      style: AppTextStyles(color: AppColors.tertiaryGray).small,
                                    ),
                                  ),
                                  const Height(10),
                                  const AppDivider(),
                                  ProductWidget(productEntity: item),
                                  const AppDivider()
                                ],
                              );
                            } else {
                              return Column(
                                children: [
                                  ProductWidget(productEntity: item),
                                  const AppDivider(),
                                ],
                              );
                            }
                          },
                        )
                      : const ProductsShimmerSkeletonWidget();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
