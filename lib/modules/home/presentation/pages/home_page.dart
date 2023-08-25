import 'package:flutter/material.dart';

import '../../../../core/ui/components/app_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    final IHomeController controller = Modular.get();
    return const Scaffold(
      bottomNavigationBar: AppBottomNavigation(
        currentPage: AvailablePages.home,
      ),
      body: SafeArea(child: Center()),
    );
  }
}
