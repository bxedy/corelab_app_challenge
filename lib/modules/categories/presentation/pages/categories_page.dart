import 'package:corelab_app_challenge/core/ui/components/app_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/ui/components/app_bottom_navigation_bar.dart';
import '../../../../core/ui/theme/app_colors.dart';
import '../../../../core/ui/theme/app_text_styles.dart';
import '../controller/categories_controller.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final CategoriesController controller = Modular.get();

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
  ]; // TODO: supondo que devera vir do back, sera preciso passar esses dados para o data layer

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
                  itemBuilder: (context, index) {
                    final item = categories[index];
                    return _CategoryItem(
                      categoryName: item,
                      onTap: () => controller.searchForCategory(item),
                    );
                  },
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: AppDivider(),
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

class _CategoryItem extends StatelessWidget {
  final String categoryName;
  final VoidCallback onTap;

  const _CategoryItem({
    Key? key,
    required this.categoryName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Text(
            categoryName,
            style: AppTextStyles(color: AppColors.defaultCyan, weight: FontWeight.w400).larger,
          ),
        ),
      ),
    );
  }
}
