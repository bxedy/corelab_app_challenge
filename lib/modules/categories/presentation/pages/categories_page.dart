import '../../../../core/ui/theme/app_colors.dart';
import '../../../../core/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/ui/components/app_bottom_navigation_bar.dart';
import '../controller/categories_controller.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final ICategoriesController controller = Modular.get();

  final List<String> categories = [
    "Anestésicos e Agulhas Gengival",
    "Biossegurança",
    "Descartáveis",
    "Dentística e Estética",
    "Ortodontia",
    "Endodontia",
    "Periféricos e Peças de Mão",
    "Moldagem",
    "Prótese",
    "Cimentos",
    "Instrumentos",
    "Cirurgia e Periodontia",
    "Radiologia"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgrounColor,
      bottomNavigationBar: const AppBottomNavigation(currentPage: AvailablePages.categories),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Categorias",
                  style: AppTextStyles().huge,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  border: Border.symmetric(
                    horizontal: BorderSide(color: AppColors.dividerGrey),
                  ),
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => Material(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        child: Text(
                          categories[index],
                          style: AppTextStyles(color: AppColors.defaultCyan, weight: FontWeight.w400).larger,
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      color: AppColors.dividerGrey,
                      height: 1,
                      width: double.infinity,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
