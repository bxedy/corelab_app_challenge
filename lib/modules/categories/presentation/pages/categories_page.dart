import 'package:corelab_app_challenge/core/ui/components/app_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controller/categories_controller.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final ICategoriesController controller = Modular.get();

  @override
  Widget build(BuildContext context) => Scaffold(
    bottomNavigationBar: AppBottomNavigation(
      currentPage: AvailablePages.categories,
    ),
    body: Center(),
  );
}
